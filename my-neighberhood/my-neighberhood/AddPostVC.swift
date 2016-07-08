//
//  AddPostVC.swift
//  my-neighberhood
//
//  Created by Kevin Amiranoff on 08/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var postImg: UIImageView!
  @IBOutlet weak var titleField: UITextField!
  @IBOutlet weak var descriptionField: UITextField!
  
  var imagePickerController:UIImagePickerController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    postImg.layer.cornerRadius = postImg.frame.size.width / 2
    postImg.clipsToBounds = true
    imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    


  }
 

  @IBAction func addPickBtnPressed(sender: UIButton) {
    sender.setTitle("", forState: .Normal)
    presentViewController(imagePickerController, animated: true, completion: nil)
  }
  
  @IBAction func makePostButtonPressed(sender: AnyObject) {
    if let title = titleField.text, let desc = descriptionField.text, let img = postImg.image {
      
      let imgPath = DataService.instance.saveImageAndCreatePath(img)
      let post = Post(imagePath: imgPath, title: title, description: desc)
      DataService.instance.addPost(post)
      dismissViewControllerAnimated(true, completion: nil)
    }
    
  
  }
  
  @IBAction func onCancelPressed(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  
  }

  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    imagePickerController.dismissViewControllerAnimated(true, completion: nil)
    postImg.image = image
  }
}

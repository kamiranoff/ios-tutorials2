//
//  ViewController.swift
//  Missing-persons
//
//  Created by Kevin Amiranoff on 12/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit
import ProjectOxfordFace

let baseUrl = "http://localhost:6069/img/"

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
  
  @IBOutlet weak var selectedImg: UIImageView!
  @IBOutlet weak var collectionView: UICollectionView!
  
  var selectedPerson:Person!
  var hasSelectedImage:Bool = false
  
  let imagePicker = UIImagePickerController()
  
  
  
  let missingPeople = [
    Person(personImageUrl:"person1.jpg"),
    Person(personImageUrl:"person2.jpg"),
    Person(personImageUrl:"person3.jpg"),
    Person(personImageUrl:"person4.jpg"),
    Person(personImageUrl:"person5.jpg"),
    Person(personImageUrl:"person6.png")
  ]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    imagePicker.delegate = self
    
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(loadPicker(_:)))
    tap.numberOfTapsRequired = 1
    selectedImg.addGestureRecognizer(tap)
    
  }



  
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return missingPeople.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCell
    
    let person = missingPeople[indexPath.row]
  
    cell.configureCell(person)
    
    return cell
  }
  
  
  
  
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    self.selectedPerson = missingPeople[indexPath.row]
    let cell = collectionView.cellForItemAtIndexPath(indexPath) as! PersonCell
    cell.configureCell(selectedPerson!)
    
    
    cell.setSelectedCell()
    
  }
  
  
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      selectedImg.image = pickedImage
      hasSelectedImage = true
    }
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func loadPicker(gesture: UITapGestureRecognizer) {
    imagePicker.allowsEditing = false
    
    //.Camera will crash on simulator but should be use on real device
    imagePicker.sourceType = .PhotoLibrary
    
    presentViewController(imagePicker,animated:true,completion:nil)
  
  }
  
  func showErrorAlert(){
    let alert = UIAlertController(title: "Select Person", message: "Please select a person", preferredStyle: UIAlertControllerStyle.Alert)
    let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Cancel,handler:nil)
    alert.addAction(ok)
    self.presentViewController(alert, animated: true, completion: nil)

  }
  

  @IBAction func checkForMatch(sender: AnyObject) {
  
    if selectedPerson == nil || hasSelectedImage == false {
      showErrorAlert()
    }else {
      if let myImg = selectedImg.image,let imgData = UIImageJPEGRepresentation(myImg, 0.8){
        FaceService.instance.client.detectWithData(imgData, returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil, completionBlock: { (faces:[MPOFace]!, err:NSError!) in
          if err == nil {
            var faceId:String?
            for face in faces {
              faceId = face.faceId
              break
            }
            
            if faceId != nil {
              FaceService.instance.client.verifyWithFirstFaceId(self.selectedPerson!.faceId, faceId2: faceId, completionBlock: { (result:MPOVerifyResult!, err:NSError!) in
                
                if err == nil {
                  print(result.confidence)
                  print(result.isIdentical)
                 
                  
                }else{
                 print(result.debugDescription)
                }
                
              })
            }
          }
        })
      }
      
      
    }
  
  }
  
  
}







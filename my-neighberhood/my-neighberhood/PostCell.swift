//
//  PostCell.swift
//  my-neighberhood
//
//  Created by Kevin Amiranoff on 08/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

  @IBOutlet weak var postImg:UIImageView!
  @IBOutlet weak var postTitle:UILabel!
  @IBOutlet weak var descLabel:UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    postImg.layer.cornerRadius = postImg.frame.size.width / 2
    postImg.clipsToBounds = true
    
    // Initialization code
  }

  func configureCell(post:Post){
    postTitle.text = post.title
    descLabel.text = post.postDesc
    postImg.image = DataService.instance.imageForPath(post.imagePath)
  }

}

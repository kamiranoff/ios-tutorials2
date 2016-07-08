//
//  ViewController.swift
//  my-neighberhood
//
//  Created by Kevin Amiranoff on 08/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var tableView:UITableView!
  
  
  var posts = DataService.instance.loadedPosts
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    DataService.instance.loadPosts()
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: "postsLoaded", object: nil)
  }


  
 
  //required functions to implement UITableViewDelegate
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  //required
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 86.0
  }
  
  //required
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataService.instance.loadedPosts.count
  }
  
  //required
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let post = DataService.instance.loadedPosts[indexPath.row]
    
    if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell{
      cell.configureCell(post)
      return cell
    }else{
      let cell = PostCell()
      cell.configureCell(post)
      return cell
    }
    
  }
  
  func onPostsLoaded(notif:AnyObject){
    tableView.reloadData()
  }
  


  
  
}


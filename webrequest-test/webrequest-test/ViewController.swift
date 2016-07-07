//
//  ViewController.swift
//  webrequest-test
//
//  Created by Kevin Amiranoff on 07/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  @IBOutlet weak var container: UIView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  override func viewDidAppear(animated: Bool) {
    let swiftReq = LoadWebRequest()
    swiftReq.loadWebView("https://github.com/matteocrippa/awesome-swift",container: container)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func loadSwift(sender: AnyObject) {
    let swiftReq = LoadWebRequest()
    swiftReq.loadWebView(Urls.swift.rawValue,container: container)

  }
  
  @IBAction func loadJavaScript(sender: AnyObject) {
    let javascriptRequest = LoadWebRequest()
    javascriptRequest.loadWebView(Urls.javascript.rawValue,container: container)

  
  }
  
  @IBAction func loadJava(sender: AnyObject) {
    let javaRequest = LoadWebRequest()
    javaRequest.loadWebView(Urls.java.rawValue,container: container)

  }
}


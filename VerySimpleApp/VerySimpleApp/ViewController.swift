//
//  ViewController.swift
//  VerySimpleApp
//
//  Created by Kevin Amiranoff on 29/06/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var psylockeImg: UIImageView!
  @IBOutlet weak var bgPsylocke: UIImageView!

  @IBOutlet weak var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    psylockeImg.hidden = true
    bgPsylocke.hidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func buttonAction(sender: AnyObject) {
    psylockeImg.hidden = false
    bgPsylocke.hidden = false
    button.hidden = true
    
  }

}


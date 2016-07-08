//
//  ViewController.swift
//  retro-calculator2
//
//  Created by Kevin Amiranoff on 01/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  @IBOutlet weak var outputLbl: UILabel!
  
  enum Operation:String {
    case Divide = "/"
    case Multiply = "*"
    case Subtract = "-"
    case Add = "+"
    case Empty = "Empty"
  }
  
  var btnSound: AVAudioPlayer!
  var runningNumber = ""
  var leftValStr = ""
  var rightValStr = ""
  var currentOperation: Operation = Operation.Empty
  var result = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let path = NSBundle.mainBundle().pathForResource("nice-job", ofType: "wav")
    let soundUrl = NSURL(fileURLWithPath: path!)
    
    do{
      try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
      btnSound.prepareToPlay()
      
    }catch let err as NSError{
      print(err.debugDescription)
    }
    
    
  }

  /*
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
 */
  
  @IBAction func numberPressed(btn:UIButton!){
    playSound()
  
    runningNumber += "\(btn.tag)"
    outputLbl.text = runningNumber
  }
  
  @IBAction func onDividePressed(sender: AnyObject) {
    processOperation(Operation.Divide)
  }

  @IBAction func onMultiplyPressed(sender: AnyObject) {
    processOperation(Operation.Multiply)
  }

  @IBAction func onSubtractPressed(sender: AnyObject) {
    processOperation(Operation.Subtract)
  }
  
  
  @IBAction func onAddPressed(sender: AnyObject) {
    processOperation(Operation.Add)
  }
  
  
  @IBAction func onEqualPressed(sender: AnyObject) {
    processOperation(currentOperation)
  }
  
  @IBAction func onClearPressed(sender: AnyObject) {
   runningNumber = ""
    leftValStr = ""
    rightValStr = ""
    result = ""
    currentOperation = Operation.Empty
    outputLbl.text = ""
    
  }
  
  
  func processOperation(op:Operation){
    
    playSound()
    
    
    if currentOperation != Operation.Empty{
      //Run some math
      
      //As user selected an operator, but then selected another operator without
      //first entering a number
      
      if runningNumber != ""{
        rightValStr = runningNumber
        runningNumber = ""
        
        if currentOperation == Operation.Multiply{
          result = "\(Double(leftValStr)! * Double(rightValStr)!)"
        }else if currentOperation == Operation.Divide{
          result = "\(Double(leftValStr)! / Double(rightValStr)!)"
        }else if currentOperation == Operation.Subtract{
          result = "\(Double(leftValStr)! - Double(rightValStr)!)"
        }else if currentOperation == Operation.Add{
          result = "\(Double(leftValStr)! + Double(rightValStr)!)"
        }
        
        leftValStr = result
        outputLbl.text = result
      }
      

      
      currentOperation = op
      
      
    }else{
      // this is the first time an oprator has been pressed
      leftValStr = runningNumber;
      runningNumber = ""
      currentOperation = op
    }
  }
  
  func playSound() {
    if btnSound.playing{
      btnSound.stop()
    }
    
    btnSound.play()
  }
  
  
  
}


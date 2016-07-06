//
//  ViewController.swift
//  myLittleMonster
//
//  Created by Kevin Amiranoff on 05/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  @IBOutlet weak var monsterImg: MonsterImg!
  @IBOutlet weak var foodImg: DragImg!
  @IBOutlet weak var heartImg: DragImg!
  
  @IBOutlet weak var penalty1Img: UIImageView!
  @IBOutlet weak var penalty2Img: UIImageView!
  @IBOutlet weak var penalty3Img: UIImageView!
  
  let DIM_ALPHA:CGFloat = 0.2
  let OPAQUE:CGFloat = 1.0
  let MAX_PENALTY = 3
  
  var penalties = 0
  var timer:NSTimer!
  var monsterHappy = false
  var currentItem:UInt32 = 0
  
  var musicPlayer:AVAudioPlayer!
  var sfxBite:AVAudioPlayer!
  var sfxHeart:AVAudioPlayer!
  var sfxDeath:AVAudioPlayer!
  var sfxSkull:AVAudioPlayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    foodImg.dropTarget = monsterImg
    heartImg.dropTarget = monsterImg
    
    setDimAlphaOnImg(DIM_ALPHA, img2Opacity: DIM_ALPHA, img3Opacity: DIM_ALPHA)
 
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
   
    
    do{
      let resourcePath = NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!
      let url = NSURL(fileURLWithPath: resourcePath)
      try musicPlayer = AVAudioPlayer(contentsOfURL: url )
      
      try sfxBite = AVAudioPlayer(contentsOfURL:NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
      
      try sfxHeart = AVAudioPlayer(contentsOfURL:NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
      
      try sfxDeath = AVAudioPlayer(contentsOfURL:NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
      
      try sfxSkull = AVAudioPlayer(contentsOfURL:NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
      
      musicPlayer.prepareToPlay()
      musicPlayer.play()
      
      sfxBite.prepareToPlay()
      sfxHeart.prepareToPlay()
      sfxSkull.prepareToPlay()
      sfxDeath.prepareToPlay()
      
    } catch let err as NSError{
      print(err.debugDescription)
    }
    
    startTimer()
  }
  
  func itemDroppedOnCharacter(notif:AnyObject){
    monsterHappy = true
    startTimer()
    
    setfoodImgState(DIM_ALPHA, foodUserInteraction: false)
    setHeartImgState(DIM_ALPHA, heartUserInteraction: false)
    
    if currentItem == 0 {
      sfxHeart.play()
    }else {
      sfxBite.play()
    }
  }
  
  func startTimer(){
    if timer != nil {
      timer.invalidate()
    }
    
    timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
  }
  
  func changeGameState() {
    
    if !monsterHappy{
      
      penalties += 1
      sfxSkull.play()
      
      if penalties == 1 {
        setDimAlphaOnImg(OPAQUE, img2Opacity: DIM_ALPHA, img3Opacity: DIM_ALPHA)
      }else if penalties == 2{
        setDimAlphaOnImg(OPAQUE, img2Opacity: OPAQUE, img3Opacity: DIM_ALPHA)
      }else if penalties >= 3{
        setDimAlphaOnImg(OPAQUE, img2Opacity: OPAQUE, img3Opacity: OPAQUE)
      }else{
        setDimAlphaOnImg(DIM_ALPHA, img2Opacity: DIM_ALPHA, img3Opacity: DIM_ALPHA)
      }
      
      if penalties >= MAX_PENALTY{
        gameOver()
      }
    }
    
    let rand = arc4random_uniform(2) //0 or 1
    
    if rand == 0{
      setfoodImgState(DIM_ALPHA, foodUserInteraction: false)
      setHeartImgState(OPAQUE, heartUserInteraction: true)
    }else{
      setfoodImgState(OPAQUE, foodUserInteraction: true)
      setHeartImgState(DIM_ALPHA, heartUserInteraction: false)
    }
    
    currentItem = rand
    monsterHappy = false
    

  }
  
  
  func gameOver(){
    timer.invalidate()
    monsterImg.playDeathAnimation()
    sfxDeath.play()
  }
  
  func setfoodImgState(foodOpacity:CGFloat,foodUserInteraction:Bool) {
    foodImg.alpha = foodOpacity
    foodImg.userInteractionEnabled = foodUserInteraction
  }
  
  func setHeartImgState(heartOpacity:CGFloat,heartUserInteraction:Bool){
    heartImg.alpha = heartOpacity
    heartImg.userInteractionEnabled = heartUserInteraction

  }

  func setDimAlphaOnImg(img1Opacity:CGFloat,img2Opacity:CGFloat,img3Opacity:CGFloat){
    penalty1Img.alpha = img1Opacity
    penalty2Img.alpha = img2Opacity
    penalty3Img.alpha = img3Opacity
  }


}


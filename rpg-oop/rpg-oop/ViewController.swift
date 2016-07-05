//
//  ViewController.swift
//  rpg-oop
//
//  Created by Kevin Amiranoff on 05/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var printLbl: UILabel!
  @IBOutlet weak var playerHpLbl: UILabel!
  @IBOutlet weak var enemyHpLbl: UILabel!
  @IBOutlet weak var enemyImg: UIImageView!
  @IBOutlet weak var chestBtn: UIButton!
  
  var player:Player!
  var enemy:Enemy!
  var chestMessage: String?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    player = Player(name: "Wolverine", hp:110, attackPwr: 20)
    
    generateRandomEnemy()
    
    playerHpLbl.text = "\(player.hp) HP"
    enemyHpLbl.text = getEnemyHpString()
    
    
  }

  func generateRandomEnemy(){
    let rand = Int(arc4random_uniform(2))
    
    if rand == 0{
      enemy = Kimara(startingHp: 50, attackPwr: 12)
    }else{
      enemy = DevilWizard(startingHp: 60, attackPwr: 15)
    }
    enemyImg.hidden = false
    enemyHpLbl.text = getEnemyHpString()
  }
  
  func getEnemyHpString() -> String{
    return "\(enemy.hp) HP"
  }

  @IBAction func onChestTapped(sender: AnyObject) {
    chestBtn.hidden = true
    printLbl.text = chestMessage
    NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats:false)  }
  
  @IBAction func attackTapped(sender: AnyObject) {
    if enemy.attemptAttack(player.attackPwr){
      printLbl.text = "\(enemy.type) for \(player.attackPwr) HHP"
      enemyHpLbl.text = getEnemyHpString()
    }else{
      printLbl.text = "Attack was unsuccessful"
    }
    
    if let loot = enemy.dropLoot(){
      player.addItemToInventory(loot)
      chestMessage = "\(player.name) found \(loot)"
      chestBtn.hidden = false
    }
    
    if !enemy.isAlive{
      enemyHpLbl.text = ""
      printLbl.text = "Killed \(enemy.type)"
      enemyImg.hidden = true
    }
    
  }

}


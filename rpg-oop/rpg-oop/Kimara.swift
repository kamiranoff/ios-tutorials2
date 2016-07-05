//
//  Kimara.swift
//  rpg-oop
//
//  Created by Kevin Amiranoff on 05/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation

class Kimara:Enemy {
  let IMMUNE_MAX = 15
  
  override var loot:[String]{
    return ["Tough hide","Kimara Venom","Rare Trident"]
  }
  
  override var type:String{
    return "Kimara"
  }
  
  override func attemptAttack(attackPwr: Int) -> Bool {
    if attackPwr >= IMMUNE_MAX{
      return super.attemptAttack(attackPwr)
    }else{
      return false
    }
  }
}
//
//  Ennemy.swift
//  rpg-oop
//
//  Created by Kevin Amiranoff on 05/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation


class Enemy: Character {
  
  var loot:[String]{
    return ["Rusty dagger","Cracked Buckler"]
  }
  
  var type:String{
    return "Grunt"
    
  }
  
  func dropLoot() -> String? {
    if !isAlive{
      let rand = Int(arc4random_uniform(UInt32(loot.count)))
      return loot[rand]
    }
    
    return nil
  }
}
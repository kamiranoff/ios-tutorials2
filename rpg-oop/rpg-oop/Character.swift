//
//  Character.swift
//  rpg-oop
//
//  Created by Kevin Amiranoff on 05/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation

class Character {
  private var _hp:Int = 100
  private var _attackPwr:Int = 10
  
  init(startingHp:Int, attackPwr:Int){
    self._hp = startingHp
    self._attackPwr = attackPwr
    
  }
  
  func attemptAttack(attackPwr:Int) -> Bool {
    self._hp -= attackPwr
    return true
  }
  
  //getters
  var attackPwr:Int{
    get{
      return _attackPwr
    }
  }
  
  
  var hp:Int{
    get{
      return _hp
    }
  }
  
  
  var isAlive:Bool{
    get{
      if hp <= 0{
        return false
      }else{
        return true
      }
    }
  }
}
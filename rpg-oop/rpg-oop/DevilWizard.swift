//
//  DevilWizard.swift
//  rpg-oop
//
//  Created by Kevin Amiranoff on 05/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation

class DevilWizard:Enemy  {
  
  override var loot: [String] {
    return ["Magic Wand","Dark Amulet","Salted Pork"]
  }
  
  override var type: String {
    return "Devil Wizard"
  }
}
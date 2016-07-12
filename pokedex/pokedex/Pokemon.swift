//
//  Pokemon.swift
//  pokedex
//
//  Created by Kevin Amiranoff on 12/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import Foundation


class Pokemon {
  private var _name:String!
  private var _pokedexId:Int!
  
  
  init(name:String,pokedexId:Int){
    self._name = name
    self._pokedexId = pokedexId
  }
  
  
  var name:String {
    get{
      return _name
    }
  }
  
  var pokedexId:Int {
    get{
      return _pokedexId
    }
  }
}
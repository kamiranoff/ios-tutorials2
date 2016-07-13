//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Kevin Amiranoff on 13/07/2016.
//  Copyright © 2016 Kevin Amiranoff. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {


  @IBOutlet weak var mainImg: UIImageView!
  @IBOutlet weak var secondEvoImg: UIImageView!
  @IBOutlet weak var thirdEvoImg: UIImageView!
  
  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var descriptionLbl: UILabel!
  @IBOutlet weak var typeLbl: UILabel!
  @IBOutlet weak var defenseLbl: UILabel!
  @IBOutlet weak var heightLbl: UILabel!
  @IBOutlet weak var pokedexIdLbl: UILabel!
  @IBOutlet weak var weightLbl: UILabel!
  @IBOutlet weak var baseAttackLbl: UILabel!
  @IBOutlet weak var nextEvolLbl: UILabel!
  
  
  
  
  var pokemon:Pokemon!
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
    nameLbl.text = pokemon.name
    let img = UIImage(named: "\(pokemon.pokedexId)")
    
    mainImg.image = img
    secondEvoImg.image = img
    
    pokemon.downloadPokeMonDetails { () -> () in
        //this will be called after download is done
      self.updateUI()
    }
      
      
  }

  func updateUI() {
      descriptionLbl.text = pokemon.description
      typeLbl.text = pokemon.type
      defenseLbl.text = pokemon.defense
      heightLbl.text = pokemon.height
      weightLbl.text = pokemon.weight
      pokedexIdLbl.text = "\(pokemon.pokedexId)"
      thirdEvoImg.image = UIImage(named: pokemon.nextEvolId)
      baseAttackLbl.text = pokemon.attack
    
    if pokemon.nextEvolId == "" {
      nextEvolLbl.text = "No evolutions"
      thirdEvoImg.hidden = true
    } else {
      thirdEvoImg.hidden = false
      thirdEvoImg.image = UIImage(named: pokemon.nextEvolId)
      var str = "Next Evolution: \(pokemon.nextEvolTxt)"
      
      if pokemon.nextEvolLvl != "" {
        str += " - LVL \(pokemon.nextEvolLvl)"
      }
      nextEvolLbl.text = str
    }
  }

  
  
  @IBAction func backBtnPressed(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  

}

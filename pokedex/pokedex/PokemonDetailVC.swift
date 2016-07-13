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
      mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
      
      pokemon.downloadPokeMonDetails { () -> () in
        //this will be called after download is done
      }
    }


  @IBAction func backBtnPressed(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  

}

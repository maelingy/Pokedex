//
//  PokemonViewController.swift
//  Pokédex
//
//  Created by Mae Ling Y on 10/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeNo: UILabel!
    @IBOutlet weak var pokeType: UILabel!
    @IBOutlet weak var pokeSpe: UILabel!
    @IBOutlet weak var pokeHeight: UILabel!
    @IBOutlet weak var pokeWeight: UILabel!
    @IBOutlet weak var pokeAbility: UILabel!
    @IBOutlet weak var pokeDesc: UILabel!
  
    var pokeDetail: Pokemon? {
        didSet {
            configureView()
        }
    }
 
    func configureView() {
        if let pokeDetail = pokeDetail {
            if let pokeName = pokeName,
                let pokeImage = pokeImage,
                let pokeNo = pokeNo,
                let pokeType = pokeType,
                let pokeSpe = pokeSpe,
                let pokeHeight = pokeHeight,
                let pokeWeight = pokeWeight,
                let pokeAbility = pokeAbility,
                let pokeDesc = pokeDesc {
                pokeName.text = pokeDetail.name
                pokeImage.image = UIImage(named: pokeDetail.image)
                pokeNo.text = pokeDetail.pokedexno
                
                let type = pokeDetail.type
                let type2 = pokeDetail.type2
                
                //checks if there's two types
                if type2 != "" {
                    pokeType.text = ("\(type), \(type2)")
                }
                    //tidying up, doesn't show "," if it's only one type
                else {
                    pokeType.text = pokeDetail.type
                }
                
                pokeSpe.text = pokeDetail.species
                pokeHeight.text = pokeDetail.height
                pokeWeight.text = pokeDetail.weight
                pokeAbility.text = pokeDetail.ability
                pokeDesc.text = pokeDetail.description
                
                title = "Pokédex Data"
            }
        }
    
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

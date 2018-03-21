//
//  Pokemon.swift
//  Pokédex
//
//  Created by Mae Ling Y on 10/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//


import Foundation
import UIKit

class pokemonList {
    
    struct Pokemon {
        var pokedexno: String
        var name: String
        var description: String
        var type: String
        var type2: String
        var ability: String
        var species: String
        var height: String
        var weight: String
        var icon: String
        var image: String
        var caught: Bool = false
        
        init() {
            pokedexno = ""
            name = ""
            description = ""
            type = ""
            type2 = ""
            ability = ""
            species = ""
            height = ""
            weight = ""
            icon  = ""
            image = ""
        }
    }
    
    let simpleTableIdentifier = "Pokemon"
    
    var pokemonArray = [Pokemon]()
    
    
    
    func populateTable() {
        var pokemon:Pokemon = Pokemon()
        
        if let path = Bundle.main.path(forResource: "Pokédex", ofType: "plist"), pokemonDict = NSDictionary(contentsOfFile: path) as? [String: [String: String]] {
            for (_, poke) in pokemonDict {
                pokemon.pokedexno = poke["pokedexno"]!
                pokemon.name = poke["name"]!
                pokemon.description = poke["description"]!
                pokemon.type = poke["type"]!
                pokemon.type2 = poke["type2"]!
                pokemon.ability = poke["ability"]!
                pokemon.species = poke["species"]!
                pokemon.height = poke["height"]!
                pokemon.weight = poke["weight"]!
                pokemon.icon = poke["icon"]!
                pokemon.image = poke["image"]!
                pokemonArray.append(pokemon)
            }
        }
    }
 
    
}


//
//  MasterViewController.swift
//  Pokédex
//
//  Created by Mae Ling Y on 10/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//

import UIKit

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

class MasterViewController: UITableViewController {
    
    var pokemonArray: [Pokemon] = []
    
    //MARK - Editing Tab
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        self.isEditing = !self.isEditing
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let itemToMove = pokemonArray[(fromIndexPath as NSIndexPath).row]
        pokemonArray.remove(at: (fromIndexPath as NSIndexPath).row)
        pokemonArray.insert(itemToMove, at: (toIndexPath as NSIndexPath).row)
    }
    
    
    var pokemonViewController: PokemonViewController? = nil
    let simpleTableIdentifier = "Pokemon"
    let pokemonMasterViewCellId = "MasterViewCellIdentifier"
//    var pokemonArray = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    
    let pokemonSegue = "DetailSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        populateTable()
        
        //Tab bar item color
        UITabBar.appearance().tintColor = UIColor.red
        var view: UITableView = self.tabBarController?.moreNavigationController.topViewController!.view as! UITableView
        view.tintColor = UIColor.red
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    var pokemon:Pokemon = Pokemon()
    
    func populateTable() {
        var pokemon:Pokemon = Pokemon()
        
        if let path = Bundle.main.path(forResource: "Pokédex", ofType: "plist"),
            pokemonDict = NSDictionary(contentsOfFile: path) as? [String: [String: String]] {
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
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: pokemonMasterViewCellId, for: indexPath)

        let type = pokemonArray[(indexPath as NSIndexPath).row].type
        let type2 = pokemonArray[(indexPath as NSIndexPath).row].type2
        
        let image = UIImage(named: pokemonArray[(indexPath as NSIndexPath).row].icon)
        cell.imageView?.image = image
        
        cell.textLabel!.text = pokemonArray[(indexPath as NSIndexPath).row].name
        //checks if there's two types
        if type2 != "" {
            cell.detailTextLabel!.text = ("\(type), \(type2)")
        }
        //tidying up, doesn't show "," if it's only one type
        else {
            cell.detailTextLabel!.text = pokemonArray[(indexPath as NSIndexPath).row].type
        }
     
        return cell
    }
    
    // MARK: - Segues
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                pokemon = pokemonArray[(indexPath as NSIndexPath).row]

                let controller = (segue.destination as! UINavigationController).topViewController as! PokemonViewController
                controller.pokeDetail = pokemon
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
 
}

 

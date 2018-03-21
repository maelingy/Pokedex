//
//  BadgeViewController.swift
//  Pokédex
//
//  Created by Mae Ling Y on 13/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController {

    @IBOutlet weak var boulderBadge: UIButton!
    @IBOutlet weak var cascadeBadge: UIButton!
    @IBOutlet weak var thunderBadge: UIButton!
    @IBOutlet weak var rainbowBadge: UIButton!
    @IBOutlet weak var soulBadge: UIButton!
    @IBOutlet weak var marshBadge: UIButton!
    @IBOutlet weak var volcanoBadge: UIButton!
    @IBOutlet weak var earthBadge: UIButton!
    
    var boulderCount = 0
    var cascadeCount = 0
    var thunderCount = 0
    var rainbowCount = 0
    var soulCount = 0
    var marshCount = 0
    var volcanoCount = 0
    var earthCount = 0
    
    var badges : Bool {
        get {
            return UserDefaults.standard.bool(forKey: "badges") ?? false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "badges")
        }
    }
    
    @IBAction func boulderBadge(_ sender: AnyObject) {
        let counter = boulderCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.boulderBadge.isSelected
            // set the badges button accordingly
            self.boulderBadge.isSelected = self.badges
            
            if let image = UIImage(named: "boulder") {
                boulderBadge.setImage(image, for: UIControlState())
                }
            print("boulder badge clicked")
            boulderCount += 1
        }
        else {
            //toggle the badge state
            self.badges = !self.boulderBadge.isSelected
            // set the badges button accordingly
            self.boulderBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyBoulder") {
                boulderBadge.setImage(image, for: UIControlState())
            }
            print("boulder badge clicked- empty")
            boulderCount += 1
        }
    }
    
    @IBAction func cascadeBadge(_ sender: AnyObject) {
        let counter = cascadeCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.cascadeBadge.isSelected
            // set the badges button accordingly
            self.cascadeBadge.isSelected = self.badges
        
            if let image = UIImage(named: "cascade") {
            cascadeBadge.setImage(image, for: UIControlState())
            }
            print("cascade badge clicked")
            cascadeCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.cascadeBadge.isSelected
            // set the badges button accordingly
            self.cascadeBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyCascade") {
                cascadeBadge.setImage(image, for: UIControlState())
            }
            print("cascade badge clicked- empty")
            cascadeCount += 1
        }
    }
    
    @IBAction func thunderBadge(_ sender: AnyObject) {
        let counter = thunderCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.thunderBadge.isSelected
            // set the badges button accordingly
            self.thunderBadge.isSelected = self.badges
            
            if let image = UIImage(named: "thunder") {
                thunderBadge.setImage(image, for: UIControlState())
            }
            print("thunder badge clicked")
            thunderCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.thunderBadge.isSelected
            // set the badges button accordingly
            self.thunderBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyThunder") {
                thunderBadge.setImage(image, for: UIControlState())
            }
            print("thunder badge clicked- empty")
            thunderCount += 1
        }
    }

    @IBAction func rainbowBadge(_ sender: AnyObject) {
        let counter = rainbowCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.rainbowBadge.isSelected
            // set the badges button accordingly
            self.rainbowBadge.isSelected = self.badges
            
            if let image = UIImage(named: "rainbow") {
                rainbowBadge.setImage(image, for: UIControlState())
            }
            print("rainbow badge clicked")
            rainbowCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.rainbowBadge.isSelected
            // set the badges button accordingly
            self.rainbowBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyRainbow") {
                rainbowBadge.setImage(image, for: UIControlState())
            }
            print("rainbow badge clicked- empty")
            rainbowCount += 1
        }
    }
    
    @IBAction func soulBadge(_ sender: AnyObject) {
        let counter = soulCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.soulBadge.isSelected
            // set the badges button accordingly
            self.soulBadge.isSelected = self.badges
            
            if let image = UIImage(named: "soul") {
                soulBadge.setImage(image, for: UIControlState())
            }
            print("soul badge clicked")
            soulCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.soulBadge.isSelected
            // set the badges button accordingly
            self.soulBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptySoul") {
                soulBadge.setImage(image, for: UIControlState())
            }
            print("soul badge clicked- empty")
            soulCount += 1
        }
    }
    
    @IBAction func marshBadge(_ sender: AnyObject) {
        let counter = marshCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.marshBadge.isSelected
            // set the badges button accordingly
            self.marshBadge.isSelected = self.badges
            
            if let image = UIImage(named: "marsh") {
                marshBadge.setImage(image, for: UIControlState())
            }
            print("marsh badge clicked")
            marshCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.marshBadge.isSelected
            // set the badges button accordingly
            self.marshBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyMarsh") {
                marshBadge.setImage(image, for: UIControlState())
            }
            print("marsh badge clicked- empty")
            marshCount += 1
        }
    }
    
    @IBAction func volcanoBadge(_ sender: AnyObject) {
        let counter = volcanoCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.volcanoBadge.isSelected
            // set the badges button accordingly
            self.volcanoBadge.isSelected = self.badges
            
            if let image = UIImage(named: "volcano") {
                volcanoBadge.setImage(image, for: UIControlState())
            }
            print("volcano badge clicked")
            volcanoCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.volcanoBadge.isSelected
            // set the badges button accordingly
            self.volcanoBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyVolcano") {
                volcanoBadge.setImage(image, for: UIControlState())
            }
            print("volcano badge clicked- empty")
            volcanoCount += 1
        }
    }
    
    @IBAction func earthBadge(_ sender: AnyObject) {
        let counter = earthCount % 2
        
        if counter == 0{
            //toggle the badge state
            self.badges = !self.earthBadge.isSelected
            // set the badges button accordingly
            self.earthBadge.isSelected = self.badges
            
            if let image = UIImage(named: "earth") {
                earthBadge.setImage(image, for: UIControlState())
            }
            print("earth badge clicked")
            earthCount+=1
        }
        else {
            //toggle the badge state
            self.badges = !self.earthBadge.isSelected
            // set the badges button accordingly
            self.earthBadge.isSelected = self.badges
            
            if let image = UIImage(named: "emptyEarth") {
                earthBadge.setImage(image, for: UIControlState())
            }
            print("earth badge clicked- empty")
            earthCount += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize the badges button to reflect the current state
        self.boulderBadge.isSelected = self.badges
        self.cascadeBadge.isSelected = self.badges
        self.thunderBadge.isSelected = self.badges
        self.rainbowBadge.isSelected = self.badges
        self.soulBadge.isSelected = self.badges
        self.marshBadge.isSelected = self.badges
        self.volcanoBadge.isSelected = self.badges
        self.earthBadge.isSelected = self.badges
        
        // set the titles for the badges button per state
        self.boulderBadge.setTitle("Badge", for: UIControlState())
        self.boulderBadge.setTitle("Badges", for: .selected)
        
        self.cascadeBadge.setTitle("Badge", for: UIControlState())
        self.cascadeBadge.setTitle("Badges", for: .selected)
        
        self.thunderBadge.setTitle("Badge", for: UIControlState())
        self.thunderBadge.setTitle("Badges", for: .selected)
        
        self.rainbowBadge.setTitle("Badge", for: UIControlState())
        self.rainbowBadge.setTitle("Badges", for: .selected)
        
        self.soulBadge.setTitle("Badge", for: UIControlState())
        self.soulBadge.setTitle("Badges", for: .selected)
        
        self.marshBadge.setTitle("Badge", for: UIControlState())
        self.marshBadge.setTitle("Badges", for: .selected)
        
        self.volcanoBadge.setTitle("Badge", for: UIControlState())
        self.volcanoBadge.setTitle("Badges", for: .selected)
        
        self.earthBadge.setTitle("Badge", for: UIControlState())
        self.earthBadge.setTitle("Badges", for: .selected)  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

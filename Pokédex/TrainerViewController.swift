//
//  TrainerViewController.swift
//  Pokédex
//
//  Created by Mae Ling Y on 13/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//

import UIKit

class TrainerViewController: UIViewController {

    
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var trainerGender: UILabel!
    @IBOutlet weak var favPoke: UILabel!
    @IBOutlet weak var pokeCaught: UILabel!
    @IBOutlet weak var friendCode: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    var timer = Timer()
    let userCalendar = Calendar.current
    
    @IBAction func onSettingsButtonTapped(_ sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func refreshFields() {
        let defaults = UserDefaults.standard
        trainerName.text  = defaults.string(forKey: trainerKey)
        trainerGender.text = defaults.string(forKey: genderKey)
        favPoke.text = defaults.string(forKey: favPokeKey)
        pokeCaught.text = defaults.string(forKey: pokeCaughtKey)
        friendCode.text = defaults.string(forKey: friendCodeKey)
    }
    
    func dateCounter() {
        let pokemonCountdownDateComponents = DateComponents()
        pokemonCountdownDateComponents.year = 2016
        pokemonCountdownDateComponents.month = 11
        pokemonCountdownDateComponents.day = 18
        pokemonCountdownDateComponents.hour = 0
        pokemonCountdownDateComponents.minute = 0
        (pokemonCountdownDateComponents as NSDateComponents).timeZone = TimeZone(identifier: "US/Eastern")
 
        let pokemonCountdownDate = userCalendar.date(from: pokemonCountdownDateComponents)!
    
        let timeLeft = pokemonCountdownDate.timeIntervalSinceNow

        if timeLeft > 0 {
            countdownLabel.text = ("                   \(timeLeft.time)")
        } else {
            timer.invalidate()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self,
                                                         selector: "applicationWillEnterForeground:",
                                                         name: NSNotification.Name.UIApplicationWillEnterForeground,
                                                         object: app)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: Selector("dateCounter"), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func applicationWillEnterForeground(_ notification:Notification) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


// For countdown
extension TimeInterval {
    var time:String {
        return String(format:"%02dd %02dh %02dm %02ds", Int((self/86400)),Int((self/3600.0).truncatingRemainder(dividingBy: 24)), Int((self/60.0).truncatingRemainder(dividingBy: 60)), Int((self).truncatingRemainder(dividingBy: 60) ))
    }
}

extension Date {
    var zeroSecond : Date {
        return (Calendar(identifier: Calendar.Identifier.gregorian)! as NSCalendar).date(bySettingHour: hour, minute: minute, second: 0, of: self, options: [])!
    }
    var nextRoundMinute : Date {
        return (Calendar(identifier: Calendar.Identifier.gregorian)! as NSCalendar).date(bySettingHour: Date().hour, minute: Date().minute+1, second: 0, of: Date(), options: [])!
    }
    
    var minute: Int {
        return (Calendar(identifier: Calendar.Identifier.gregorian)! as NSCalendar).component(NSCalendar.Unit.minute, from: self)
    }
    var hour: Int {
        return (Calendar(identifier: Calendar.Identifier.gregorian)! as NSCalendar).component(NSCalendar.Unit.hour, from: self)
        
    }
}

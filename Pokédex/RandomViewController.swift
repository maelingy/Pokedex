//
//  RandomViewController.swift
//  Pokédex
//
//  Created by Mae Ling Y on 16/05/2016.
//  Copyright © 2016 Umbrella Corp. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    fileprivate var images:[UIImage]!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var button: UIButton!
 //   private var winSoundID: SystemSoundID = 0
   // private var crunchSoundID: SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        images = [
            UIImage(named: "bulbasaurIcon")!,
            UIImage(named: "charmanderIcon")!,
            UIImage(named: "squirtleIcon")!,
            UIImage(named: "caterpieIcon")!,
            UIImage(named: "butterfreeIcon")!,
            UIImage(named: "kakunaIcon")!
        ]
        winLabel.text = " " // Note the space between the quotes
        arc4random_stir()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func spin(_ sender: AnyObject) {
        var win = false
        var numInRow = -1
        var lastVal = -1
        
        for i in 0..<1 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal {
                numInRow++
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            /*
            if numInRow >= 3 {
                win = true
            }
            */
        }
        
        /*
        if crunchSoundID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource(
                "crunch", withExtension: "wav")! as CFURLRef
            AudioServicesCreateSystemSoundID(soundURL, &crunchSoundID)
        }
        AudioServicesPlaySystemSound(crunchSoundID)
        */
        if win {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
                   //         self.playWinSound()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
                            self.showButton()
            }
        }
        button.isHidden = true
        winLabel.text = " " // Note the space between the quotes
    }
    
    func showButton() {
        button.isHidden = false
    }
    /*
    func playWinSound() {
        if winSoundID == 0 {
            let soundURL = NSBundle.mainBundle().URLForResource(
                "win", withExtension: "wav")! as CFURLRef
            AudioServicesCreateSystemSoundID(soundURL, &winSoundID)
        }
        AudioServicesPlaySystemSound(winSoundID)
        winLabel.text = "WINNER!"
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
            Int64(1.5 * Double(NSEC_PER_SEC))),
                       dispatch_get_main_queue()) {
                        self.showButton()
        }
    }
    */
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                               forComponent component: Int,
                                            reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }

}

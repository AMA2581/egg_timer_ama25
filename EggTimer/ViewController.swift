//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()

    func startTimer(input: Int) {
        var secondsRemaining = input

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            if secondsRemaining > 0 {
                print("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            } else {
                self.statusLable.text = "DONE!"
                Timer.invalidate()
            }
        }
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        self.statusLable.text = "How do you like your eggs?"

        timer.invalidate()
        startTimer(input: eggTimes[hardness]!)

//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else if hardness == "Hard" {
//            print(hardTime)
//        }

//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("error")
//        }
    }
    @IBOutlet weak var statusLable: UILabel!
}

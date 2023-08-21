//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var statusLable: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var player : AVAudioPlayer!
    var timer = Timer()
    var totalTime: Float = 0
    var secondsPassed: Float = 0

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1.0
            let persentageProgress = secondsPassed / totalTime
            progressBar.progress = persentageProgress
        } else {
            statusLable.text = "DONE!"
            playSound()
            timer.invalidate()
        }
    }

    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!

        statusLable.text = "How do you like your eggs?"

        progressBar.progress = 0.0
        statusLable.text = hardness
        timer.invalidate()
        totalTime = Float(eggTimes[hardness]!)
        secondsPassed = 0
        startTimer()

        UIView.animate(withDuration: 0.3) {
            sender.alpha = 0.5
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.3) {
                sender.alpha = 1.0
            }
        }

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
}

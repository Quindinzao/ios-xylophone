//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let eggTimes : [String : Int]! = ["Soft": 300, "Medium": 480, "Hard": 720]
    var totalTime : Int = 0
    var secondsPassed : Int = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    
    @IBOutlet weak var progressBarEgg: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!

    @IBAction func hardnessSelection(_ sender: UIButton) {
        timer.invalidate()
        progressBarEgg.progress = 0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true)
    }

    @objc func updateTimer() {
        if secondsPassed < totalTime {
            titleLabel.text = "\(totalTime - secondsPassed) seconds for the eggs to be cooked."
            secondsPassed += 1
            let percentageProgress: Float = Float(secondsPassed) / Float(totalTime)
            progressBarEgg.progress = percentageProgress
            
        } else {
            titleLabel.text = "Your eggs are cooked! 🥚"
            playerSound()
            timer.invalidate()
        }
    }
    
    func playerSound() {
        let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}

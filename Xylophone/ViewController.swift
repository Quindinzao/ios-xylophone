//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        sender.alpha = 0.5
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 1
        playSound(musicalNote: sender.currentTitle!)
        
        print("Start")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            print("End")
        })
    }

    func playSound(musicalNote: String) {
        let path = Bundle.main.path(forResource: musicalNote, ofType:"wav")
        let url = URL(fileURLWithPath: path!)
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}


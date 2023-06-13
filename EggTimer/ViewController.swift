//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var eggTimes : [String : Int] = ["Soft": 3, "Medium": 420, "Hard":  720]
    var secondsPassed = 0
    var totalTime = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    func playSound()
    {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer()
    {
        if (secondsPassed < totalTime)
        {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
            
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        let hardness = sender.currentTitle!
    
        titleLabel.text = hardness
        
//        if (hardness == "Soft")
//        {
//            print(softTime)
//        } else if (hardness == "Medium")
//        {
//            print(mediumTime)
//        } else {
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
//            print("Error")
//        }
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
}

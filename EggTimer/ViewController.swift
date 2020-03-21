//
//  ViewController.swift
//  EggTimer
//
//  Created by Sarowar H. Mishkat on 22/3/20.
//  Copyright © 2020 Sarowar H. Mishkat. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //    let softTime = 5
    //    let mediamTime = 8
    //    let hardTime = 12
    
    //using dictionary
    var player: AVAudioPlayer!
    var eggTime = ["Soft":300, "Medium":420,"Hard":700]
    var secondsRemaining = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        //ProgressBar.progress = 1.0
        timer.invalidate()
        
        //print(sender.currentTitle)
        let hardness = sender.currentTitle! // Soft/ Medium/ Hard,
        
        totalTime = eggTime[hardness]!
        ProgressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    
    
    
    //        switch hardness {
    //        case "Soft":
    //            print(softTime)
    //        case "Medium":
    //            print(mediamTime)
    //        case "Hard":
    //            print(hardTime)
    //        default :
    //            print("err")
    //        }
    
    //using dictionary
    //print(eggTime[hardness]!)
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {

            secondsPassed += 1
            ProgressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound(soundName: "alarm_sound")
            
            
        }
    }
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}


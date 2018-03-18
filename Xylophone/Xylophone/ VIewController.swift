//
//  ViewController.swift
//  Xylophone
//
//  Created by Suruchi Singh on 1/5/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.

//

import UIKit
import AVFoundation
import AudioToolbox
class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    //var xylophoneSound = NSURL(fileURLWithPath:Bundle.main.path(forResource: "note1", ofType:"wave")!)
//   var audioPlayer = AVAudioPlayer()
//    var player : AVAudioPlayer? // question mark means optional
    
    var audioPlayer : AVAudioPlayer!
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    //var selectedSoundFile : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
//        print(sender.tag)
//        if(sender.tag == 1){
//            print("play middle C")
//        }
//        else if(sender.tag == 2){
//            print("play D")
//        }
//
//    }
//        let url = Bundle.main.url(forResource:"note1",withExtension:"wav")!
//        do{
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//            player.prepareToPlay()
//            player.play()
//        } catch let error as Error {
//            print(error)
//        }
        
//        if let soundURL = Bundle.main.url(forResource: "note1", withExtension: "wav") {
//        var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            AudioServicesPlaySystemSound(mySound);
//        }
        
        // selectedSoundFile = soundArray[sender.tag-1]
        //print(selectedSoundFile)
        playSound(selectedSoundFile: soundArray[sender.tag-1])
        
    }
    func playSound(selectedSoundFile: String){
        let soundURL = Bundle.main.url(forResource: selectedSoundFile, withExtension: "wav")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:soundURL!)
            //put an ! afrer try and it will override try catch and it essentially says
            //that te try statement will never throw an error but you should do error handling
            
        }
        catch{
            print(error)
        }
        audioPlayer.play()
        }
    

}


//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Suruchi Singh on 1/2/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var magicBall: UIImageView!
    var randomQUestion : Int = 1
    let arrayOfQuestions=["ball1","ball2","ball3","ball4","ball5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        changeQuestions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        changeQuestions()
    }
    
    func changeQuestions(){
        randomQUestion = Int(arc4random_uniform(5))
        print(randomQUestion)
       magicBall.image = UIImage(named:arrayOfQuestions[randomQUestion])
        //magicBall.image = UIImage(named:"ball\(randomQUestion)")
        
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
            changeQuestions()
    }
}


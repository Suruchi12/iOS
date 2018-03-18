//
//  InstructionsViewController.swift
//  Suruchi_Assignment2
//
//  Created by Suruchi Singh on 2/18/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    @IBOutlet weak var Instructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        Instructions.text = " 1. Enter the number you want to guess  \n2. Move the Slider to make a guess \n3. Click on Play to Roll the die \n 4. If the sum of both die is greater than or equal to the number you guessed, you win the round \n 5.If the sum of both die is less than what you guessed, you lose. \n 6. Click on Reset, to Start Over. \n 7. If your score is below 0, the game will start again. 8.Click on Rules for Instructions. \n 9. Click Back to Game to go back to the game. \n 10. Click on About to know more about the author."
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK:- Dismiss Instructions View Controller
    @IBAction func backToGame(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Suruchi_Assignment2
//
//  Created by Suruchi Singh on 2/16/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!

    @IBOutlet weak var mySlider: UISlider!
    
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    var dice1Value: Int = 0
    var dice2Value: Int = 0
    var sumValue: Int = 0
    var gameRound: Int = 0
    var gameScore:Int = 0
    var usersGuess:Int = 0
    var titleAlert: String = ""
    var messageAlert : String = ""
    
    
    //MARK:- View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
         restartGame()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:- Roll Die/ Click on Play
    @IBAction func rollDie(_ sender: UIButton) {
        
        dice1Value = 1 + Int(arc4random_uniform(6))
        dice2Value = 1 + Int(arc4random_uniform(6))
        sumValue = dice1Value + dice2Value
        
        playDice1()
        playDice2()
        
        playGame()
    }
    
    //MARK:- Dice 1 Rolled
    func playDice1(){
        
        switch dice1Value {
            
        case 1:
            diceImage1.image = #imageLiteral(resourceName: "dice1")
        case 2:
            diceImage1.image = #imageLiteral(resourceName: "dice2")
        case 3:
            diceImage1.image = #imageLiteral(resourceName: "dice3")
        case 4:
            diceImage1.image = #imageLiteral(resourceName: "dice4")
        case 5:
            diceImage1.image = #imageLiteral(resourceName: "dice5")
        case 6:
            diceImage1.image = #imageLiteral(resourceName: "dice6")
        default:
            diceImage1.image = #imageLiteral(resourceName: "dice6")
        
        }
        
    }
    
    //MARK:- Dice 2 Rolled
    func playDice2(){
        
       switch dice2Value {
            
        case 1:
            diceImage2.image = #imageLiteral(resourceName: "dice1")
        case 2:
            diceImage2.image = #imageLiteral(resourceName: "dice2")
        case 3:
            diceImage2.image = #imageLiteral(resourceName: "dice3")
        case 4:
            diceImage2.image = #imageLiteral(resourceName: "dice4")
        case 5:
            diceImage2.image = #imageLiteral(resourceName: "dice5")
        case 6:
            diceImage2.image = #imageLiteral(resourceName: "dice6")
        default:
            diceImage2.image = #imageLiteral(resourceName: "dice6")
            
        }
        
    }
    
    //MARK:- Show Alert
    func showMessage(titleAlert :String, messageAlert :String){
        
        let alert = UIAlertController(title: titleAlert,
                                      message: messageAlert,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Close",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK:- Restart Game Button Clicked
    @IBAction func resetGame(_ sender: UIButton) {
        
        restartGame()

    }
    
    func restartGame(){
        
        
        showAnimation()
        
        gameRound = 0
        gameScore = 0
        sumValue = 0
        usersGuess = 0
        
        mySlider.setValue(1, animated: true)
        
        diceImage1.image =  #imageLiteral(resourceName: "dice6")
        diceImage2.image =  #imageLiteral(resourceName: "dice6")
        
        scoreLabel.text = "Score : \(gameScore)"
        roundLabel.text = "Round : \(gameRound)"
        sumLabel.text = "Sum is \(sumValue)"
        guessLabel.text = "Your Guess = \(usersGuess)"
        
        
        
    }
    
    //MARK:- Play Game
    func playGame(){
        
        if(usersGuess == 0){
            
            // Alert Handler
            
            let alert = UIAlertController(title: "Take Your Guess!",
                                          message: "Move the slider and guess a number to play the game!",
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Okay",
                                       style: .default,
                                       handler: { action in self.restartGame() })  //handling alert action
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
        else if(gameScore<0){

            // Alert Handler

            let alert = UIAlertController(title: "Restart Game",
                                          message: "Your score is below 0",
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Okay",
                                       style: .default,
                                       handler: { action in self.restartGame() })   //handling alert action
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
            
        else{
            
            sumLabel.text = "Sum is \(sumValue)"
            gameRound += 1
        
            if(usersGuess > sumValue){
                gameScore += 20
                
                titleAlert = "You Win this Round!"
                messageAlert = "Your Guess {\(usersGuess)} was greater than the Sum {\(sumValue)} \n\n You earn 20 points \n Your Total Score is \(gameScore)"
                
                showMessage(titleAlert: titleAlert, messageAlert: messageAlert)
            }
            
            else if(usersGuess == sumValue){
            
                gameScore += 50
                
                titleAlert = "Perfect Match!"
                messageAlert = "Your Guess {\(usersGuess)} was equal to the Sum {\(sumValue)} \n\n You earn 50 points \n Your Total Score is \(gameScore)"
                
                
                
                showMessage(titleAlert: titleAlert, messageAlert: messageAlert)
            }
            
            else{
            
                gameScore -= 10
                
                titleAlert = "You Lose this Round!"
                messageAlert = "Your Guess {\(usersGuess)} was lesser than the Sum {\(sumValue)} \n You lose 10 points \n Your Total Score is \(gameScore)"
            
                showMessage(titleAlert: titleAlert, messageAlert: messageAlert)
            
            }
        
        }
        
        scoreLabel.text = "Score : \(gameScore)"
        roundLabel.text = "Round : \(gameRound)"
        
        
    }
    
    
    
    //MARK:- Slider Moved
    @IBAction func sliderMoved(_ sender: UISlider) {
        
        usersGuess = lroundf(mySlider.value)
        guessLabel.text = "Your Guess = \(usersGuess)"
        
    }
    
    
    //MARK:- Animation
    func showAnimation(){
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)
    }
    
}


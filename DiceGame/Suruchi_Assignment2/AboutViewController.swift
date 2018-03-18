//
//  AboutViewController.swift
//  Suruchi_Assignment2
//
//  Created by Suruchi Singh on 2/18/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    //MARK:- Dismiss About View Controller
    @IBAction func backToRules(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

    //MARK:- Button Clicked
    @IBAction func aboutMe(_ sender: Any) {
        
        let alert = UIAlertController(title: "About Me!",
                                      message: "I am a student at Syracuse University pursuing a degree in Computer Science.",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}

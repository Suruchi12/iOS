//
//  Question.swift
//  Quizzler
//
//  Created by Suruchi Singh on 1/8/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import Foundation

class Question{
    
    let questionText : String
    let answer : Bool
    
    init(text : String , correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
    
}

//: Playground - noun: a place where people can play

import UIKit

func fibonacci(until total: Int){
    
    var firstNumber : Int = 0
    var secondNumber : Int = 1
    
    print(firstNumber)
    print(secondNumber)
    for _ in 0...total{
        
        var thirdNumber = firstNumber + secondNumber
        print(thirdNumber)

        firstNumber = secondNumber
        secondNumber = thirdNumber
    }
}
fibonacci(until:5)



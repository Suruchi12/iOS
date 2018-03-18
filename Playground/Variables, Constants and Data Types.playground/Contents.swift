//: A UIKit based Playground for presenting user interface
  
import UIKit

var myAge: Int = 24
myAge = 25
print(myAge)
//myAge is a variable

let myName:String = "Suruchi"
let mySurname : String = "Singh"
//let is constant so you can't change the value of myName

let myAgeInTenYears : Int = myAge + 10
let myFullName : String = myName + "Singh"
//OR
let myFULLName : String = "\(myName) Singh"
//OR
let myEntireName : String = "\(myName) \(mySurname)"

let myDetails = "\(myEntireName), \(myAge)"  //harder to tell which data type it is

let booleans : Bool = true
let floattingPointNos : Float = 1.2
double : Double = 1.22


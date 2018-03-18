//: A UIKit based Playground for presenting user interface
  
import UIKit

func calculatBMI(weight : Double, height : Double)->String{
    //var BMI : Double = 0.0
    //BMI = weight/(height * height)
    let BMI = weight/pow(height,2)
    let shortenedBMI = String(format: "%.2f",BMI)
    //"%.1f" for 1 decimal place
    //"%1.0f" or "%1.f" for 0 decimal place
    
    //print("BMI : \(BMI)")
    var result = ""
    if BMI > 25{
       // result = "Bmi is \(BMI), you are overweight"
        result = "you are overweight"
    }
    //else if BMI > 18.5 && BMI < 25{
    else if BMI > 18.5 {
        //result = "Bmi is \(BMI), you have a normal weight"
        result = "you have a normal weight"
        
    }
    else{
        //result = "Bmi is \(BMI), you are underweight"
        result = "you are underweight"
        
    }
    
   // return "Your bmi is " + String(BMI) + " and " + result
    
    return "Your BMI is \(shortenedBMI) and \(result)"

}

//print(calculatBMI(weight: 240.0, height: 12.0))
let result : String = calculatBMI(weight: 65.5, height: 1.8)
//print(result)


func calcMetric(foot : Double, inch : Double, pound : Double)->String{
    
    var footToInches = foot * 12
    var inchesToMetres = inch * 0.254
    var poundToKgs = pound * 0.45359237
    
    let result =  "Foot To Inches : " + String(footToInches) + " Inches to Metres : " + String(inchesToMetres) + " Pound to Kgs " + String(poundToKgs)
    return result
}

//print(calcMetric(foot: 2, inch: 10, pound: 100))

func calBmiMetric(weightInPounds : Double, heightInFeet : Double , heightInInches : Double)->Double
{
    var weightInKgs = weightInPounds * 0.45359237
    var totalInches = (heightInFeet * 12) + heightInInches
    var heightInMetres = totalInches * 0.0254
    
    var bmiWeight = weightInKgs
    var bmiHeight = heightInMetres
    
    let BmiMetric = bmiWeight / pow(bmiHeight,2)
    
    return BmiMetric
}

print(calBmiMetric(weightInPounds: 140, heightInFeet: 5, heightInInches: 11))


//: A UIKit based Playground for presenting user interface
  
import UIKit

let arrayOfNumbers = [1,2,3,4,5,6,7]

var sum : Int = 0

//for number in arrayOfNumbers{
//    //print(number)
//    //print("new cycle")
//    //sum = sum + number
//    sum+=number
//    print(sum)
//}

//print(sum)

for number in 1...10{
   // print(number)
}

//doesn't print 10
for number in 1..<10{
   // print(number)
}
//print even number excluding 10
for number in 1..<10 where number % 2 == 0{
  //  print(number)
}

//for number in (1...10).reversed() {
//    print("\(number) bottles of beer on the wall, \(number) bottles of beer" )
//    print("Take one down and pass it around, \(number-1) bottles of beer on the wall")
//    print("\n ")
//
//}

func beerSong(_ totalBottles:Int)->String{
    
    var lyric : String = ""
    var newline: String = ""
    for number in (0...totalBottles).reversed(){
        
        if number > 2{
         newline = "\n \(number) bottles of beer on the wall, \(number) bottles of beer \n Take one down and pass it around, \(number-1) bottles of beer on the wall"
        lyric+=newline
        }
        else if number == 2{
             newline = "\n 2 bottles of beer on the wall, 2 bottles of beer. \n Take one down and pass it around, 1 bottle of beer on the wall."
            lyric+=newline

        }
        
        else if number == 1{
             newline = "\n 1 bottle of beer on the wall, 1 bottle of beer. \n Take one down and pass it around, no more bottles of beer on the wall."
            lyric+=newline
            
        }
        else{
         newline = "\n No more bottles of beer on the wall, no more bottles of beer. \n Go to the store and buy some more, \(totalBottles) bottles of beer on the wall."
        lyric += newline
        }
        }
    
    
    return lyric
}

//print(beerSong(input: 25))
print(beerSong(5))

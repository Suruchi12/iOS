//: Playground - noun: a place where people can play

import UIKit


//func calculator(n1: Int, n2: Int,operation:(Int,Int)->Int)->Int{
//    return operation(n1,n2)
//}
//func add (n1 : Int, n2: Int )->Int{
//    return n1 + n2
//}
//func multiply (n1:Int, n2:Int)->Int{
//    return n1 * n2
//}

//add(n1:1,n2:2)
//calculator(n1: 2, n2: 4, operation: multiply)



//CLOUSRES

func calculator(n1: Int, n2: Int,operation:(Int,Int)->Int)->Int{
       return operation(n1,n2)
}


//calculator(n1: 2, n2: 4, operation: {(n1:Int, n2:Int)->Int in
//    return n1 * n2
//})

//Shortened version
//calculator(n1: 2, n2: 4, operation: {(n1, n2) in
//n1 * n2

//})
//Making it shorter
//let mult = calculator(n1: 2, n2: 4, operation: {$0*$1} )

//Trailing Closures when you don't mention the function name
let mult = calculator(n1: 2, n2: 4) { $0*$1 }
print(mult)

let array = [1,2,3,4,5,6]
print(array.map{$0+1})
let stringArray = array.map{"\($0)"}
print(stringArray)


//: Playground - noun: a place where people can play
//Completion Handler
import UIKit

class Firebase{
    func createUser(username : String, password: String, completion : (Bool,Int)->Void){
        var isSuccess = true
        var userID = 123
        completion(isSuccess, userID)
    }
}

class MyApp{
    
    func registrationButtonPressed(){
        let firebase = Firebase()
       // firebase.createUser(username: "Suruchi", password: "12345", completion:completed)
        
        //converted to closure
        firebase.createUser(username: "Suruchi", password: "12345") {
            (isSucess : String, userID:Int) in // no need to write data types
            print("registration is Successful" + "\(isSucess)")
            print("User ID" + "\(userID)")
        })
    }
    
//    func completed(isSucess : String, userID:Int){
//        print("registration is Successful" + "\(isSucess)")
//        print("User ID" + "\(userID)")
//    }
    
    
    
}

let myapp = MyApp()
MyApp.registrationButtonPressed()

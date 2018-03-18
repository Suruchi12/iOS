//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Suruchi Singh on 1/10/18.
//  Copyright © 2018 Suruchi Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbol = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print(currencyArray[row])
       finalURL = baseURL + currencyArray[row]
        print(finalURL)
        updateBitcoin(url: finalURL , symbolRow : row)
    }

    func updateBitcoin(url : String, symbolRow : Int){
        Alamofire.request(url, method : .get).responseJSON
            {
                response in
                if response.result.isSuccess {
                    print("Sucess")
                    let bitCoinJSON : JSON = JSON(response.result.value!)
                    print(bitCoinJSON)
                    self.getBitcoinData(json:bitCoinJSON, symbolRow: symbolRow)
                    
                }
                else{
                    print("Error" + "\(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
        }
    }
    
    func getBitcoinData(json : JSON, symbolRow : Int){
        if let tempResult = json ["open"]["hour"].double{
            print(tempResult)
            bitcoinPriceLabel.text = " \(currencySymbol[symbolRow]) \(Decimal(tempResult))"
        }
        else{
            bitcoinPriceLabel.text = "Data Unavailable!"
        }
        
    }
}


//
//  ViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 14/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class CurrencyController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var currency: Currrency?
    let symbols = ["Euro": "EUR", "Dollar": "USD", "Pounds": "GBP"]
    var fromSymbol = "EUR"
    var toSymbol = "USD"
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultSymbolsPickerView: UIPickerView!
    @IBOutlet weak var requestTextField: UITextField!
    @IBOutlet weak var requestPickerView: UIPickerView!
    
    override func viewDidLoad() {
        requestPickerView.delegate = self
        requestPickerView.dataSource = self
        resultSymbolsPickerView.delegate = self
        resultSymbolsPickerView.dataSource = self
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            fromSymbol = Array(symbols.values)[row]
        } else if pickerView.tag == 1 {
            toSymbol = Array(symbols.values)[row]
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(symbols.keys)[row]
    }
    
    
    
    
}






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
    let symbols = ["EUR": "Euro", "USD": "Dollar", "GBP": "Pounds"]
    var fromSymbol = "EUR" // mis à jour dans le pickerview monnaie sélectionnée
    var toSymbol = "USD" // mis à jour dans le pickerview monnaie voulue
    
    @IBOutlet weak var resultLabel: UILabel! //output
    @IBOutlet weak var resultSymbolsPickerView: UIPickerView! //pickerview
    @IBOutlet weak var requestPickerView: UIPickerView! //pickerview
    @IBOutlet weak var requestTextField: UITextField! //input
    
    override func viewDidLoad() {
        requestPickerView.delegate = self
        requestPickerView.dataSource = self
        resultSymbolsPickerView.delegate = self
        resultSymbolsPickerView.dataSource = self
    }
    
    @IBAction func TappingCurrency(_ sender: Any) {
    }
    
    /// Creating Picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(symbols.values)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            fromSymbol = Array(symbols.keys)[row]
        } else if pickerView.tag == 1 {
            toSymbol = Array(symbols.keys)[row]
        }
    } 
}






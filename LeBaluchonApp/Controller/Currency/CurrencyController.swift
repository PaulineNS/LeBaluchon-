//
//  ViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 14/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class CurrencyController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let symbolsDictionnary = ["EUR": "Euro", "USD": "Dollar", "GBP": "Pounds"]
    var fromSymbol = "EUR"
    var toSymbol = "EUR"
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultSymbolsPickerView: UIPickerView!
    @IBOutlet weak var requestPickerView: UIPickerView!
    @IBOutlet weak var requestTextField: UITextField!
    
    override func viewDidLoad() {
        requestPickerView.delegate = self
        requestPickerView.dataSource = self
        resultSymbolsPickerView.delegate = self
        resultSymbolsPickerView.dataSource = self
        requestPickerView.selectRow(1, inComponent: 0, animated: true)
        resultSymbolsPickerView.selectRow(1, inComponent: 0, animated: true)
        CurrencyService.shared.getCurrency {(currency) in }
    }
    
    @IBAction func TappingCurrency(_ sender: Any) {
        convert()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        requestTextField.resignFirstResponder()
    }
    
    /// Creating Picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbolsDictionnary.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(symbolsDictionnary.values).sorted()[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == requestPickerView {
            fromSymbol = Array(symbolsDictionnary.keys)[row]
        } else if pickerView == resultSymbolsPickerView {
            toSymbol = Array(symbolsDictionnary.keys)[row]
        }
        
        convert()
    }
    
    func convert() {
        CurrencyService.shared.getCurrency {(currency) in
            if let c = currency, let text = self.requestTextField.text, let value = Double(text) {
                let result = c.convert(value: value, from: self.fromSymbol, to: self.toSymbol)
                self.resultLabel.text = String(result)
            }
        }
    }
}






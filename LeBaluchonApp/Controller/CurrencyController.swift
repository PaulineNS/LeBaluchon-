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
    var fromSymbol = "EUR"
    var toSymbol = "EUR"
    
    
    @IBOutlet weak var resultLabel: UILabel! //output
    @IBOutlet weak var resultSymbolsPickerView: UIPickerView! //pickerview
    @IBOutlet weak var requestPickerView: UIPickerView! //pickerview
    @IBOutlet weak var requestTextField: UITextField! //input
    
    override func viewDidAppear(_ animated: Bool) {
        requestPickerView.becomeFirstResponder()
        resultSymbolsPickerView.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        requestPickerView.delegate = self
        requestPickerView.dataSource = self
        resultSymbolsPickerView.delegate = self
        resultSymbolsPickerView.dataSource = self
        CurrencyService().getCurrency {(currency) in
            self.currency = currency
        }
    }
    
    fileprivate func convert() {
        if fromSymbol != "EUR" {
            let value = Double(requestTextField.text!)
            let devise = Double((currency?.rates[fromSymbol])!)
            let valueToEuro = currency?.convertToEuro(value: value ?? 0, devise: devise)
            let devisee = Double((currency?.rates[toSymbol])!)
            let convertValue = currency?.convertFromEuro(value: valueToEuro ?? 0 , devise: devisee)
            resultLabel.text = String(convertValue ?? 0)
        } else {
            let value = Double(requestTextField.text!)
            let devise = Double((currency?.rates[toSymbol])!)
            let convertValue = currency?.convertFromEuro(value: value ?? 0, devise: devise)
            resultLabel.text = String(convertValue ?? 0)
        }
    }
    
    @IBAction func TappingCurrency(_ sender: Any) {
        convert()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
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
        fromSymbol = Array(symbols.keys)[row]
        
        if pickerView.tag == 0 {
            fromSymbol = Array(symbols.keys)[row]
        } else if pickerView.tag == 1 {
            toSymbol = Array(symbols.keys)[row]
        }
        
        convert()
    }
}






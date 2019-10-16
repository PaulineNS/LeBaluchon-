//
//  ViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 14/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class CurrencyController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let symbolsDictionnary = ["EUR": "€", "USD": "$", "GBP": "£"]
    var fromSymbol = "EUR"
    var toSymbol = "EUR"
    let currencyService = CurrencyService()
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var resultSymbolsPickerView: UIPickerView!
    @IBOutlet private weak var requestPickerView: UIPickerView!
    @IBOutlet private weak var requestTextField: UITextField!
    
    override func viewDidLoad() {
        requestPickerView.delegate = self
        requestPickerView.dataSource = self
        resultSymbolsPickerView.delegate = self
        resultSymbolsPickerView.dataSource = self
        requestPickerView.selectRow(1, inComponent: 0, animated: true)
        resultSymbolsPickerView.selectRow(1, inComponent: 0, animated: true)
        currencyService.getCurrency {_ in }
    }
    
    @IBAction private func tappingCurrency(_ sender: Any) {
        if requestTextField.text == "" {
            resultLabel.text = ""
        }
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
        guard let text = self.requestTextField.text, let value = Double(text) else {
            return
        }
        
        currencyService.getCurrency {result in
            switch result {
            case .success(let currency):
                self.checkingDecimalNumber(result: currency.convert(value: value, from: self.fromSymbol, to: self.toSymbol))
            case .failure:
                self.presentAlert(message: "La conversion n'a pas aboutit")
            }
        }
    }
    
    /// Checking if the result in Int is eaqul to the result in Double. Remove the decimal if yes.
    /// Replace the first index of the operation by the result.
    func checkingDecimalNumber(result: Double){
        let integerValue = floor(result)
        
        if integerValue == result {
            let resultToInt = Int(result)
            resultLabel.text = "\(resultToInt)"
        } else {
            resultLabel.text = "\(result)"
        }
    }
}






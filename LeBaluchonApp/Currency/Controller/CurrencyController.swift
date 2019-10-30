//
//  ViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 14/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class CurrencyController: UIViewController {
    
    //MARK: VARIABLES
    let symbolsDevices = [("USD", "$"), ("GBP", "£"), ("EUR", "€")]
    var fromSymbol = "EUR"
    var toSymbol = "USD"
    
    // instance
    let currencyService = CurrencyService()
    
    // Outlets
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var resultSymbolsPickerView: UIPickerView!
    @IBOutlet private weak var requestPickerView: UIPickerView!
    @IBOutlet private weak var requestTextField: UITextField!
    
}

extension CurrencyController {
    override func viewDidLoad() {
        requestPickerView.selectRow(2, inComponent: 0, animated: true)
        resultSymbolsPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    // Actions
    // Launch conversion
    @IBAction private func tappingCurrency(_ sender: Any) {
        if requestTextField.text == "" {
            resultLabel.text = ""
        }
        convert()
    }
    
    //Manage the disapperance of the keyboard
    @IBAction private func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        requestTextField.resignFirstResponder()
    }
}

/// Creating The PickerView
extension CurrencyController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbolsDevices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return symbolsDevices[row].1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == requestPickerView {
            fromSymbol = symbolsDevices[row].0
        } else if pickerView == resultSymbolsPickerView {
            toSymbol = symbolsDevices[row].0
        }
        
        convert()
    }
}

extension CurrencyController {
    // Manage the conversion
    private func convert() {
        guard let text = requestTextField.text, let value = Double(text) else {
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
    private func checkingDecimalNumber(result: Double) {
        let integerValue = floor(result)
        
        if integerValue == result {
            let resultToInt = Int(result)
            resultLabel.text = "\(resultToInt)"
        } else {
            resultLabel.text = "\(result)"
        }
    }
}








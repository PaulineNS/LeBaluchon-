//
//  ViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 14/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class CurrencyController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultSymbolsPickerView: UIPickerView!
    @IBOutlet weak var requestTextField: UITextField!
    @IBOutlet weak var requestPickerView: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // return symbolsArray
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // return symbolsArray[row]
    }
}






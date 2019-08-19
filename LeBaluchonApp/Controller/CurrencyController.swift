//
//  ViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 14/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class CurrencyController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyService.getCurrency { (currrency) in
            print (currrency)
        }
    }
    // Do any additional setup after loading the view.
}



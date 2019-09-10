//
//  WeatherViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var topCitySearchBar: UISearchBar!
    @IBOutlet weak var topCityName: UILabel!
    @IBOutlet weak var topCityCondition: UILabel!
    @IBOutlet weak var topCityIcon: UIImageView!
    @IBOutlet weak var TopCityTemperature: UILabel!
    @IBOutlet weak var TopCityDate: UILabel!
    
    @IBOutlet weak var bottomCitySearchBar: UISearchBar!
    @IBOutlet weak var bottomCityName: UILabel!
    @IBOutlet weak var bottomCityCondition: UILabel!
    @IBOutlet weak var bottomCityIcon: UIImageView!
    @IBOutlet weak var bottomCityTemperature: UILabel!
    @IBOutlet weak var bottomCityDate: UILabel!
    
}

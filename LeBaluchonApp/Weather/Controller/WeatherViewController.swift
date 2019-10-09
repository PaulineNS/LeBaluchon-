//
//  WeatherViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var topCityView: WeatherGrid!
    @IBOutlet weak var bottomCityGrid: WeatherGrid!
    
    let citiesDictionnary = ["Paris": 6455259, "Marseille": 2995469, "Lyon": 6454573, "Toulouse": 6453974, "Nice": 2990440, "Nantes": 6434483, "Montpellier": 6454034, "Strasbourg": 2973783, "Bordeaux": 6455058, "Lille": 6454414, "New York": 5128638, "Los Angeles": 5368361, "Chicago": 4887398, "Houston": 4391354, "Philadelphia": 4440906, "San Diego": 4726311, "Dallas": 4684888, "Phoenix": 4905873, "San Antonio": 4726206]
    
    var topCityName = "Paris"
    var bottomCityName = "New-York"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayWeatherData() {
        if let idTopCity = citiesDictionnary[topCityName], let idBottomCity = citiesDictionnary[topCityName] {
            WeatherService.shared.getWeather(topCityId: idTopCity, bottomCityId: idBottomCity) { (weatherStruc) in
                <#code#>
            }
            
        }
    }
}

//
//  WeatherViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    @IBOutlet weak var topCityView: WeatherGrid!
    @IBOutlet weak var bottomCityGrid: WeatherGrid!
    
    let weatherService = WeatherService()
    let citiesDictionnary = ["Paris": 6455259, "Marseille": 2995469, "Lyon": 6454573, "Toulouse": 6453974, "Nice": 2990440, "Nantes": 6434483, "Montpellier": 6454034, "Strasbourg": 2973783, "Bordeaux": 6455058, "Lille": 6454414, "New York": 5128638, "Los Angeles": 5368361, "Chicago": 4887398, "Houston": 4391354, "Philadelphia": 4440906, "San Diego": 4726311, "Dallas": 4684888, "Phoenix": 4905873, "San Antonio": 4726206]
    var topCityName = "Paris"
    var bottomCityName = "New York"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayWeatherData(nameTopCity: topCityName, nameBottomCity: bottomCityName)
    }
    
    @IBAction func didTapFrenchCitiesButton(_ sender: Any) {
        UserDefaults.standard.set(bottomCityName, forKey: "savedBottomCityName")
        performSegue(withIdentifier: "fromWeatherVcToTableViewVc", sender: sender)
    }
    
    @IBAction func didTapUsCitiesButton(_ sender: Any) {
        UserDefaults.standard.set(topCityName, forKey: "savedTopCityName")
        performSegue(withIdentifier: "fromWeatherVcToTableViewVc", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromWeatherVcToTableViewVc" {
            if let button = sender as? UIButton {
                let vcDestination = segue.destination as? CitiesTableViewController
                if button.tag == 1 {
                    vcDestination?.labelTitle = "Villes Françaises"
                } else if button.tag == 2 {
                    vcDestination?.labelTitle = "Villes Américaines"
                }
            } else {
                print("Error")
            }
        }
    }
    
    func displayWeatherData(nameTopCity: String, nameBottomCity: String) {
        guard let topCityIndex = citiesDictionnary.index(forKey: nameTopCity), let bottomCityIndex = citiesDictionnary.index(forKey: nameBottomCity) else {
            return
        }
        
        weatherService.getWeather(topCityId: citiesDictionnary[topCityIndex].value, bottomCityId: citiesDictionnary[bottomCityIndex].value) { result in
            switch result {
            case .success(let weatherData):
                self.updateWeather(data: weatherData)
            case .failure:
                self.presentAlert(message: "La météo n'a pas aboutit")
            }
        }
    }
    
    func updateWeather(data: WeatherStruc) {
        if let topCityTemperature = data.list[0].main.temp, let topCityIcon = data.list[0].weather[0].icon {
            topCityView.temperatureLabel.text = String(topCityTemperature) + "°C"
            topCityView.weatherImageView.image = UIImage(named: topCityIcon)
        }
        topCityView.cityNameLabel.text = data.list[0].name
        topCityView.conditionLabel.text = data.list[0].weather[0].weatherDescription
        topCityView.dateLabel.text = convertDateFromUnix(unixTime: data.list[0].dt)
        
        if let bottomCityTemperature = data.list[1].main.temp, let bottomCityIcon = data.list[1].weather[0].icon {
            bottomCityGrid.temperatureLabel.text = String(bottomCityTemperature) + "°C"
            bottomCityGrid.weatherImageView.image = UIImage(named: bottomCityIcon)
            bottomCityGrid.dateLabel.text = convertDateFromUnix(unixTime: data.list[1].dt)
        }
        bottomCityGrid.cityNameLabel.text = data.list[1].name
        bottomCityGrid.conditionLabel.text = data.list[1].weather[0].weatherDescription
    }
    
    func saveData() {
        let userDefault = UserDefaults.standard
        userDefault.set(topCityName, forKey: "savedTopCityName")
        
    }
    
    func convertDateFromUnix(unixTime: Int) -> String {
        let weatherDate = NSDate(timeIntervalSince1970: TimeInterval(unixTime))
        
        let dateFormatter = DateFormatter()
        // dateFormatter.locale =
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        return dateFormatter.string(from: weatherDate as Date)
    }
}




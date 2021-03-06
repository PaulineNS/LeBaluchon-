//
//  WeatherViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

protocol DidSelectCityDelegate {
    func rowTapped(with city: String, grid: GridPositionEnum)
}

final class WeatherViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet private weak var topCityView: WeatherGrid!
    @IBOutlet private weak var bottomCityGrid: WeatherGrid!
    
    // instance
    let weatherService = WeatherService()
    
    //MARK: VARIABLES
    let citiesDictionnary = ["Paris": 6455259, "Marseille": 2995469, "Lyon": 6454573, "Toulouse": 6453974, "Nice": 2990440, "Nantes": 6434483, "Montpellier": 6454034, "Strasbourg": 2973783, "Bordeaux": 6455058, "Lille": 6454414, "New York": 5128638, "Los Angeles": 5368361, "Chicago": 4887398, "Houston": 4391354, "Philadelphia": 4440906, "San Diego": 4726311, "Dallas": 4684888, "Phoenix": 4905873, "San Antonio": 4726206]
    var topCityName = "Paris"
    var bottomCityName = "New York"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayWeatherData(nameTopCity: topCityName, nameBottomCity: bottomCityName)
    }
}

// Functions which manage the weather display
extension WeatherViewController {
    private func displayWeatherData(nameTopCity: String, nameBottomCity: String) {
        guard let topCityIndex = citiesDictionnary.index(forKey: nameTopCity), let bottomCityIndex = citiesDictionnary.index(forKey: nameBottomCity) else {
            return
        }
        
        weatherService.getWeather(topCityId: citiesDictionnary[topCityIndex].value, bottomCityId: citiesDictionnary[bottomCityIndex].value) { result in
            switch result {
            case .success(let weatherData):
                self.updateWeather(data: weatherData, cityView: self.topCityView, cityIndex: 0, abbreviation: "CET")
                self.updateWeather(data: weatherData, cityView: self.bottomCityGrid, cityIndex: 1, abbreviation: "EDT")
            case .failure:
                self.presentAlert(message: "La météo n'a pas aboutit")
            }
        }
    }
    
    private func updateWeather(data: WeatherStruc, cityView: WeatherGrid, cityIndex: Int, abbreviation: String) {
        if let cityTemperature = data.list[cityIndex].main.temp, let cityIcon = data.list[cityIndex].weather[0].icon {
            cityView.temperatureLabel.text = String(cityTemperature) + "°C"
            cityView.weatherImageView.image = UIImage(named: cityIcon)
        }
        cityView.cityNameLabel.text = data.list[cityIndex].name
        cityView.conditionLabel.text = data.list[cityIndex].weather[0].weatherDescription
        cityView.dateLabel.text = convertDateFromUnix(unixTime: data.list[cityIndex].dt, abbreviation: abbreviation)
    }
}

// Actions
extension WeatherViewController {

    //Button to change the american city
    @IBAction private func didTapCitiesButton(_ sender: UIButton) {
        if sender.tag == 1 {
            UserDefaults.standard.set(bottomCityGrid.cityNameLabel.text, forKey: "savedBottomCityName")
        } else if sender.tag == 2 {
            UserDefaults.standard.set(topCityView.cityNameLabel.text, forKey: "savedTopCityName")
        }
        performSegue(withIdentifier: "fromWeatherVcToTableViewVc", sender: sender)
    }
}

// Segues
extension WeatherViewController {
    // Segue to CitiesTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromWeatherVcToTableViewVc" {
            if let button = sender as? UIButton {
                let vcDestination = segue.destination as? CitiesTableViewController
                if button.tag == 1 {
                    vcDestination?.labelTitle = "Villes Françaises"
                    vcDestination?.didSelectCityDelegate = self
                } else if button.tag == 2 {
                    vcDestination?.labelTitle = "Villes Américaines"
                    vcDestination?.didSelectCityDelegate = self
                }
            } else {
                print("Error")
            }
        }
    }
}

// Protocol implementation
extension WeatherViewController : DidSelectCityDelegate {
    func rowTapped(with city: String, grid: GridPositionEnum) {
        switch grid {
        case .bottom:
            let userDefault = UserDefaults.standard.string(forKey: "savedTopCityName") ?? "Paris"
            displayWeatherData(nameTopCity: userDefault, nameBottomCity: city)
        case .top:
            let userDefault = UserDefaults.standard.string(forKey: "savedBottomCityName") ?? "New York"
            displayWeatherData(nameTopCity: city, nameBottomCity: userDefault)
        }
    }
}












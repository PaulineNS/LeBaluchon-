//
//  SearchBarViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class CitiesTableViewController: UIViewController {
    
    //MARK: VARIABLES
    var labelTitle: String? = ""
    let frenchCitiesArray = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille"]
    let americanCitiesArray = ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia", "San Diego", "Dallas", "Phoenix", "San Antonio"]
    
    //MARK: OUTLETS
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = labelTitle
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
    }
}

/// Creating The TableView
extension CitiesTableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if titleLabel.text == "Villes Françaises" {
            return frenchCitiesArray.count
        } else if titleLabel.text == "Villes Américaines" {
            return americanCitiesArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? CitiesTableViewCell else {
            return UITableViewCell()
        }
        
        if titleLabel.text == "Villes Françaises" {
            cell.configure(title: frenchCitiesArray[indexPath.row])
        } else if titleLabel.text == "Villes Américaines" {
            cell.configure(title: americanCitiesArray[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController {
            if titleLabel.text == "Villes Françaises", let userDefaults = UserDefaults.standard.value(forKey: "savedBottomCityName") as? String {
                vc.topCityName = frenchCitiesArray[indexPath.row]
                vc.bottomCityName = userDefaults
            } else if titleLabel.text == "Villes Américaines", let userDefault = UserDefaults.standard.value(forKey: "savedTopCityName") as? String  {
                vc.bottomCityName = americanCitiesArray[indexPath.row]
                vc.topCityName = userDefault
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
    

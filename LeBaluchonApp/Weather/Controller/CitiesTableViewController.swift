//
//  SearchBarViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class CitiesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var labelTitle: String? = ""
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var citiesTableView: UITableView!
    
    let frenchCitiesArray = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille"]
    
    let americanCitiesArray = ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia", "San Diego", "Dallas", "Phoenix", "San Antonio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = labelTitle
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
    }
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        if(indexPath.row % 2 == 0) {
            cell.backgroundColor = #colorLiteral(red: 0.8373811841, green: 0.9011436105, blue: 0.9491865039, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.5326249003, green: 0.6711445451, blue: 0.8233166337, alpha: 1)
        }
        
        if titleLabel.text == "Villes Françaises" {
            cell.textLabel?.text = frenchCitiesArray[indexPath.row]
        } else if titleLabel.text == "Villes Américaines" {
            cell.textLabel?.text = americanCitiesArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController {
            if titleLabel.text == "Villes Françaises" {
                vc.topCityName = frenchCitiesArray[indexPath.row]
            } else if titleLabel.text == "Villes Américaines" {
                vc.bottomCityName = americanCitiesArray[indexPath.row]
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

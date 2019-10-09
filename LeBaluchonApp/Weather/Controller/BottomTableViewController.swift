//
//  BottomTableViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 09/10/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class BottomTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var americanCitiesTableView: UITableView!
    
    let citiesArray = ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia", "San Diego", "Dallas", "Phoenix", "San Antonio", "San José"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        americanCitiesTableView.delegate = self
        americanCitiesTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = citiesArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController {
            vc.bottomCityName = citiesArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

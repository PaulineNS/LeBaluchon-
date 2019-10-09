//
//  SearchBarViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TopTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var frenchCitiesTableView: UITableView!
        
    let citiesArray = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frenchCitiesTableView.delegate = self
        frenchCitiesTableView.dataSource = self
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
            vc.topCityName = citiesArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

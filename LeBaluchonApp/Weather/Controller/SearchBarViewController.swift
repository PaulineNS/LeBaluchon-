//
//  SearchBarViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let citiesArray = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille", "New York", "Los Angeles", "Chicago", "Houston", "Philadelphie", "San Diego", "Dallas", "Phoenix", "San Antonio", "San José"]
    
    private var list = [List]()
    
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.dataSource = self
        WeatherService.shared.getCity { (city) in
            self.list = city?.list ?? [List]()
            self.cityTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = cityTableView.dequeueReusableCell(withIdentifier: "cell") {
            cell.textLabel?.text = list[indexPath.row].name
            
            return cell
        }
        return UITableViewCell()
    }
}


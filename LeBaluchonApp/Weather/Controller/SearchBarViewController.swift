//
//  SearchBarViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    let citiesArray = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille", "New York", "Los Angeles", "Chicago", "Houston", "Philadelphie", "San Diego", "Dallas", "Phoenix", "San Antonio", "San José"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
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
}


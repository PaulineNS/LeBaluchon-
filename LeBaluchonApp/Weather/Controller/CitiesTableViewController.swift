//
//  SearchBarViewController.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

// Enumeration of the differents grid position
enum GridPositionEnum {
    case top, bottom
}

final class CitiesTableViewController: UIViewController {
    
    //MARK: VARIABLES
    var didSelectCityDelegate: DidSelectCityDelegate?
    var labelTitle: String? = ""
    let frenchCitiesArray = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Montpellier", "Strasbourg", "Bordeaux", "Lille"]
    let americanCitiesArray = ["New York", "Los Angeles", "Chicago", "Houston", "Philadelphia", "San Diego", "Dallas", "Phoenix", "San Antonio"]
    
    //MARK: OUTLETS
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var citiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = labelTitle
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
        
        if titleLabel.text == "Villes Françaises" {
            didSelectCityDelegate?.rowTapped(with: frenchCitiesArray[indexPath.row], grid: .top)
            
        } else if titleLabel.text == "Villes Américaines" {
            didSelectCityDelegate?.rowTapped(with: americanCitiesArray[indexPath.row], grid: .bottom)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

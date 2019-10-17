//
//  CitiesTableViewCell.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 17/10/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
    }
    
    private func addShadow() {
        whiteView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        whiteView.layer.shadowRadius = 2.0
        whiteView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        whiteView.layer.shadowOpacity = 2.0
    }
    
    func configure(title: String){
        titleLabel.text = title
    }

}

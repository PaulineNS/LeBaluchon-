//
//  WeatherGrid.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 11/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

final class WeatherGrid: UIView {
    
    //MARK: OUTLETS
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    // GridHandler Initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Adapt the xib to the view
    private func setup() {
        Bundle.main.loadNibNamed("WeatherGrid", owner: self, options: nil)
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
}

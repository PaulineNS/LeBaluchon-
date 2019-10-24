//
//  DidSelectCityDelegate.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 23/10/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

protocol DidSelectCityDelegate {
    func rowTapped(with city: String, grid: GridPositionEnum)
}

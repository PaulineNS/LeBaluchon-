//
//  CurrencyStruct.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 17/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

struct Currrency: Decodable {
    var base: String
    var rates: [String: Double]
    
    func convertFromEuro(value: Double, devise: Double) -> Double {
        return value * devise
    }
    
    func convertToEuro(value: Double, devise: Double) -> Double {
        return value / devise
    }
}




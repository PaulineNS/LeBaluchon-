//
//  CurrencyStruct.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 17/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

struct Currrency: Decodable {

    var rates: [String: Double]
    
    private func convertFromEuro(value: Double, rate: Double) -> Double {
        return value * rate
    }
    
    private func convertToEuro(value: Double, rate: Double) -> Double {
        return value / rate
    }
    
    func convert(value: Double, from: String, to: String) -> Double {
        if from != "EUR" {
            var rate = Double((self.rates[from] ?? 0.0))
            let valueToEuro = convertToEuro(value: value, rate: rate)
            rate = Double((self.rates[to] ?? 0.0))
            let convertValue = convertFromEuro(value: valueToEuro, rate: rate)
            return convertValue
        } else {
            let rate = Double((rates[to] ?? 0.0))
            let convertValue = convertFromEuro(value: value, rate: rate)
            return convertValue
        }
    }
}




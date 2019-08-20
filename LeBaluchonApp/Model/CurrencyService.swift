//
//  CurrencyService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 15/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class CurrencyService {
    private static let currencyUrl = URL(string: "http://data.fixer.io/api/latest?access_key=091a2105498b073b04df296f6052d8f3")!
    private static let symbolUrl = URL(string: "http://data.fixer.io/api/symbols?access_key=091a2105498b073b04df296f6052d8f3")!

    
    static func getCurrency(callback: @escaping (Currrency?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: currencyUrl) { (data, response, error) in
            
            guard let data = data, error == nil else {
                callback(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else  {
                callback(nil)
                return
            }
            
            guard let responseJSON = try? JSONDecoder().decode(Currrency.self, from: data) else {
                    callback(nil)
                    return
            }
            
            let currency = Currrency(base: responseJSON.base, date: responseJSON.date, rates: responseJSON.rates)
            callback(currency)
        }
        
        task.resume()
    }
    
    func convert(from: String, to: String, value: Double) -> Double {
        return 0.0
    }
} 

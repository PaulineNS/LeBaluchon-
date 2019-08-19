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
    
    static func getCurrency(callback: @escaping (Currrency?) -> Void) {
        URLSession.shared.dataTask(with: currencyUrl) { (data, response, error) in
            if let data = data, error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200  {
                if let responseJSON = try? JSONDecoder().decode(Currrency.self, from: data) {
                    callback(responseJSON)
                }
            } else {
                // error
            }
            }.resume()
        
    }
} 

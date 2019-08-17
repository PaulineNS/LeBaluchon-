//
//  CurrencyService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 15/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

/* class CurrencyService {
    private static let currencyUrl = URL(string: "http://data.fixer.io/api/latest?access_key=091a2105498b073b04df296f6052d8f3")!
    
    static func getCurrenci(){
        var request = URLRequest(url: currencyUrl)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    
                }
            }
        }
        task.resume()
    }
    
    private static func getImage(callback: @escaping (Bool, CurrrencyStruct?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: currencyUrl) { (data, response, error) in
            if let data = data, error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let responseJSON = JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: <#T##Data#>) {
                        
                    }
                }
            }
        }
    }
} */

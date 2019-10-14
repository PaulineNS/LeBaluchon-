//
//  CurrencyService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 15/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class CurrencyService {
    static var shared = CurrencyService()
    private init() {}
    
    private var currency: Currrency?
    
    private var task: URLSessionDataTask?
    private var session = URLSession(configuration: .default)
    
    init(session:URLSession) {
        self.session = session
    }

    /// Getting Data
    func getCurrency(callback: @escaping (Result<Currrency, NetworkError>) -> Void) {
        let currencyUrl = URL(string: "http://data.fixer.io/api/latest?access_key=\(APIKey.fixer)")!
        
        if let c = currency { 
            callback(.success(c))
            return
        }
        
        task?.cancel()
        task = session.dataTask(with: currencyUrl) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    callback(.failure(.badUrl))
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(.network))
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(Currrency.self, from: data) else {
                    callback(.failure(.invalidData))
                    return
                }
            
                self.currency = responseJSON
                callback(.success(responseJSON))
            }
        }
    
        task?.resume()
    }
} 

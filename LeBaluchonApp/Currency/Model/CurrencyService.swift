//
//  CurrencyService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 15/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

final class CurrencyService {
        
    private var task: URLSessionDataTask?
    private var session: URLSession
    
    init(session:URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    /// Getting Data
    func getCurrency(callback: @escaping (Result<Currrency, NetworkError>) -> Void) {
        guard let apiKey = ApiKeyExtractor().apiKey else { return }
        guard let currencyUrl = URL(string: "http://data.fixer.io/api/latest?access_key=\(apiKey.fixer)") else { return }
        
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
            
                callback(.success(responseJSON))
            }
        }
    
        task?.resume()
    }
} 

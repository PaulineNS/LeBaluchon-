//
//  TranslatorServices.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class TranslationService {
    
    let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIza")!
    
    func getTranslation(text: String, source: String, target: String, callback: @escaping (Data?) -> Void) {
        var request = URLRequest(url: translationUrl)
        request.httpMethod = "POST"
        
        let body = "source=\(source)&target=\(target)&q=\(text)"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    callback(nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(nil)
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(Data.self, from: data) else {
                    callback(nil)
                    return
                }
                
                callback(responseJSON)
            }
        }
        
        task.resume()
    }
    
}

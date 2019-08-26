//
//  TranslatorServices.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class TranslationService {
    var textToTranslate: String?
    var sourcelanguage: String?
    var targetlanguage: String?
    
    let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AIzaSyB5vmv70YQ43YEb9wn6HRsDLraH01G1PSs")!
    
    func getTranslation(callback: @escaping (Translation?) -> Void) {
        var request = URLRequest(url: translationUrl)
        request.httpMethod = "POST"
        
        let body = "source=\(sourcelanguage ?? "")&target=\(targetlanguage ??  "")&q=\(textToTranslate ?? "")"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                callback(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(nil)
                return
            }
            
            guard let responseJSON = try? JSONDecoder().decode(Translation.self, from: data) else {
                callback(nil)
                return
            }
            
            callback(responseJSON)
            
        }
        task.resume()
    }
    
}

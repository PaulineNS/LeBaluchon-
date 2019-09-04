//
//  TranslatorServices.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class TranslationService {
    var apiKeys = APIKeys()
    static var shared = TranslationService()
    private init() {}
    
    private static let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AI")!
    
    private var task: URLSessionDataTask?
    
    private var translationSession = URLSession(configuration: .default)
    
    init(translationSession: URLSession) {
        self.translationSession = translationSession
    }
    
    private func createTranslationRequest(text: String, source: String, target: String) -> URLRequest {
        let translationApi = apiKeys.valueForAPIKey(named: "Google")
        let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=\(translationApi)&source=\(source)&target=\(target)&q=\(text)")!
        var request = URLRequest(url: translationUrl)
        request.httpMethod = "POST"
        return request
    }
    
    func getTranslation(text: String, source: String, target: String, callback: @escaping (Data?) -> Void) {
        let request = createTranslationRequest(text: text, source: source, target: target)
        
        task?.cancel()
        task = translationSession.dataTask(with: request) { (data, response, error) in
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
        task?.resume()
    }
}

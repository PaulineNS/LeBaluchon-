//
//  TranslatorServices.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class TranslationService {
    
    //MARK: VARIABLES
    private var task: URLSessionDataTask?
    private var translationSession: URLSession
    
    init(translationSession: URLSession = URLSession(configuration: .default)) {
        self.translationSession = translationSession
    }
    
    // compose url endpoint with text and languages in/out
    private func createTranslationRequest(text: String, source: String, target: String) -> URLRequest? {
        let textwithAllowedCharacters = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        guard let apiKey = ApiKeyExtractor().apiKey, let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=\(apiKey.google)&source=\(source)&target=\(target)&q=\(textwithAllowedCharacters ?? "")&format=text".replacingOccurrences(of: " ", with: "+").trimmingCharacters(in: .whitespaces)) else { return nil }
        let request = URLRequest(url: translationUrl)
        return request
    }

    // request service translation
    func getTranslation(text: String, source: String, target: String, callback: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let request = createTranslationRequest(text: text, source: source, target: target) else { return }
        
        task?.cancel()
        task = translationSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    callback(.failure(.badUrl))
                    return 
                }
                
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(.network))
                    return
                }
                
                // lecture JSON
                guard let responseJSON = try? JSONDecoder().decode(Data.self, from: data) else {
                    callback(.failure(.invalidData))
                    return
                }
                
                callback(.success(responseJSON))
            }
        }
        task?.resume()
    }
} // end class


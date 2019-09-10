//
//  TranslatorServices.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class TranslationService {

    static var shared = TranslationService()
    private init() {}
    
    private static let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=AI")!
    
    private var task: URLSessionDataTask?
    
    private var translationSession = URLSession(configuration: .default)
    
    init(translationSession: URLSession) {
        self.translationSession = translationSession
    }
    
    private func createTranslationRequest(text: String, source: String, target: String) -> URLRequest? {
        let translationApi = valueForAPIKey(named: "API_GoogleTranslation")
        let textwithAllowedCharacters = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        guard let translationUrl = URL(string: "https://translation.googleapis.com/language/translate/v2?key=\(translationApi)&source=\(source)&target=\(target)&q=\(textwithAllowedCharacters ?? "")&format=text".replacingOccurrences(of: " ", with: "+").trimmingCharacters(in: .whitespaces)) else { return nil }
        let request = URLRequest(url: translationUrl)
        return request
    }
    
    func getTranslation(text: String, source: String, target: String, callback: @escaping (Result<Data, Error>) -> Void) {
        guard let request = createTranslationRequest(text: text, source: source, target: target) else { return }
        
        task?.cancel()
        task = translationSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    callback(.failure(error))
                    return 
                }
                
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(NSError(domain: "Network", code: 0, userInfo: nil)))
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(Data.self, from: data) else {
                    callback(.failure(NSError(domain: "Invalid data", code: 0, userInfo: nil)))
                    return
                }
                
                // print(responseJSON)
                callback(.success(responseJSON))
            }
        }
        task?.resume()
    }
}

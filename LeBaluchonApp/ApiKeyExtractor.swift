//
//  APIKeys.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 04/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

final class ApiKeyExtractor {
    
    var apiKey: ApiKey? {
        guard let path = Bundle.main.path(forResource: "ApiKeys", ofType: "plist"), let data = FileManager.default.contents(atPath: path) else {
            return nil
        }
        guard let dataExtracted = try? PropertyListDecoder().decode(ApiKey.self, from: data) else {
            return nil
        }
        return dataExtracted
    }
}

struct ApiKey: Decodable {
    let fixer: String
    let google: String
    let openWeatherMap: String
}


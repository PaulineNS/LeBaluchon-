//
//  APIKeys.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 04/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

final class APIKey {
    static var openWeatherMap: String {
        return APIKey.valueForAPIKey(named: "API_OpenWeatherMap")
    }
    
    static var fixer: String {
        return APIKey.valueForAPIKey(named: "API_Fixer")
    }
    
    static var googleTranslation: String {
        return APIKey.valueForAPIKey(named: "API_GoogleTranslation")
    }
    
    private static func valueForAPIKey(named keyname:String) -> String {
        let filePath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        let value = plist?.object(forKey: keyname) as! String
        return value
    }
}


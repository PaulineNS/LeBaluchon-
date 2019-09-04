//
//  APIKeys.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 04/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class APIKeys {
    
    func valueForAPIKey(named keyname:String) -> String {
        let filePath = Bundle.main.path(forResource: "APIKeys", ofType: "json")
        let json = NSDictionary(contentsOfFile:filePath!)
        let value = json?.object(forKey: keyname) as! String
        return value
    }
    
}

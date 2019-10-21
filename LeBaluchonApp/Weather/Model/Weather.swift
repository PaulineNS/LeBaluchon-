//
//  Weather.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 04/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherStruc = try? newJSONDecoder().decode(WeatherStruc.self, from: jsonData)

// API Struct
import Foundation

// MARK: - WeatherStruc
struct WeatherStruc: Decodable {
    let list: [List]
}

// MARK: - List
struct List: Decodable {
    let weather: [Weather]
    let main: Main
    let dt: Int
    let name: String
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double?
}

// MARK: - Weather
struct Weather: Decodable {
    let weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

//extension WeatherStruc{
//    private struct Keys {
//        static let topCityName = "savedTopCityName"
//        static let bottomCityName = "savedBottomCityName"
//    }
//
//    static var savedTopCityName: String {
//        get {
//            return UserDefaults.standard.string(forKey: Keys.topCityName) ?? "Paris"
//        }
//        set {
//            UserDefaults.standard.set(savedTopCityName, forKey: Keys.topCityName)
//        }
//    }
//
//    static var savedBottomCityName: String {
//        get {
//            return UserDefaults.standard.string(forKey: Keys.bottomCityName) ?? "New York"
//        }
//        set {
//            UserDefaults.standard.set(savedBottomCityName, forKey: Keys.bottomCityName)
//        }
//    }
//}










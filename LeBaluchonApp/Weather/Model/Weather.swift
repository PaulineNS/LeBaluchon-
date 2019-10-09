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

import Foundation

// MARK: - WeatherStruc
struct WeatherStruc: Decodable {
    let cnt: Int
    let list: [List]
}

// MARK: - List
struct List: Decodable {
    let coord: Coord?
    let sys: Sys?
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt, id: Int
    let name: String
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Decodable {
    let temp: Double?
    let pressure, humidity: Int?
    let tempMin, tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - Sys
struct Sys: Decodable {
    let country: String?
    let timezone, sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int?
    let main, weatherDescription, icon: String?
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Decodable {
    let speed, deg: Double?
}












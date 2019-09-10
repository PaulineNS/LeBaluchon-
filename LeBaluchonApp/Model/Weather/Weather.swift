//
//  Weather.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 04/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

// API Struct the same for Weather and GpsWeather
import Foundation

// for endpoint with towns ids
struct WeatherStruc: Decodable {
    let list: [List]
}

struct List: Decodable {
    let coord: Coord?
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Coord: Codable {
    let lon: Double
    let lat: Double?
}

struct Sys: Decodable {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}

struct Weather: Decodable {
    let id: Int?
    let main: String
    let description: String?
    let icon: String?
}

struct Main: Decodable {
    let temp: Double?
    let pressure: Int?
    let humidity: Int?
    let tempMin: Double?
    let tempMax: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Wind: Decodable {
    let speed: Double?
    let deg: Int?
}

struct Clouds: Decodable {
    let all: Int?
}

// for endpoint with coordinate
struct GpsWeatherStruc: Decodable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let id: Int?
    let name: String?
    let cod: Int?
}













//
//  Weather.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 04/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

struct WeatherStruc: Decodable {
    let list: [List]
}

struct List: Decodable {
    let coord: Coord?
    let sys: Sys?
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let id: Int
    let name: String
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double?
}

struct Sys: Decodable {
    let country: String?
    let timezone: Int?
    let sunrise: Int?
    let sunset: Int?
}

struct Weather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct Main: Decodable {
    let temp: Double?
    let pressure: Int?
    let humidity: Int?
    let tempMin: Double?
    let tempMax: Double?
    let seaLevel: Double?
    let groundLevel: Double?
}

struct Wind: Decodable {
    let speed: Double?
    let deg: Int?
}

struct Clouds: Decodable {
    let all: Int?
}













//
//  FakeResponseData.swift
//  WeatherServiceTestsCase
//
//  Created by Pauline Nomballais on 09/10/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

final class FakeResponseData {
    
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    /// Errors
    class WeatherError: Error{}
    static let errorWeather = WeatherError()
    
    /// Correct Datas
    static var weatherCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    ///Incorrect Data
    static let weatherIncorrectData = "erreur".data(using: .utf8)!
}

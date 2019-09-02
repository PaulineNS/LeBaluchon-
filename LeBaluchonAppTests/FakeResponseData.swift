//
//  FakeResponseData.swift
//  LeBaluchonAppTests
//
//  Created by Pauline Nomballais on 02/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class FakeResponseData {
    
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    /// Errors
    class CurrencyError: Error{}
    static let errorCurrency = CurrencyError()
    
    class TranslationError: Error{}
    static let errorTranslation = TranslationError()
    
    class WeatherError: Error{}
    static let errorWeather = WeatherError()
    
    /// Correct Datas
    /// Currency
    static var currencyCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static var translationCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translation", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static var weatherCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }

    ///Incorrect Data
    static let currencyIncorrectData = "erreur".data(using: .utf8)!
    static let translationIncorrectData = "erreur".data(using: .utf8)!
    static let weatherIncorrectData = "erreur".data(using: .utf8)!

}

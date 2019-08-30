//
//  FakeCurrencyResponseData.swift
//  CurrencyTestCase
//
//  Created by Pauline Nomballais on 30/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class FakeResponseData {
    
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class CurrencyError: Error{}
    static let errorCurrency = CurrencyError()
    
    static var currencyCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let currencyIncorrectData = "erreur".data(using: .utf8)
}

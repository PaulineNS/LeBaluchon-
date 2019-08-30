//
//  FakeCurrencyResponseData.swift
//  CurrencyTestCase
//
//  Created by Pauline Nomballais on 30/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class FakeCurrencyResponseData {
    let responseOK = HTTPURLResponse(url: URL(string: "")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    let responseKO = HTTPURLResponse(url: URL(string: "")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class CurrencyError: Error{}
    let error = CurrencyError()
    
    var currencyCorrectData: Data {
        let bundle = Bundle(for: FakeCurrencyResponseData.self)
        let url = bundle.url(forResource: "Currency", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    let currencyIncorrectData = "erreur".data(using: .utf8)
}

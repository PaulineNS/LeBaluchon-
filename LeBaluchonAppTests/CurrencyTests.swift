//
//  LeBaluchonAppTests.swift
//  LeBaluchonAppTests
//
//  Created by Pauline Nomballais on 20/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import XCTest
@testable import LeBaluchonApp

class CurrencyTests: XCTestCase {
    
    let currency = Currrency(base: "EUR", rates: [ "USD" : 1.106862, "GBP" : 0.906188])
    let currencyService = CurrencyService()
    
    func Given1Eur_WhenConvertToUSD_ThenTheGoodValueReturn() {
        let result = currency.convert(value: 1.0, devise: 1.106862)
        XCTAssertEqual(result, 1.106862)
    }
    
    func Given1Eur_WhenConvertToGBP_ThenTheGoodValueReturn(){
        let result = currency.convert(value: 1.0, devise: 0.906188)
        XCTAssertEqual(result, 0.906188)
    }
    
    /*
     from: "EUR", to: "USD", value: 1.0 (random), result: 1.267
     from: "EUR", to: "GBP", value: 1.0, result: 2.5832
     from: "USD", to: "EUR", value: 1.0, result: 0.789
     from: "GBP", to: "EUR", value: 1.0, result: 0.387
     from: "GBP", to: "USD", value: 1.0, result: 0.490
     from: "EUR", to: "EUR", value: 1.0, result: 1.0
     */
}


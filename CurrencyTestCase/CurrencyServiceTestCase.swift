//
//  CurrencyTestCase.swift
//  CurrencyTestCase
//
//  Created by Pauline Nomballais on 30/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import XCTest
@testable import LeBaluchonApp

class CurrencyServiceTestCase: XCTestCase {
    
    func testGetCurrencyShouldPostFailedCallbackIfError(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: nil, response: nil, error: FakeResponseData.errorCurrency))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { (currency) in
            // Then
            XCTAssertNil(currency)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfNoData(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { (currency) in
            // Then
            XCTAssertNil(currency)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseKO, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { (currency) in
            // Then
            XCTAssertNil(currency)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyIncorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { (currency) in
            // Then
            XCTAssertNil(currency)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
}
    
   /* func Given1Eur_WhenConvertToUSD_ThenTheGoodValueReturn() {
        let currency = Currrency(rates: ["USD" : 1.106862, "GBP" : 0.906188])

        let result = currency.convert(value: 1.0, from: "EUR", to: "USD")
        XCTAssertEqual(result, 1.106862)
    }
    
    
    
    func Given1Eur_WhenConvertToGBP_ThenTheGoodValueReturn(){
        let currency = Currrency(rates: ["USD" : 1.106862, "GBP" : 0.906188])

        let result = currency.convert(value: 1.0, from: "USD", to: "GBP")
        XCTAssertEqual(result, 0.906188)
    } */


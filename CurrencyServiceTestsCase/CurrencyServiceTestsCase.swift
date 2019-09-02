//
//  CurrencyServiceTestsCase.swift
//  CurrencyServiceTestsCase
//
//  Created by Pauline Nomballais on 02/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//
@testable import LeBaluchonApp
import XCTest

class CurrencyServiceTestsCase: XCTestCase {
    
    func testGetCurrencyShouldPostFailedCallbackIfError() {
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
    
    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
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
    
    func testGiven1Eur_WhenConvertToUSD_ThenTheGoodValueReturn(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { (currency) in
            // Then
            let result = currency?.convert(value: 1.0, from: "EUR", to: "USD")
            XCTAssertNotNil(currency)
            XCTAssertEqual(result, 1.103569)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGiven1Eur_WhenConvertToGBP_ThenTheGoodValueReturn(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { (currency) in
            // Then
            let result = currency?.convert(value: 1.0, from: "EUR", to: "GBP")
            XCTAssertNotNil(currency)
            XCTAssertEqual(result, 0.90661)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

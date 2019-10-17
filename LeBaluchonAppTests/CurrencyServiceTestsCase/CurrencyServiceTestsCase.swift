//
//  CurrencyServiceTestsCase.swift
//  LeBaluchonAppTests
//
//  Created by Pauline Nomballais on 16/10/2019.
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
        currencyService.getCurrency { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfNoData() {
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectResponse(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseKO, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetCurrencyShouldPostFailedCallbackIfIncorrectData(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyIncorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGiven1Eur_WhenConvertToUSD_ThenTheGoodValueReturn(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { result in
            guard case .success(let currencyResult) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            
            XCTAssertEqual(currencyResult.convert(value: 1.0, from: "EUR", to: "USD"), 1.103569)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGiven1Eur_WhenConvertToGBP_ThenTheGoodValueReturn(){
        //Given
        let currencyService = CurrencyService(session: URLSessionFake(data: FakeResponseData.currencyCorrectData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        currencyService.getCurrency { result in
            guard case .success(let currencyResult) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            
            XCTAssertEqual(currencyResult.convert(value: 1.0, from: "EUR", to: "GBP"), 0.90661)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}

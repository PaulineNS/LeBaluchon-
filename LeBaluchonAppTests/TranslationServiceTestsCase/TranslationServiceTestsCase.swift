//
//  TranslationServiceTestsCase.swift
//  LeBaluchonAppTests
//
//  Created by Pauline Nomballais on 16/10/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

@testable import LeBaluchonApp
import XCTest

class TranslationServiceTestsCase: XCTestCase {
    
    func testGetTranslationShouldPostFailedCallbackIfError() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.errorTranslation))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(text: "Bonjour", source: "fr", target: "en") { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfNoData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFake(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(text: "Bonjour", source: "fr", target: "en") { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.translationCorrectData, response: FakeResponseData.responseKO, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(text: "Bonjour", source: "fr", target: "en") { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.translationIncorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(text: "Bonjour", source: "fr", target: "en") { result in
            guard case .failure(let error) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
                
    func testGetTranslationShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let translationService = TranslationService(translationSession: URLSessionFake(data: FakeResponseData.translationCorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translationService.getTranslation(text: "Bonjour", source: "fr", target: "en") { result in
            guard case .success(let translationResult) = result else {
                XCTFail("Test request method with an error failed.")
                return
            }
            XCTAssertEqual(translationResult.data.translations[0].translatedText, "Hello")
           
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
}

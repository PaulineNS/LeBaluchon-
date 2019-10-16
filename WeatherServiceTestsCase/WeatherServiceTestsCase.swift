//
//  WeatherServiceTestsCase.swift
//  WeatherServiceTestsCase
//
//  Created by Pauline Nomballais on 02/10/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

@testable import LeBaluchonApp
import XCTest

final class WeatherServiceTestsCase: XCTestCase {
    
    func testGetWeatherShouldPostFailedCallbackIfError() {
        //Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.errorWeather))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(topCityId: 6455259, bottomCityId: 5128638) { result in
            switch result {
            case .success(let weather):
                XCTAssertNil(weather)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }

    
    func testGetWeatherShouldPostFailedCallbackIfNoData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: nil, response: nil, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(topCityId: 6455259, bottomCityId: 5128638) { result in
            switch result {
            case .success(let weather):
                XCTAssertNil(weather)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseKO, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(topCityId: 6455259, bottomCityId: 5128638) { result in
            switch result {
            case .success(let weather):
                XCTAssertNil(weather)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldPostFailedCallbackIfIncorrectData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherIncorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(topCityId: 6455259, bottomCityId: 5128638) { result in
            switch result {
            case .success(let weather):
                XCTAssertNil(weather)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weatherService.getWeather(topCityId: 6455259, bottomCityId: 5128638) { (data) in
            // Then
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
}

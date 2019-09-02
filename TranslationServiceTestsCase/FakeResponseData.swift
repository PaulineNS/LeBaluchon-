//
//  File.swift
//  TranslationServiceTestsCase
//
//  Created by Pauline Nomballais on 02/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class FakeResponseData {
    
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class TranslationError: Error{}
    static let errorTranslation = TranslationError()
    
    static var translationCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "Translation", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    static let translationIncorrectData = "erreur".data(using: .utf8)!
}

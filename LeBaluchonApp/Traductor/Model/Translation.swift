//
//  Translator.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

// API Struct
import Foundation

// MARK: - Data
struct Data: Decodable {
    var data: Translations
}

// MARK: - Translations
struct Translations: Decodable {
    var translations: [TranslatedText]
}

// MARK: - TranslatedText
struct TranslatedText: Decodable {
    var translatedText: String
}


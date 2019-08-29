//
//  Translator.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

struct Translation: Decodable {
    var source: String
    var target: String
    var q: String
    var translatedText: [String: String]
    
    
}

struct Data: Decodable {
    var data: Translations
}

struct Translations: Decodable {
    var translations: [TranslatedText]
}

struct TranslatedText: Decodable {
    var translatedText: String
}


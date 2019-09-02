//
//  Translator.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 26/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

struct Data: Decodable {
    var data: Translations
}

struct Translations: Decodable {
    var translations: [TranslatedText]
}

struct TranslatedText: Decodable {
    var translatedText: String
}


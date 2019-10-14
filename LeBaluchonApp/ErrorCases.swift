//
//  ErrorCases.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 10/09/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

/// Enumeration of error cases
enum NetworkError: Error {
    case badUrl
    case invalidData
    case network
}

//
//  WeatherService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class WeatherService {
    private let weatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=8fc912efa709857ada8c5ae7ac0cdb87")!
    
    func getWeather(callback: @escaping (WeatherStruc?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: weatherUrl ) { (data, response, error) in
            
            guard let data = data, error == nil else {
                callback(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else  {
                callback(nil)
                return
            }
            
            guard let responseJSON = try? JSONDecoder().decode(WeatherStruc.self, from: data) else {
                callback(nil)
                return
            }
            
            callback(responseJSON)
        }
        
        task.resume()
        
    }
}

//
//  WeatherService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

class WeatherService {
    
    static var shared = WeatherService()
    private init() {}
    
    private var task: URLSessionDataTask?
    private var weatherSession = URLSession(configuration: .default)
    init(weatherSession: URLSession) {
        self.weatherSession = weatherSession
    }
    
    // compose url endpoint with cities ids and options
    private func createWeatherRequest() -> URLRequest? {
        let weatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=8fc912efa709857ada8c5ae7ac0cdb87")!
        let request = URLRequest(url: weatherUrl)
        return request
    }
    
    // request service gpsweather
    func getWeather(callback: @escaping (WeatherStruc?) -> Void) {
        guard let request = createWeatherRequest() else { return }
        task?.cancel()
        task = weatherSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
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
        }
        
        task?.resume()
        
    }
}


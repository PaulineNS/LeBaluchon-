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
    
    private func createWeatherRequest(topCityId: Int, bottomCityId: Int) -> URLRequest? {
        let weatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/group?id=\(topCityId),\(bottomCityId)&units=metric&lang=fr&APPID=\(APIKey.openWeatherMap)")!
        let request = URLRequest(url: weatherUrl)
        return request
    }
    
    func getWeather(topCityId: Int, bottomCityId: Int, callback: @escaping (Result <WeatherStruc, Error>) -> Void) {
        guard let request = createWeatherRequest(topCityId: topCityId, bottomCityId: bottomCityId) else { return }
        task?.cancel()
        task = weatherSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    callback(.failure(error))
                    print ("erreur")
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(.failure(NSError(domain: "Network", code: 0, userInfo: nil)))
                    print ("pas de data")
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(WeatherStruc.self, from: data) else {
                    callback(.failure(NSError(domain: "Invalid Data", code: 0, userInfo: nil)))
                    print ("pas de json")
                    return
                }
                
                callback(.success(responseJSON))
            }
        }
        
        task?.resume()
        
    }
}


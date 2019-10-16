//
//  WeatherService.swift
//  LeBaluchonApp
//
//  Created by Pauline Nomballais on 29/08/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import Foundation

final class WeatherService {
    
    private var task: URLSessionDataTask?
    private var weatherSession: URLSession
    
    init(weatherSession: URLSession = URLSession(configuration: .default)) {
        self.weatherSession = weatherSession
    }
    
    private func createWeatherRequest(topCityId: Int, bottomCityId: Int) -> URLRequest? {
        guard let apiKey = ApiKeyExtractor().apiKey, let weatherUrl = URL(string: "http://api.openweathermap.org/data/2.5/group?id=\(topCityId),\(bottomCityId)&units=metric&lang=fr&APPID=\(apiKey.openWeatherMap)") else { return nil }
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


//
//  WeatherService.swift
//  WeatherWidgetExtension
//
//  Created by Surasak Wattanapradit on 19/9/2563 BE.
//

import SwiftUI

class WeatherService {
    let url = URL(string: "https://api.lil.software/weather?latitude=40.709335&longitude=-73.956558")!
    
    func getWeather(completion: @escaping (Result<[Weather]?, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let data = data else {
                completion(.success(nil))
                return
            }
            
            completion(.success(self.getWeatherResponse(fromData: data)))
        }.resume()
    }
    
    private func getWeatherResponse(fromData data: Data) -> [Weather]? {
        let weatherData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        if let weatherD = weatherData {
            return weatherD.forecast
        }

        return nil
    }
}

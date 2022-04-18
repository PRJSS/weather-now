//
//  NetworkWeatherManager.swift
//  Weather Now
//
//  Created by Бернат Данила on 07.04.2022.
//

import Foundation

struct NetworkWeatherManager {
        
    var onComplition: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(latitude lat: Double, longitude lon: Double) {
        guard  let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {return}
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data){
                    self.onComplition?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {return nil}
            return currentWeather
        } catch let error as NSError {
            print(error)
        }
        return nil
        
    }
}

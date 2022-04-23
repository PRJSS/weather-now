//
//  NetworkWeatherManager.swift
//  Weather Now
//
//  Created by Бернат Данила on 07.04.2022.
//

import Foundation

struct NetworkWeatherManager {
        
    var currentWeatherOnComplition: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(latitude lat: Double, longitude lon: Double) {
        guard  let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {return}
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseCurrentWeatherJSON(withData: data){
                    self.currentWeatherOnComplition?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseCurrentWeatherJSON(withData data: Data) -> CurrentWeather? {
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
    
    var forecastWeatherOnComplition: ((ForecastWeather) -> Void)?
    
    func fetchForecastWeather(latitude lat: Double, longitude lon: Double) {
        guard  let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {return}
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let forecastWeather = self.parseForecastWeatherJSON(withData: data){
                    self.forecastWeatherOnComplition?(forecastWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseForecastWeatherJSON(withData data: Data) -> ForecastWeather? {
        let decoder = JSONDecoder()
        do {
            let forecastWeatherData = try decoder.decode(ForecastWeatherData.self, from: data)
            guard let forecastWeather = ForecastWeather(forecastWeatherData: forecastWeatherData) else {return nil}
            return forecastWeather
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
}

//
//  NetworkWeatherManager.swift
//  Weather Now
//
//  Created by Бернат Данила on 07.04.2022.
//

import Foundation

struct NetworkWeatherManager {
    
    func fetchCurrentWeather(latitude lat: Double, longitude lon: Double, completionBlock: @escaping (CurrentWeather) -> Void) {
        guard  let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {return}
        print(url)
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseCurrentWeatherJSON(withData: data){
                    print("2. downloaded")
                    completionBlock(currentWeather)
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
    
    func fetchForecastWeather(latitude lat: Double, longitude lon: Double, completionBlock: @escaping (ForecastWeather) -> Void) {
        guard  let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(apiKey)") else {return}
        print(url)
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let forecastWeather = self.parseForecastWeatherJSON(withData: data){
                    print("2. get forecastWeather")
                    completionBlock(forecastWeather)
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

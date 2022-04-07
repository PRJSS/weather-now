//
//  NetworkWeatherManager.swift
//  Weather Now
//
//  Created by Бернат Данила on 07.04.2022.
//

import Foundation

struct NetworkWeatherManager {
    private let apiKey: String = "4fdb77a3172dc5c34e6e3a20bc6f31cb"
    func fetchCurrentWeather(latitude lat: Float, longitude lon: Float){
            let weatherNowUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(String(lat))&lon=\(String(lon))&appid=\(apiKey))")
                
        let session: URLSession = URLSession(configuration: .default)
        let task = session.dataTask(with: weatherNowUrl!) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}

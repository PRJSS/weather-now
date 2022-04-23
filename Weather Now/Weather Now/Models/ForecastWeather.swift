//
//  ForecastWeather.swift
//  Weather Now
//
//  Created by Бернат Данила on 23.04.2022.
//

import Foundation

struct ForecastWeather {
    struct List {
        var icon: String
        var date: Int
        var temp: Double
        var main: String
        
        init(list: ForecastWeatherData.List) {
            icon = list.weather[0].icon
            main = list.weather[0].description
            date = list.dt
            temp = list.main.temp
        }
    }

    var cityName: String
    var list: [List]

    init?(forecastWeatherData: ForecastWeatherData) {
        cityName = forecastWeatherData.city.name
        list = []
        for element in forecastWeatherData.list {
            let forecast3H = List(list: element)
            list.append(forecast3H)
        }
    }

    

}


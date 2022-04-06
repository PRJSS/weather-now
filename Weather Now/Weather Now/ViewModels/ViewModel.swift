//
//  ViewModel.swift
//  Weather Now
//
//  Created by Бернат Данила on 06.04.2022.
//

import Foundation

class ViewModel {
    private var weatherData: WeatherData = WeatherData()
    var location: String {
        return weatherData.location
    }
    var temp: Float {
        return weatherData.temp
    }
    var main: String {
        return weatherData.main
    }
}

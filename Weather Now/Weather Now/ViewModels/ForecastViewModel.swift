//
//  ForecastViewModel.swift
//  Weather Now
//
//  Created by Бернат Данила on 23.04.2022.
//

import Foundation

struct ForecastViewModel{
    
    var networkWeatherManager = NetworkWeatherManager()
    var locationData = LocationData()
    var forecastWeather: ForecastWeather?
    
    var latitude: Double {
        return locationData.latitude
    }
    
    var longitude: Double {
        return locationData.longitude
    }
    
    var location: String {
        return "\(forecastWeather?.cityName ?? "London")"
    }
    
}

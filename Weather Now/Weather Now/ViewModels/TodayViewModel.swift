//
//  ViewModel.swift
//  Weather Now
//
//  Created by Бернат Данила on 06.04.2022.
//

import Foundation
import CoreLocation
import UIKit

struct TodayViewModel {
    
    var networkWeatherManager = NetworkWeatherManager()
    var locationData = LocationData()
    var currentWeather = CurrentWeather()
    
    var latitude: Double {
        return locationData.latitude
    }
    
    var longitude: Double {
        return locationData.longitude
    }
    
    var location: String {
        return "\(currentWeather.cityName), \(currentWeather.countryName)"
    }
    
    var temperatureAndCondition: String {
        
        return "\(Int(currentWeather.temperature - 273.15))ºC | Sunny"
    }
    
    var pressure: String {
        return "\(Int(currentWeather.pressure)) hPa"
    }
    
    var cloudiness: String {
        return "\(Int(currentWeather.cloudiness))%"
    }
    
    var rain: String {
        return "\(currentWeather.rain) mm"
    }
    
    var windSpeed: String {
        return "\(Int(currentWeather.windSpeed)) km/h"
    }
    
    var windDeg: String {
        switch Int(currentWeather.windDeg) {
        case 0...11:
            return "N"
        case 350...365:
            return "N"
        case 12...34:
            return "NNE"
        case 35...56:
            return "NE"
        case 57...79:
            return "ENE"
        case 80...101:
            return "E"
        case 102...124:
            return "ESE"
        case 125...146:
            return "SE"
        case 147...169:
            return "SSE"
        case 170...191:
            return "S"
        case 192...214:
            return "SSW"
        case 215...236:
            return "SW"
        case 237...259:
            return "WSW"
        case 260...281:
            return "W"
        case 282...304:
            return "WNW"
        case 305...326:
            return "NW"
        case 327...349:
            return "NNW"
        default:
            return "NaN"
        }
    }
    
//    func updateWeather () {
//        LocationManager.shared.getUserLocation { location in
//            self.
//        }
//        self.networkWeatherManager.
//    }
}



//
//  ViewModel.swift
//  Weather Now
//
//  Created by Бернат Данила on 06.04.2022.
//

import Foundation

struct TodayViewModel {
    
    var networkWeatherManager = NetworkWeatherManager()
    var locationData = LocationData()
    var currentWeather = CurrentWeather()
    
    var mainCondition: String {
        return currentWeather.main
    }
    
    var latitude: Double {
        return locationData.latitude
    }
    
    var longitude: Double {
        return locationData.longitude
    }
    
    var location: String {
        return "\(currentWeather.cityName), \(currentWeather.countryName)"
    }
    
    var temperature: String {
        
        return "\(Int(currentWeather.temperature - 273.15))ºC"
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
    
    var date: String {
        let timeResult = Double(currentWeather.date)
        let date = Date(timeIntervalSince1970: timeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return "\(localDate)"
    }
    
    var image: String {
        let image = currentWeather.icon
        switch image {
        case "01d":
            return "sun.max"
        case "02d":
            return "cloud.sun"
        case "03d":
            return "cloud"
        case "04d":
            return "smoke"
        case "09d":
            return "cloud.drizzle"
        case "10d":
            return "cloud.sun.rain"
        case "11d":
            return "cloud.bolt.rain"
        case "13d":
            return "snowflake"
        case "50d":
            return "cloud.fog"
            
        case "01n":
            return "moon"
        case "02n":
            return "cloud.moon"
        case "03n":
            return "cloud"
        case "04n":
            return "smoke"
        case "09n":
            return "cloud.drizzle"
        case "10n":
            return "cloud.moon.rain"
        case "11n":
            return "cloud.bolt.rain"
        case "13n":
            return "snowflake"
        case "50n":
            return "cloud.fog"
        
        default:
            return "sun.max"
        }
    }
}



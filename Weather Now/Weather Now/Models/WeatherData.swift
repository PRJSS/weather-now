//
//  WeatherData.swift
//  Weather Now
//
//  Created by Бернат Данила on 06.04.2022.
//

import Foundation

struct WeatherData {
    let location: String = "NaN"
    let temp: Float = 0
    let main: String = "NaN"
    
}

struct GetRequestData {
    let latitudeData: Float = 51.509865
    let longitudeData: Float = -0.118092
}

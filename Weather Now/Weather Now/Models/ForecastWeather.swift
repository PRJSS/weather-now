//
//  ForecastWeather.swift
//  Weather Now
//
//  Created by Бернат Данила on 23.04.2022.
//

import Foundation

struct ForecastWeather {
    var cityName: String
    var days: [WeatherDay]
    
    //    var numberOfDays: Int
    //    var daysSet: Set<String>
    //    var daysList: [String]
    
    init?(forecastWeatherData: ForecastWeatherData) {
        cityName = forecastWeatherData.city.name
        
        days = []
        days.append(WeatherDay(weather3h: Weather3H(weather3Hdata: forecastWeatherData.list[0])))
        
        
        var i = 1
        
        while i < forecastWeatherData.list.count {
            let weather3h = Weather3H(weather3Hdata: forecastWeatherData.list[i])
            if isFromOneDay(dt1: days[days.count - 1].Weather3HList[0].date, dt2: weather3h.date) {
                days[days.count - 1].Weather3HList.append(weather3h)
            } else {
                days.append(WeatherDay(weather3h: weather3h))
            }
            i += 1
                
        }
        
        
        
    }
    
    struct WeatherDay {
        var dayName: String
        var Weather3HList: [Weather3H]
        
        init(weather3h: Weather3H) {
            dayName = dateToDayName(dt: weather3h.date)
            
            Weather3HList = []
            Weather3HList.append(weather3h)
        }
    }
    
    //    struct ListOfForecast {
    //        struct DateType {
    //            var dayInMonth: String
    //            var dayName: String
    //            var dayTime: String
    //        }
    //        var icon: String
    //        var temp: String
    //        var main: String
    //        var dateType: DateType
    //
    //        init(list: ForecastWeatherData.List) {
    //            icon = list.weather[0].icon
    //            main = list.weather[0].description
    //            temp = "\(list.main.temp) ºC"
    //
    //            dateType.dayInMonth = {
    //                let timeResult = Double(list.dt)
    //                let date = Date(timeIntervalSince1970: timeResult)
    //                let dateFormatter = DateFormatter()
    //                dateFormatter.dateFormat = "d" //Set date style
    //                dateFormatter.timeZone = .current
    //                let localDate = dateFormatter.string(from: date)
    //                return "\(localDate)"
    //            }()
    //            dateType.dayTime = {
    //                let timeResult = Double(list.dt)
    //                let date = Date(timeIntervalSince1970: timeResult)
    //                let dateFormatter = DateFormatter()
    //                dateFormatter.dateFormat = "HH:mm" //Set time style
    //                dateFormatter.timeZone = .current
    //                let localDate = dateFormatter.string(from: date)
    //                return "\(localDate)"
    //            }()
    //        }
    //    }
}

struct Weather3H {
    var date: Int
    var time: String
    var main: String
    var temp: String
    var icon: String
    
    init(weather3Hdata: ForecastWeatherData.List) {
        date = weather3Hdata.dt
        time = dateToTime(dt: weather3Hdata.dt)
        main = weather3Hdata.weather[0].main
        temp = "\(weather3Hdata.main.temp) ºC"
        icon = weather3Hdata.weather[0].icon
    }
}

fileprivate func dateToDayName (dt: Int) -> String {
    let timeResult = Double(dt)
    let date = Date(timeIntervalSince1970: timeResult)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE" //Set date style
    dateFormatter.timeZone = .current
    let localDate = dateFormatter.string(from: date)
    return localDate
}

fileprivate func dateToTime (dt: Int) -> String {
    let timeResult = Double(dt)
    let date = Date(timeIntervalSince1970: timeResult)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm" //Set time style
    dateFormatter.timeZone = .current
    let localDate = dateFormatter.string(from: date)
    return localDate
}

fileprivate func isFromOneDay (dt1: Int, dt2: Int) -> Bool {
    let date1 = Date(timeIntervalSince1970: Double(dt1))
    let date2 = Date(timeIntervalSince1970:  Double(dt2))

    return Calendar.current.isDate(date1, inSameDayAs: date2)
}


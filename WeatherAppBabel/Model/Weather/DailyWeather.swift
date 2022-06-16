//
//  DailyWeather.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    
    var id: Date {
        return time
    }
    
    var time: Date
    var temp: Temp
    var weatherList: [WeatherList]
    
    enum CodingKeys: String, CodingKey {
        
        case time = "dt"
        case temp = "temp"
        case weatherList = "weather"
        
    }
    
}
struct Temp: Codable {
    let day, min, max, night, eve, morn: Double
}


//
//  HourlyWeather.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation

struct HourlyWeather: Codable, Identifiable {
    
    var id: Date {
        return time
    }
    
    var time: Date
    var temp: Double
    var humidity: Double
    var pressure: Double
    var weatherList: [WeatherList]
    
    
    enum CodingKeys: String, CodingKey {
        case time = "dt"
        case temp = "temp"
        case humidity = "humidity"
        case pressure = "pressure"
        case weatherList = "weather"
        
    }
    
    
}

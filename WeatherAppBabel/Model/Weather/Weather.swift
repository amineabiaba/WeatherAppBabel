//
//  Weather.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation

struct Weather: Codable {
    
    var current: HourlyWeather
    var hours: [HourlyWeather]
    var week: [DailyWeather]
    
    enum CodingKeys: String, CodingKey {
        
        case current = "current"
        case hours = "hourly"
        case week = "daily"
        
    }
    
}

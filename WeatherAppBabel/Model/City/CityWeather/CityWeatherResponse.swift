//
//  CityWeatherResponse.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation

extension CityWeather {
    
    struct Response: Codable {
    
        var id: Int
        var name: String
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
        }
        
    }
    
}


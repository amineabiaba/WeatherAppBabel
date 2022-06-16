//
//  NetworkManager.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import UIKit

class NetworkManager: NSObject {
    
    struct ApiKey {
        static let openweathermap: String = "5aa8d384afe4769c566762d5e85249ba"   //  Openweathermap API key
    }
    struct BaseURL {
        static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    }
    
    
    struct APIURL {
        static func weatherRequest(longitude: Double, latitude: Double) -> String {
            return "\(NetworkManager.BaseURL.baseURLString)onecall?lat=\(latitude)&lon=\(longitude)&appid=\(NetworkManager.ApiKey.openweathermap)&units=metric"
        }
        static func cityWeather(for search: String) -> String {
            return "\(NetworkManager.BaseURL.baseURLString)weather?q=\(search.replacingOccurrences(of: " ", with: "+"))&appid=\(NetworkManager.ApiKey.openweathermap)&units=metric"
            
        }
        static func cityData(for placeID: String) ->  String {
            return "\(NetworkManager.BaseURL.baseURLString)forecast?id=\(placeID)&appid=\(NetworkManager.ApiKey.openweathermap)&units=metric"
        }
        
    }
    
}

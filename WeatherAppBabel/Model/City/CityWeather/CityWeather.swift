//
//  CityWeather.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import SwiftUI
import Combine

class CityWeather: NSObject, ObservableObject {
    
    private var cityWeatherManager: CityWeatherManager
    
    @Published var city: CityWeather.Response?
    
    @Published var isValidingCity: Bool? = false
    
    override init() {
        cityWeatherManager = CityWeatherManager()
        super.init()
    }
    
    
    func search(_ search: String,completion: @escaping (_ isValidingCity:Bool) -> Void) {
        cityWeatherManager.getCityWeather(for: search) { (result) in
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.city = response
                    completion(true)
                }
            case .failure:
                completion(false)
                break
            }
        }
    }
    
}

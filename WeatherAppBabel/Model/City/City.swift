//
//  CityModel.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation
import SwiftUI
class City: ObservableObject{
        
    var name: String
    var longitude: Double
    var latitude: Double
    
    @Published var image: UIImage?
    @Published var weather: Weather?
    @Published var isLoading: Bool? = true
    
  
    init(name:String = "", longitude:Double, latitude:Double,_ image:UIImage? = nil,_ weather:Weather? = nil ){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.getWeather()
    }
    
    init(cityData data: CityValidation.CityData) {
        self.name = data.name
        self.longitude = data.location.longitude
        self.latitude = data.location.latitude
        self.image = nil
        self.weather = nil
        self.getWeather()
    }
    
    private func getWeather() {
        WeatherManager.getWeather(for: self) { (weather) in
            DispatchQueue.main.async {
                switch weather {
                case .success(var weather):
                    weather?.week.removeLast()
                    weather?.week.removeLast()
                    weather?.week.removeLast()
                    self.weather = weather
                    self.isLoading = false
                default:
                    break
                }
            }
        }
    }
    public func loadingState(state:Bool){
        self.isLoading = state
        getWeather()
    }
    
}

//
//  DefaultCityList.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation

class DefaultCityList:  ObservableObject {
   
      @Published var isKeyboardPresented: Bool = false
       @Published var cities: [City] = [City(name: "Casablanca", longitude: -7.603869, latitude: 33.589886),
                                     City(name: "Rabat", longitude: -6.8498129, latitude: 33.9715904),
                                     City(name: "Marrakech", longitude: -8.008889, latitude: 31.630000),
                                     City(name: "Tangier", longitude: -5.833954, latitude: 35.759465),
                                     City(name: "Fes", longitude: -5.000000, latitude: 34.033333)]
}


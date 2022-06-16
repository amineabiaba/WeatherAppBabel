//
//  Double+Extension.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation

extension Double {
    
    var formattedTemperature: String {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        
        let formattedDouble = formatter.string(from: NSNumber(value: self)) ?? "-"
        return formattedDouble + "ºC"
    }
    
    var formattedDouble: String {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        
        let formattedDouble = formatter.string(from: NSNumber(value: self)) ?? "-"
        return formattedDouble
    }
    
}

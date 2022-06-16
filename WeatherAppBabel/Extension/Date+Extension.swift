//
//  Date+Extension.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation
import SwiftUI
import Combine
extension Date {
    
    var formattedHour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: self)
    }
    
    var formattedDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: self)
    }
    
}

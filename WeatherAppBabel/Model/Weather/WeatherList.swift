//
//  WeatherListModel.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation

struct WeatherList: Codable, Identifiable {
    var id: Int
    var main: String
    var description: String
    var icon: String
   
}

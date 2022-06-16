//
//  CityValidationResponse.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation
extension CityValidation {
    
    
    struct Response: Codable {
        
        var cityData: CityData
        
        enum CodingKeys: String, CodingKey {
            
            case cityData = "city"
            
        }
        
    }
    
    struct CityData: Codable {
        
        var name: String
        var location: Location
            
            enum CodingKeys: String, CodingKey {
                
                case name = "name"
                case location = "coord"
                
            }
            
            struct Location: Codable {
                
                var longitude: Double
                var latitude: Double
                
                enum CodingKeys: String, CodingKey {
                    
                    case longitude = "lon"
                    case latitude = "lat"
                    
                }
                
            }
            
        
        
    }
    
}

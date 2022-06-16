//
//  APIError.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation

enum APINetworkError: Error {
    case decode
    case response
    case url
}

extension APINetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decode:
            return NSLocalizedString("Failed to decode api data", comment: "")
        case .response:
            return NSLocalizedString("Failed to get data from API", comment: "")
        case .url:
            return NSLocalizedString("Failed to generate URL", comment: "")
            
        }
    }
}

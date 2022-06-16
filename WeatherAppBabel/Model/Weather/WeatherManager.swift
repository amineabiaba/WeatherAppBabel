//
//  WeatherManager.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation

class WeatherManager {
    
    static func getWeather(for city: City, _ completion: @escaping (Result<Weather?,APINetworkError>) -> Void) {
        guard let url = URL(string: NetworkManager.APIURL.weatherRequest(longitude: city.longitude, latitude: city.latitude)) else {
            completion(.failure(.url))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.response))
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
               
                decoder.dateDecodingStrategy = .secondsSince1970
                let weatherObject = try decoder.decode(Weather.self, from: data)
                completion(.success(weatherObject))
            } catch {
                print(error)
                completion(.failure(.decode))
            }
        }.resume()
    }
    
}

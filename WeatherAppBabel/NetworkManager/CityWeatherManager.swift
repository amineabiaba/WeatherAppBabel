//
//  CityWeatherManager.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation
class CityWeatherManager: NSObject {
    
    var completionTask: URLSessionDataTask?
    
    func getCityWeather(for search: String, _ completion: @escaping (Result<CityWeather.Response?,APINetworkError>) -> Void) {
        guard let url = URL(string: NetworkManager.APIURL.cityWeather(for: search)) else {
            completion(.failure(.url))
            return
        }
        
        completionTask?.cancel()
        
        completionTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.response))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(CityWeather.Response.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(.decode))
            }
        }
        
        completionTask?.resume()
    }
    
}

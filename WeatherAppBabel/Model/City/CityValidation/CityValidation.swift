//
//  CityValidation.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 14/06/2022.
//

import Foundation

class CityValidation: NSObject {
    
    class func validateCity(withID placeID: String, _ completion: @escaping (Result<City?,APINetworkError>) -> Void) {
        guard let url = URL(string: NetworkManager.APIURL.cityData(for: placeID)) else {
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
                let result = try decoder.decode(CityValidation.Response.self, from: data)
                completion(.success(City(cityData: result.cityData)))
            } catch {
                print(error)
                completion(.failure(.decode))
            }
        }.resume()
    }

}

//
//  NetworkManagerProtocol.swift
//  WeatherAppBabel
//
//  Created by inDataCore on 13/06/2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getWeather(for city: City,completion: @escaping (Result<Weather?,APINetworkError>) -> Void)
    func getCityWeather(for search: String,completion: @escaping (Result<CityWeather.Response?,APINetworkError>) -> Void)
    func validateCity(withID placeID: String,completion: @escaping (Result<City?,APINetworkError>) -> Void)
}

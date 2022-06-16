//
//  WeatherAppBabelTests.swift
//  WeatherAppBabelTests
//
//  Created by inDataCore on 13/06/2022.
//

import XCTest
@testable import WeatherAppBabel

class WeatherAppBabelTests: XCTestCase {

    func test_getWeather_with_ValidRequest_Returns_Weather() {
        // ARRANGE
        let city = City(name: "casa", longitude: -7.603869, latitude: 33.589886)
        let expectation = self.expectation(description: "ValidRequest_Returns_Weather")
        WeatherManager.getWeather(for: city) { (response) in
            // ASSERT
            switch response {
            case .success(let weather):
                XCTAssertNotNil(weather)
            case .failure(let response_error):
                XCTAssertNil(response_error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
    }
    
    func test_getWeather_with_InValidRequest_Returns_Error() {
        // ARRANGE
        let city = City(name: "Fake City", longitude: -700.603869, latitude: 3300.589886)
        let expectation = self.expectation(description: "ValidRequest_Returns_Error")
        WeatherManager.getWeather(for: city) { (response) in
            // ASSERT
            switch response {
            case .success(let weather):
                XCTAssertNil(weather)
            case .failure(let response_error):
                XCTAssertNotNil(response_error)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
    }
    
    func test_getCityWeather_with_ValidRequest_Returns_City() {
        // ARRANGE
        let cityWeatherManager: CityWeatherManager =  CityWeatherManager()
        cityWeatherManager.getCityWeather(for: "settat"){ response in
            
            switch response {
            case .success(let city):
                XCTAssertNotNil(city)
                XCTAssertEqual(12900, city?.id)
                XCTAssertEqual("settat", city?.name)
            case .failure(let response_error):
                XCTAssertNil(response_error)
            }
            
        }
        
    }
    
    func test_getCityWeather_with_InValidRequest_Returns_Error() {
        // ARRANGE
        let cityWeatherManager: CityWeatherManager =  CityWeatherManager()
        cityWeatherManager.getCityWeather(for: "settat"){ response in
            
            switch response {
            case .success(let city):
                XCTAssertNil(city)
            case .failure(let response_error):
                XCTAssertNotNil(response_error)
            }
            
        }
        
    }
    
    
    func test_validateCity_with_ValidRequest_Returns_City() {
        // ARRANGE
        CityValidation.validateCity(withID: "12900"){ response in
            switch response{
            case .success(let city):
                XCTAssertNotNil(city)
                XCTAssertEqual("settat", city?.name)
                XCTAssertEqual(15.00000, city?.latitude)
                XCTAssertEqual(-89.00000, city?.longitude)
            case .failure(let response_error):
                XCTAssertNil(response_error)
            }
            
            
            
        }
        
    }
    func test_validateCity_with_InValidRequest_Returns_Error() {
        // ARRANGE
        let expectation = self.expectation(description: "ValidRequest_Returns_Error")
        CityValidation.validateCity(withID: "12900"){ response in
            switch response{
            case .success(let city):
                XCTAssertNotNil(city)
                XCTAssertEqual("settat", city?.name)
                XCTAssertEqual(15.00000, city?.latitude)
                XCTAssertEqual(-89.00000, city?.longitude)
            case .failure(let response_error):
                XCTAssertNil(response_error)
            }
            
            expectation.fulfill()
            
        }
        waitForExpectations(timeout: 10)
        
    }

}

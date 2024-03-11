//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

class HomeViewModel {
    
    // MARK: - Dependencies

    private let requestManager: RequestManagerProtocol
    var weatherReport: WeatherReport?
    
    // MARK: - Initializer
    
    init(
        requestManager: RequestManagerProtocol = RequestManager()
    ) {
        self.requestManager = requestManager
    }
    
    // MARK: -
    
    func getWeather(for city: String) async {
        print(city)
        do {
            let response: WeatherReport = try await requestManager
                .perform(
                    WeatherRequest
                        .getWeatherInfo(city: city))
            
            self.weatherReport = response
            DispatchQueue.main.async {
                print(response)
            }
        } catch {
            DispatchQueue.main.async {
                print("Error occured!")
            }
        }
    }
}

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
    var weatherReport: WeatherInfo?
    
    // MARK: - Initializer
    
    init(
        requestManager: RequestManagerProtocol = RequestManager()
    ) {
        self.requestManager = requestManager
    }
    
    // MARK: -
    
    func getWeather(for city: String) async {
        
        do {
            let response: WeatherReport = try await requestManager
                .perform(
                    WeatherRequest
                        .getWeatherInfo(city: city))
            
            DispatchQueue.main.async {
                self.weatherReport = .init(with: response)
            }
        } catch let error {
            DispatchQueue.main.async {
                print(error.localizedDescription)
            }
        }
    }
}

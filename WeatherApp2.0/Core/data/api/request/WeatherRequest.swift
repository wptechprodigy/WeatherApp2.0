//
//  WeatherRequest.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

struct City {
    let name: String
}

enum WeatherRequest: RequestProtocol {
    
    case getWeatherInfo(city: String)
    
    var path: String {
        switch self {
        case .getWeatherInfo(city: _):
            return "/data/2.5/weather"
        }
    }
    
    var urlParams: [String : String?] {
        switch self {
        case .getWeatherInfo(let city):
            return [
                "q": city,
                "appid": "789a1b8462a94aad61fac5026ec49a08"
            ]
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .getWeatherInfo(let city):
            return [:]
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .getWeatherInfo(let city):
            return .GET
        }
    }
}

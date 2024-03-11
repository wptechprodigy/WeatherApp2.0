//
//  WeatherReport.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

struct WeatherReport: Decodable {
    let weather: Weather
    let main: MainWD
}

struct Weather: Decodable {
    let info: [Description]
}

struct Description: Decodable {
    let description: String
}

struct MainWD: Decodable {
    let temp: Double
}

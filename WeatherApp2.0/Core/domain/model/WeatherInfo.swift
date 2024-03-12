//
//  WeatherInfo.swift
//  WeatherApp2.0
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

struct WeatherInfo {
    let description: String
    let temp: String
}

extension WeatherInfo {
    init(with weatherReport: WeatherReport) {
        self.description = weatherReport.weather[0].description
        self.temp = weatherReport.main.temp.toString
    }
}

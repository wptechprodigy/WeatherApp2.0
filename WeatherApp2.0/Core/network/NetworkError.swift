//
//  NetworkError.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

enum NetworkError: LocalizedError {
    case serverError(Int)
    case requestError(Int)
    case notFound
    case invalidURL
}

//
//  APIManager.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {

    // MARK: - Dependecies

    private let urlSession: URLSession

    // MARK: - Initializer

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    // MARK: - Request

    func perform(_ request: RequestProtocol) async throws -> Data {
        let (data, response) = try await urlSession.data(
            for: request.createURLRequest())

        let httpResponse = response as! HTTPURLResponse
        switch httpResponse.statusCode {
            case 200:
                return data
            case 404:
                throw NetworkError.notFound
            case 500...599:
                throw NetworkError.serverError(httpResponse.statusCode)
            default:
                throw NetworkError.serverError(httpResponse.statusCode)
        }
    }
}


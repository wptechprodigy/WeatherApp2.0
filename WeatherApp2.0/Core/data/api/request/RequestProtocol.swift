//
//  RequestProtocol.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

enum RequestType: String {
    case GET
}

protocol RequestProtocol {
    var path: String { get }
    var urlParams: [String: String?] { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var addAuthorizationToken: Bool { get }
    var requestType: RequestType { get }

    func createURLRequest(bearerToken: String?) throws -> URLRequest
}

extension RequestProtocol {

    private var host: String {
        return APIConstants.baseURL
    }

    var urlParams: [String: String?] {
        return [:]
    }

    var headers: [String: String] {
        return [:]
    }

    var params: [String: Any] {
        return [:]
    }

    var addAuthorizationToken: Bool {
        return false
    }

    func createURLRequest(bearerToken: String? = nil) throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path

        if !urlParams.isEmpty {
            urlComponents.queryItems = urlParams.map {
                return URLQueryItem(name: $0, value: $1)
            }
        }

        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        if addAuthorizationToken {
            if let bearerToken = bearerToken {
                urlRequest
                    .setValue(
                        bearerToken,
                        forHTTPHeaderField: "Authorization")
            }
        }

        urlRequest.setValue("*/*", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
}

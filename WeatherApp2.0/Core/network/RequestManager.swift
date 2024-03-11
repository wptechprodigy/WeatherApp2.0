//
//  RequestManager.swift
//  WeatherApp
//
//  Created by waheedCodes on 11/03/2024.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {

    // MARK: - Dependencies

    let apiMananger: APIManagerProtocol
    let parser: DataParserProtocol

    // MARK: - Initializers

    init(apiMananger: APIManagerProtocol = APIManager(),
         parser: DataParserProtocol = DataParser()) {
        self.apiMananger = apiMananger
        self.parser = parser
    }

    // MARK: - Request

    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiMananger.perform(request)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}

//
//  RemoteCityFinder.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

public final class RemoteCityFinder: CityFinder {
    private let baseURL: URL
    private let appId: String
    private let httpClient: HTTPClient

    public enum Error: Swift.Error {
        case invalidData
        case genericError
    }

    public init(baseURL: URL, appId: String, httpClient: HTTPClient) {
        self.baseURL = baseURL
        self.appId = appId
        self.httpClient = httpClient
    }

    public func search(_ text: String, completion: @escaping (SearchCityResult) -> Void) {
        let url = CityFinderEndpoint.get(text: text).url(baseURL: baseURL, appId: appId)

        httpClient.get(from: url) { result in
            guard let (data, response) = try? result.get() else {
                completion(.failure(Error.genericError))
                return
            }
            do {
                let cities = try RemoteCityFinder.map(data, from: response)
                completion(.success(cities))
            } catch {
                completion(.failure(error))
            }
        }
    }

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [CityElement] {
        guard response.isOK, let cities = try? JSONDecoder().decode(City.self, from: data) else {
            throw Error.invalidData
        }
        return cities
    }
}

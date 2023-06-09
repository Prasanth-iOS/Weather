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

    public init(baseURL: URL, appId: String, httpClient: HTTPClient) {
        self.baseURL = baseURL
        self.appId = appId
        self.httpClient = httpClient
    }

    public func search(_ text: String, completion: @escaping (SearchCityResult) -> Void) {
        let url = CityFinderEndpoint.get(text: text).url(baseURL: baseURL, appId: appId)

        httpClient.get(from: url) { result in
            guard let (data, response) = try? result.get() else {
                completion(.failure(WeatherError.genericError))
                return
            }
            do {
                let cities: [CityElement] = try CommonMapper.map(data, from: response)
                completion(.success(cities))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

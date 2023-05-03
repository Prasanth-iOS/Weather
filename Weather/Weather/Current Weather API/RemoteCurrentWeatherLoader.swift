//
//  RemoteCurrentWeatherLoader.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

public final class RemoteCurrentWeatherLoader: CurrentWeatherLoader {
    private let baseURL: URL
    private let appId: String
    private let httpClient: HTTPClient

    public init(baseURL: URL, appId: String, httpClient: HTTPClient) {
        self.baseURL = baseURL
        self.appId = appId
        self.httpClient = httpClient
    }

    public func load(_ lat: String, long: String, completion: @escaping (CurrentWeatherResult) -> Void) {
        let url = CurrentWeatherEndPoint.get(lat: lat, long: long).url(baseURL: baseURL, appId: appId)

        httpClient.get(from: url) { result in
            guard let (data, response) = try? result.get() else {
                completion(.failure(WeatherError.genericError))
                return
            }
            do {
                let currentWeather: CurrentWeather = try CommonMapper.map(data, from: response)
                completion(.success(currentWeather))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

//
//  CurrentWeatherEndPoint.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

public enum CurrentWeatherEndPoint {
    case get(lat: String, long: String)
    
    public func url(baseURL: URL, appId: String) -> URL {
        switch self {
        case let .get(lat, lon):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/data/2.5/weather"
            components.queryItems = [
                URLQueryItem(name: "lat", value: lat),
                URLQueryItem(name: "lon", value: lon),
                URLQueryItem(name: "appid", value: appId)
            ]
            return components.url!
        }
    }
}

//
//  CityFinderEndpoint.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

public enum CityFinderEndpoint {
    case get(text: String)
    
    public func url(baseURL: URL, appId: String) -> URL {
        switch self {
        case let .get(text):
            var components = URLComponents()
            components.scheme = baseURL.scheme
            components.host = baseURL.host
            components.path = baseURL.path + "/geo/1.0/direct"
            components.queryItems = [
                URLQueryItem(name: "q", value: text),
                URLQueryItem(name: "limit", value: "10"),
                URLQueryItem(name: "appid", value: appId)
            ]
            return components.url!
        }
    }
}

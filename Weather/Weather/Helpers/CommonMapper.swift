//
//  CommonMapper.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

struct CommonMapper {
    static func map<T: Codable>(_ data: Data, from response: HTTPURLResponse) throws -> T {
        guard response.isOK, let data = try? JSONDecoder().decode(T.self, from: data) else {
            throw WeatherError.invalidData
        }
        return data
    }
}

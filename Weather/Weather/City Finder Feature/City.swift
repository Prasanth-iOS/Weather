//
//  City.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

// MARK: - CityElement
public struct CityElement: Codable {
    public let name: String
    public let localNames: [String: String]?
    public let lat, lon: Double
    public let country, state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}

public typealias City = [CityElement]


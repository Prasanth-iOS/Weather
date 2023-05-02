//
//  City.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

// MARK: - CityElement
struct CityElement: Codable {
    let name: String
    let localNames: [String: String]?
    let lat, lon: Double
    let country, state: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country, state
    }
}

typealias City = [CityElement]


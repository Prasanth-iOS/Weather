//
//  CityFinder.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

public typealias SearchCityResult = Result<City, Error>

public protocol CityFinder {
    func search(_ text: String, completion: @escaping (SearchCityResult) -> Void)
}

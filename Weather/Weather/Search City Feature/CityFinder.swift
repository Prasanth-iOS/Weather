//
//  CityFinder.swift
//  Weather
//
//  Created by Prasanth on 02/05/23.
//

import Foundation

typealias SearchCityResult = Result<City, Error>

protocol CityFinder {
    func search(_ text: String, completion: @escaping (SearchCityResult) -> Void)
}

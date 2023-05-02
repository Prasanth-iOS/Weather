//
//  CurrentWeatherLoader.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

public typealias CurrentWeatherResult = Result<CurrentWeather, Error>

public protocol CurrentWeatherLoader {
    func load(_ lat: String, long: String, completion: @escaping (SearchCityResult) -> Void)
}

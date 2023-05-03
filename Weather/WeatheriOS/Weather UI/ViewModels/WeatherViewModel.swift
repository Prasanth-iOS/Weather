//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

public final class WeatherViewModel {
    private let weatherLoader: CurrentWeatherLoader
    private var weather: CurrentWeather?
    var annotation: Annotation?

    public init(weatherLoader: CurrentWeatherLoader) {
        self.weatherLoader = weatherLoader
    }

    public var onWeatherLoad: (() -> Void)?

    var lat: Double? {
        return weather?.coord?.lat
    }

    var lon: Double? {
        return weather?.coord?.lon
    }

    public func loadWeatherData(_ lat: Double, long: Double) {
        weatherLoader.load(String(lat), long: String(long)) { [weak self] result in
            if let weather = try? result.get() {
                self?.weather = weather
                self?.annotation = Annotation(weather: weather)
                self?.onWeatherLoad?()
            }
            // handle error scenario
        }
    }
}

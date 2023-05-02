//
//  CitySearchViewModel.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

final class CitySearchViewModel {
    typealias Observer<T> = (T) -> Void

    private let cityFinder: CityFinder
    
    init(cityFinder: CityFinder) {
        self.cityFinder = cityFinder
    }

    var onSearchingStateChange: Observer<Bool>?
    var onSearchCities: Observer<[CityElement]>?

    func searchCity(with text: String) {
        onSearchingStateChange?(true)
        cityFinder.search(text) { [weak self] result in
            if let cities = try? result.get() {
                self?.onSearchCities?(cities)
            }
            self?.onSearchingStateChange?(false)
        }
    }
}

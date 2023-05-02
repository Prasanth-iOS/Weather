//
//  CitySearchViewModel.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

public final class CitySearchViewModel {
    public typealias Observer<T> = (T) -> Void

    private let cityFinder: CityFinder
    
    public init(cityFinder: CityFinder) {
        self.cityFinder = cityFinder
    }

    public var onSearchingStateChange: Observer<Bool>?
    public var onSearchCompletion: Observer<[CityElement]>?

    func searchCity(with text: String) {
        onSearchingStateChange?(true)
        cityFinder.search(text) { [weak self] result in
            if let cities = try? result.get() {
                DispatchQueue.main.async {
                    self?.onSearchCompletion?(cities)
                }
            }
            self?.onSearchingStateChange?(false)
        }
    }
}

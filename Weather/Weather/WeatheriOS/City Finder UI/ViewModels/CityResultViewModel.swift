//
//  CityResultViewModel.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

final class CityResultViewModel {
    let city: CityElement

    init(city: CityElement) {
        self.city = city
    }

    var title: String {
        let name = city.name
        let state = city.state
        let country = city.country
        return "\(name), \(state), \(country)"
    }
}

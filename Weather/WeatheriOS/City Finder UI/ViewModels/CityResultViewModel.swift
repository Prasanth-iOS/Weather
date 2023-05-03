//
//  CityResultViewModel.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import Foundation

public final class CityResultViewModel {
    let city: CityElement

    public init(city: CityElement) {
        self.city = city
    }

    var title: String {
        var title = city.name
        if let state = city.state, state.count > 0 {
            title += ", \(state)"
        }
        if let country = city.country, country.count > 0 {
            title += ", \(country)"
        }
        return title
    }
}

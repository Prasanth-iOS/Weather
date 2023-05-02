//
//  WeatherUIComposer.swift
//  WeatherApp
//
//  Created by Prasanth on 03/05/23.
//

import UIKit
import Weather

public final class WeatherUIComposer {
    private init() {}
    
    public static func composedWith(cityFinder: CityFinder) -> WeatherViewController {
        let cityResultViewController = CityResultViewController()
        
        let citySearchVM = CitySearchViewModel(cityFinder: cityFinder)
        let citySearchViewController = CitySearchViewController(searchResultsController: cityResultViewController)
        citySearchViewController.viewModel = citySearchVM
        citySearchVM.onSearchCompletion = { cities in
            cityResultViewController.tableModel = cities.map { CityResultViewModel(city: $0)
            }
        }

        let weatherViewController = makeWeatherViewController()
        weatherViewController.searchVC = citySearchViewController
        
        return weatherViewController
    }
    
    private static func makeWeatherViewController() -> WeatherViewController {
        let bundle = Bundle(for: WeatherViewController.self)
        let storyboard = UIStoryboard(name: "Weather", bundle: bundle)
        let weatherViewController = storyboard.instantiateInitialViewController() as! WeatherViewController
        return weatherViewController
    }
}


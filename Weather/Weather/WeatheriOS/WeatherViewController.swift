//
//  WeatherViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import UIKit

class WeatherViewController: UIViewController {

    let searchVC = UISearchController(searchResultsController: CityResultViewController())

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Weather"
        navigationItem.searchController = searchVC
    }

}

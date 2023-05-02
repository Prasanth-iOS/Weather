//
//  WeatherViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import UIKit

public final class WeatherViewController: UIViewController {

    public var searchVC: UISearchController?

    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Weather"
        navigationItem.searchController = searchVC
    }

}

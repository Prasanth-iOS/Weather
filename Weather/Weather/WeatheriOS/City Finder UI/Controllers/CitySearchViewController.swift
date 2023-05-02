//
//  CitySearchViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import UIKit

final class CitySearchViewController: NSObject {
    private(set) lazy var view = binded(UISearchBar())
    
    private let viewModel: CitySearchViewModel

    init(viewModel: CitySearchViewModel) {
        self.viewModel = viewModel
    }

    func searchCity(_ text: String) {
        viewModel.searchCity(with: text)
    }

    private func binded(_ view: UISearchBar) -> UISearchBar {
        viewModel.onSearchingStateChange = { [weak self] isLoading in
            if isLoading {
                // should inform to show spinner
            } else {
                // should inform to hide spinner
            }
        }
        view.returnKeyType = .search
        view.enablesReturnKeyAutomatically = true
        view.placeholder = "Search City"
        view.showsCancelButton = true
        view.searchTextField.delegate = self
        return view
    }
}

extension CitySearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.count > 0 {
            searchCity(text)
        }
        return true
    }
}

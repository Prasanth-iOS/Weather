//
//  CitySearchViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import UIKit

public final class CitySearchViewController: UISearchController {
    public var viewModel: CitySearchViewModel?

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.returnKeyType = .search
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.placeholder = "Search City"
        searchBar.showsCancelButton = true
        searchBar.searchTextField.delegate = self
    }

    func searchCity(_ text: String) {
        viewModel?.searchCity(with: text)
    }

    private func binded(_ view: UISearchBar) -> UISearchBar {
        view.returnKeyType = .search
        view.enablesReturnKeyAutomatically = true
        view.placeholder = "Search City"
        view.showsCancelButton = true
        view.searchTextField.delegate = self
        return view
    }
}

extension CitySearchViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.count > 0 {
            searchCity(text)
        }
        return true
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewModel?.onSearchCompletion?([])
        return true
    }
}

//
//  CityResultViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import UIKit

final class CityResultViewController: UITableViewController {
    private var tableModel = [CityResultViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    var selection: ((CityElement) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cityResultCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityResultCell", for: indexPath)
        cell.textLabel?.text = tableModel[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(tableModel[indexPath.row].city)
    }
}

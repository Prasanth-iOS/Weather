//
//  CityResultViewController.swift
//  Weather
//
//  Created by Prasanth on 03/05/23.
//

import UIKit

public final class CityResultViewController: UITableViewController {
    public var tableModel = [CityResultViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    var selection: ((CityElement) -> Void)?

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cityResultCell")
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityResultCell", for: indexPath)
        cell.textLabel?.text = tableModel[indexPath.row].title
        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(tableModel[indexPath.row].city)
        tableModel = []
    }
}

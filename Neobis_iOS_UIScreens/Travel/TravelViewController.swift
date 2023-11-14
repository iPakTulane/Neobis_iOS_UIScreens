//
//  TravelViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

class TravelViewController: UIViewController {
    
    // MARK: -
    let travelData = [
        TravelItem(image: "travelAbuDhabi", name: "ABU DHABI"),
        TravelItem(image: "travelSanAntonio", name: "SAN ANTONIO"),
        TravelItem(image: "travelAbuDhabi", name: "ABU DHABI"),
        TravelItem(image: "travelSanAntonio", name: "SAN ANTONIO"),
        TravelItem(image: "travelAbuDhabi", name: "ABU DHABI"),
        TravelItem(image: "travelSanAntonio", name: "SAN ANTONIO"),
        TravelItem(image: "travelAbuDhabi", name: "ABU DHABI"),
        TravelItem(image: "travelSanAntonio", name: "SAN ANTONIO"),
    ]
    
    // MARK: -
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Travel" + "\nExplore the world"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "We will help you explore, compare and book experiences - all in one place"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    private lazy var searchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.placeholder = "Choose your destination"
//        searchBar.delegate = self
//        searchBar.showsCancelButton = false
//        searchBar.isTranslucent = true
//        searchBar.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
////        searchBar.barStyle = .default
////        searchBar.searchBarStyle = .default
////        searchBar.tintColor = .blue
//////        searchBar.barTintColor = .clear
////        searchBar.backgroundColor = .clear
//        searchBar.setImage(UIImage(named: "travelSearch"), for: .search, state: .normal)
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        return searchBar
//    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Choose your destination"
        searchBar.delegate = self
        searchBar.showsCancelButton = false

        // Border customization
        searchBar.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        searchBar.layer.borderWidth = 1.0 // Adjust as needed

        // Background customization
        searchBar.barTintColor = .clear
        searchBar.backgroundColor = .clear

        // Style customization
        searchBar.barStyle = .default // or .black
        // or
        searchBar.searchBarStyle = .minimal // or .prominent

        // Set a custom search icon
        searchBar.setImage(UIImage(named: "travelSearch"), for: .search, state: .normal)

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 14, left: 0, bottom: 14, right: 0)
        tableView.separatorStyle = .none
        tableView.register(TravelTableViewCell.self, forCellReuseIdentifier: "TravelTableViewCell")
        tableView.sectionFooterHeight = 10.0
        tableView.rowHeight = 250.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    // MARK: -
    func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // subtitleLabel
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            // searchController
            searchBar.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            // tableView
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 265),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }

}

extension TravelViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        let data = travelData[indexPath.row]
        cell.configureCell(with: data)
        return cell
    }
}

extension TravelViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

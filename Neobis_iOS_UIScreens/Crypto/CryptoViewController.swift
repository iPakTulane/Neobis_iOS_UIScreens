//
//  CryptoViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

class CryptoViewController: UIViewController {
    
    let cryptoTabBarController = CryptoTabBarController()
    
    // MARK: -
    var cryptoItems = [
        CryptoItem(
            color: UIColor.red,
            icon: "cryptoBitcoinLogo",
            title: "Bitcoin",
            tendency: "+0.82 %",
            price: "$29,987.15",
            info: "2.73 BTC"),
        CryptoItem(
            color: UIColor.systemBlue,
            icon: "cryptoEthyriumLogo",
            title: "Ethyrium",
            tendency: "-0.82 %",
            price: "$29,987.15",
            info: "2.73 ETH"),
        CryptoItem(
            color: UIColor.green,
            icon: "cryptoGreenLogo",
            title: "Litecoin",
            tendency: "+0.82 %",
            price: "$29,987.15",
            info: "2.73 LTC"),
        CryptoItem(
            color: UIColor.blue,
            icon: "cryptoXrpLogo",
            title: "Ripple",
            tendency: "-0.82 %",
            price: "$29,987.15",
            info: "2.73 XRP"),
        CryptoItem(
            color: UIColor.red,
            icon: "cryptoBitcoinLogo",
            title: "Bitcoin",
            tendency: "+0.82 %",
            price: "$29,987.15",
            info: "2.73 BTC"),
        CryptoItem(
            color: UIColor.green,
            icon: "cryptoGreenLogo",
            title: "Litecoin",
            tendency: "-0.82 %",
            price: "$29,987.15",
            info: "2.73 LTC"),
        CryptoItem(
            color: UIColor.blue,
            icon: "cryptoXrpLogo",
            title: "Ripple",
            tendency: "+0.82 %",
            price: "$29,987.15",
            info: "2.73 XRP"),
        CryptoItem(
            color: UIColor.systemBlue,
            icon: "cryptoEthyriumLogo",
            title: "Ethyrium",
            tendency: "-0.82 %",
            price: "$29,987.15",
            info: "2.73 ETH"),
    ]
    
    // MARK: -
    // Level 1
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var headerIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cryptoGear")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var headerDisclosureLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOW ALL"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Level 2
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "CryptoTableViewCell")
        tableView.sectionFooterHeight = 10.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViewsHierarchy()
        setConstraints()
        setTabBarItems()
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = UIColor.black
        }
    }
    
    func setViewsHierarchy() {
        // Level 1
        view.addSubview(headerView)
        view.addSubview(tableView)
        // Level 2
        headerView.addSubview(headerTitleLabel)
        headerView.addSubview(headerIconImage)
        headerView.addSubview(headerDisclosureLabel)
    }
    
    func setConstraints() {
        
        // Level 1 - headerView
        NSLayoutConstraint.activate([
        // headerView
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            headerView.heightAnchor.constraint(equalToConstant: 90),
            
        // headerTitleLabel
            headerTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            
        // headerIconImage
            headerIconImage.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerIconImage.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerIconImage.heightAnchor.constraint(equalToConstant: 25),
            headerIconImage.widthAnchor.constraint(equalToConstant: 25),
            
        // headerDisclosureLabel
            headerDisclosureLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerDisclosureLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
        ])
        
    
        // Level 2 - tableView
        NSLayoutConstraint.activate([
        // tableView
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.heightAnchor.constraint(equalToConstant: 550),
        ])
    }
    
    func setTabBarItems() {
        addChild(cryptoTabBarController)
        view.addSubview(cryptoTabBarController.view)
        cryptoTabBarController.didMove(toParent: self)
        
        cryptoTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cryptoTabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cryptoTabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cryptoTabBarController.view.heightAnchor.constraint(equalToConstant: 100),
            cryptoTabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: -
extension CryptoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoTableViewCell", for: indexPath) as! CryptoTableViewCell
        let data = cryptoItems[indexPath.row]
        cell.configureCell(with: data)
        return cell
    }
}

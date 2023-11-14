//
//  FinanceViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

class FinanceViewController: UIViewController {
    
    let financeTabBarController = FinanceTabBarController()
    
    // MARK: -
    
    var financeItems = [
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "Jan, 2023"),
        FinanceItem(
            background: "financeCircleShopping",
            icon: "financeIconShopping",
            title: "Shopping",
            price: "$100",
            category: "Clothing",
            monthAndYear: "Feb, 2023"),
        FinanceItem(
            background: "financeCircleTransportation",
            icon: "financeIconTransportation",
            title: "Transportation",
            price: "$100",
            category: "Taxi",
            monthAndYear: "Mar, 2023"),
        FinanceItem(
            background: "financeCircleHealth",
            icon: "financeIconHealth",
            title: "Heath",
            price: "$100",
            category: "Treatment",
            monthAndYear: "Apr, 2023"),
        FinanceItem(
            background: "financeCircleFitness",
            icon: "financeIconFitness",
            title: "Fitness",
            price: "$100",
            category: "Gym",
            monthAndYear: "May, 2023"),
        FinanceItem(
            background: "financeCircleBills",
            icon: "financeIconBills",
            title: "Bills",
            price: "$100",
            category: "Utility",
            monthAndYear: "June, 2023"),
        FinanceItem(
            background: "financeCircleRestaurant",
            icon: "financeIconRestaurant",
            title: "Restaurant",
            price: "$100",
            category: "Dinner",
            monthAndYear: "July, 2023"),
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "Jan, 2023"),
        FinanceItem(
            background: "financeCircleShopping",
            icon: "financeIconShopping",
            title: "Shopping",
            price: "$100",
            category: "Clothing",
            monthAndYear: "Feb, 2023"),
        FinanceItem(
            background: "financeCircleTransportation",
            icon: "financeIconTransportation",
            title: "Transportation",
            price: "$100",
            category: "Taxi",
            monthAndYear: "Mar, 2023"),
        FinanceItem(
            background: "financeCircleHealth",
            icon: "financeIconHealth",
            title: "Heath",
            price: "$100",
            category: "Treatment",
            monthAndYear: "Apr, 2023"),
        FinanceItem(
            background: "financeCircleFitness",
            icon: "financeIconFitness",
            title: "Fitness",
            price: "$100",
            category: "Gym",
            monthAndYear: "May, 2023"),
        FinanceItem(
            background: "financeCircleBills",
            icon: "financeIconBills",
            title: "Bills",
            price: "$100",
            category: "Utility",
            monthAndYear: "June, 2023"),
        FinanceItem(
            background: "financeCircleRestaurant",
            icon: "financeIconRestaurant",
            title: "Restaurant",
            price: "$100",
            category: "Dinner",
            monthAndYear: "July, 2023"),
    ]
    
    // MARK: -
    // Level 1
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Balance"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Level 3
    
    private lazy var searchBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var arrowLeftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowLeft"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var arrowRightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowRight"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var monthAndYearLabel: UILabel = {
        let label = UILabel()
        label.text = "April, 2023"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // Level 2
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: -1, height: 1)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(FinanceTableViewCell.self, forCellReuseIdentifier: "FinanceTableViewCell")
        tableView.sectionFooterHeight = 10.0
        tableView.rowHeight = 70.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    
    // Level 3
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Show more"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    // MARK: -
    func setViewsHierarchy() {
        view.addSubview(headerView)
        view.addSubview(searchBarView)
        view.addSubview(containerView)

        // headerView
        headerView.addSubview(balanceLabel)
        headerView.addSubview(amountLabel)
        
        // searchBarView
        searchBarView.addSubview(arrowLeftButton)
        searchBarView.addSubview(arrowRightButton)
        searchBarView.addSubview(monthAndYearLabel)
        
        // containerView
        containerView.addSubview(tableView)
        containerView.addSubview(detailsLabel)
    
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            // headerView
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            headerView.heightAnchor.constraint(equalToConstant: 60),

            // balanceLabel
            balanceLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            balanceLabel.topAnchor.constraint(equalTo: headerView.topAnchor),

            // amountLabel
            amountLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            amountLabel.topAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: 25),
        ])
        
        
        NSLayoutConstraint.activate([
            // searchBarView
            searchBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            searchBarView.heightAnchor.constraint(equalToConstant: 40),

            // arrowLeftButton
            arrowLeftButton.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor),
            arrowLeftButton.leadingAnchor.constraint(equalTo: searchBarView.leadingAnchor),
            arrowLeftButton.widthAnchor.constraint(equalToConstant: 40),
            arrowLeftButton.heightAnchor.constraint(equalToConstant: 40),
            
            // arrowRightButton
            arrowRightButton.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor),
            arrowRightButton.trailingAnchor.constraint(equalTo: searchBarView.trailingAnchor),
            arrowRightButton.widthAnchor.constraint(equalToConstant: 40),
            arrowRightButton.heightAnchor.constraint(equalToConstant: 40),
            
            // monthAndYearLabel
            monthAndYearLabel.centerXAnchor.constraint(equalTo: searchBarView.centerXAnchor),
            monthAndYearLabel.centerYAnchor.constraint(equalTo: searchBarView.centerYAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            
            // containerView
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 500),
        
//            // tableView
            tableView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            tableView.heightAnchor.constraint(equalToConstant: 420),
            
//            // detailsLabel
            detailsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            detailsLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    func setTabBarItems() {
        addChild(financeTabBarController)
        view.addSubview(financeTabBarController.view)
        financeTabBarController.didMove(toParent: self)
        
        financeTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            financeTabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            financeTabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            financeTabBarController.view.heightAnchor.constraint(equalToConstant: 100),
            financeTabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: -
extension FinanceViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        financeItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinanceTableViewCell", for: indexPath) as! FinanceTableViewCell
        let data = financeItems[indexPath.row]
        cell.configureCell(with: data)
        return cell
    }
}




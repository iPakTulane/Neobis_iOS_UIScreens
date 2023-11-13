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
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "Feb, 2023"),
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "Mar, 2023"),
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "Apr, 2023"),
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "May, 2023"),
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
            monthAndYear: "June, 2023"),
        FinanceItem(
            background: "financeCircleHome",
            icon: "financeIconHome",
            title: "Home",
            price: "$100",
            category: "Products",
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
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var searchBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var arrowLeftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowLeft"), for: .normal)
        return button
    }()
    private lazy var arrowRightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowRight"), for: .normal)
        return button
    }()
    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "April, 2023"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .darkGray
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
        tableView.register(FinanceTableViewCell.self, forCellReuseIdentifier: "FinanceTableViewCell")
        tableView.sectionFooterHeight = 10.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // Level 3
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Look more"
        label.textColor = .black
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
        view.addSubview(tableView)
        view.addSubview(detailsLabel)

        // headerView
        headerView.addSubview(balanceLabel)
        headerView.addSubview(amountLabel)
        
        // searchBarView
        searchBarView.addSubview(arrowLeftButton)
        searchBarView.addSubview(arrowRightButton)
    }
    
    func setConstraints() {
        
        // headerView
        // balanceLabel
        // amountLabel
        
        // searchBarView
        // arrowLeftButton
        // arrowRightButton
        
        // tableView
        
        // detailsLabel
        
        NSLayoutConstraint.activate([
        ])
        
        NSLayoutConstraint.activate([
        ])
        
        NSLayoutConstraint.activate([
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

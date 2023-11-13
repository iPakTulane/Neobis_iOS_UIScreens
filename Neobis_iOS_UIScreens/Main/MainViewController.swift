//
//  MainViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//


import UIKit

class MainViewController: UIViewController {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "  Neobis UI Screens"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = 
                    """
                    This app combines a collection of UI screens created in code, as lined up above.
                    
                    This project focuses on building complex, custom screens in iOS without using Storyboard.
                    
                    The goal is to showcase proficiency in Swift programming and layout design using programmatic methods.
                    """
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        addNavigationButtons()
        setupLabels()
    }
    
    func setupLabels() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),

            // descriptionLabel
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 50),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func setupNavigationView() {
        
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        if let backgroundImage = UIImage(named: "nature") {
            backgroundImageView.image = backgroundImage
        }
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.backgroundColor = .systemBlue
        
        navigationController?.navigationBar.barTintColor = UIColor.blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func addNavigationButtons() {
        // Add navigation buttons to navigate to different view controllers
        let libraryButton = UIBarButtonItem(title: "Library |", style: .plain, target: self, action: #selector(showLibraryViewController))
        libraryButton.tintColor = .white
        
        let cryptoButton = UIBarButtonItem(title: "Crypto |", style: .plain, target: self, action: #selector(showCryptoViewController))
        cryptoButton.tintColor = .white
        
        let financeButton = UIBarButtonItem(title: "Finance |", style: .plain, target: self, action: #selector(showFinanceViewController))
        financeButton.tintColor = .white
        
        let travelButton = UIBarButtonItem(title: "Travel |", style: .plain, target: self, action: #selector(showTravelViewController))
        travelButton.tintColor = .white
        
        let weatherButton = UIBarButtonItem(title: "Weather", style: .plain, target: self, action: #selector(showWeatherViewController))
        weatherButton.tintColor = .white
        
        let buttonsArray = [weatherButton, travelButton, cryptoButton, financeButton, libraryButton]
        navigationItem.rightBarButtonItems = buttonsArray
    }
    
    @objc func showLibraryViewController() {
        let libraryViewController = LibraryViewController()
        navigationController?.pushViewController(libraryViewController, animated: true)
    }
    
    @objc func showCryptoViewController() {
        let cryptoViewController = CryptoViewController()
        navigationController?.pushViewController(cryptoViewController, animated: true)
    }
    
    @objc func showFinanceViewController() {
        let financeViewController = FinanceViewController()
        navigationController?.pushViewController(financeViewController, animated: true)
    }

    @objc func showTravelViewController() {
        let travelViewController = TravelViewController()
        navigationController?.pushViewController(travelViewController, animated: true)
    }

    @objc func showWeatherViewController() {
        let weatherViewController = WeatherViewController()
        navigationController?.pushViewController(weatherViewController, animated: true)
    }
    
}




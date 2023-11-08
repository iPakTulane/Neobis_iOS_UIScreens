//
//  MainViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//


import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        addNavigationButtons()
    }
    
    func setupNavigationView() {
        
        view.backgroundColor = .systemBlue
        
        navigationController?.navigationBar.barTintColor = UIColor.blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        
        
//        let navigationLabel = UILabel()
//        navigationLabel.text =
//                    """
//                    Neobis_iOS_UIScreens
//                    This app combines a collection of UI screens created in code, as lined up above.
//                    This project focuses on building complex, custom screens in iOS without using Storyboard.
//                    The goal is to showcase proficiency in Swift programming and layout design using programmatic methods.
//                    """
//        navigationLabel.numberOfLines = 0
//        navigationLabel.textAlignment = .left
//        navigationLabel.textColor = .white
//        navigationLabel.translatesAutoresizingMaskIntoConstraints = false
//        navigationLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 40)
//        view.addSubview(navigationLabel)
        
    }
    
    func addNavigationButtons() {
        // Add navigation buttons to navigate to different view controllers
        let libraryButton = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(showLibraryViewController))
        
        let cryptoButton = UIBarButtonItem(title: "Crypto", style: .plain, target: self, action: #selector(showCryptoViewController))
        
        let financeButton = UIBarButtonItem(title: "Finance", style: .plain, target: self, action: #selector(showFinanceViewController))
        
        let travelButton = UIBarButtonItem(title: "Travel", style: .plain, target: self, action: #selector(showTravelViewController))
        
        let weatherButton = UIBarButtonItem(title: "Weather", style: .plain, target: self, action: #selector(showWeatherViewController))
        
        navigationItem.rightBarButtonItems = [travelButton, weatherButton, financeButton, cryptoButton, libraryButton]
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




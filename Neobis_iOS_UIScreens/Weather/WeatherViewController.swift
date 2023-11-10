//
//  WeatherViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

class WeatherViewController: UIViewController {

    // Level 1
    var currentWeatherHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var headerLocationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherLocation")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var headerCityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tashkent"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var headerArrowDownImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherArrowDownWhite")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var headerNotificationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherRingbellWhite")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Level 2
    var currentWeatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherSun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Level 3
    var currentWeatherContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var containerDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Today, 26 April"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var containerTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var containerSummaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Sublevel 3.1
    var subContainerWindView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var windIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherWind")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var windInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind | 15 km/h"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Sublevel 3.2
    var subContainerRainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var rainIconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherRain")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var rainInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Rain | 26%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Level 4
    var detailsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly Forecast"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var detailsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherArrowUpGray")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsHierarchy()
        setupViewsConstraints()
        addAction()
//        setupGradients()
    }

    
    func setupViewsHierarchy() {
        // Level 1
        view.addSubview(currentWeatherHeaderView)
        view.addSubview(currentWeatherImage)
        view.addSubview(currentWeatherContainerView)
        view.addSubview(detailsButton)

        // Level 2
        currentWeatherHeaderView.addSubview(headerLocationImage)
        currentWeatherHeaderView.addSubview(headerCityNameLabel)
        currentWeatherHeaderView.addSubview(headerArrowDownImage)
        currentWeatherHeaderView.addSubview(headerNotificationImage)
        
        // Level 3
        currentWeatherContainerView.addSubview(containerDateLabel)
        currentWeatherContainerView.addSubview(containerTemperatureLabel)
        currentWeatherContainerView.addSubview(containerSummaryLabel)
        currentWeatherContainerView.addSubview(subContainerWindView)
        currentWeatherContainerView.addSubview(subContainerRainView)

        // Level 3.1
        subContainerWindView.addSubview(windIconImage)
        subContainerWindView.addSubview(windInfoLabel)
        
        // Level 3.2
        subContainerRainView.addSubview(rainIconImage)
        subContainerRainView.addSubview(rainInfoLabel)
        
        // Level 4
        detailsButton.addSubview(detailsLabel)
        detailsButton.addSubview(detailsImage)
    }
    
    func setupViewsConstraints() {
        NSLayoutConstraint.activate([
        
//            // Level 1
//currentWeatherHeaderView
//currentWeatherImage
//currentWeatherContainerView
//detailsButton
//
//            // Level 2
//headerLocationImage
//headerCityNameLabel
//headerArrowDownImage
//headerNotificationImage
//            
//            // Level 3
//containerDateLabel
//containerTemperatureLabel
//containerSummaryLabel
//subContainerWindView
//subContainerRainView
//
//            // Level 3.1
//windIconImage
//windInfoLabel
//            
//            // Level 3.2
//rainIconImage
//rainInfoLabel
//            
//            // Level 4
//detailsLabel
//detailsImage
        
        ])
    }
    
    func addAction() {
        
    }
    
//    func setupGradients() {
//    }
    
}

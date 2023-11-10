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
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var headerCityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tashkent"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var headerArrowDownImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherArrowDownWhite")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var headerNotificationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherRingbellWhite")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Level 2
    var currentWeatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherSun")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Level 3
    var currentWeatherContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var containerDateLabel: UILabel = {
        let label = UILabel()
        label.text = "    Today, 26 April"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var containerTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "  22°"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var containerSummaryLabel: UILabel = {
        let label = UILabel()
        label.text = "  Sunny"
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.textColor = .white
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
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var windInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "   Wind | 15 km/h"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
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
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var rainInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Rain | 26%"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Level 4
    var detailsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: -3, height: 5)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly forecast"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var detailsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherArrowUpGray")
        image.tintColor = .systemGray
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: -
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    private lazy var containerViewGradient = CAGradientLayer()
        
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupViewsHierarchy()
        setupViewsConstraints()
        addAction()
        setupGradients()
    }

    
    func setupViewsHierarchy() {
        // Root level
        view.addSubview(currentWeatherHeaderView)
        view.addSubview(currentWeatherImage)
        view.addSubview(currentWeatherContainerView)
        view.addSubview(detailsButton)

        // currentWeatherHeaderView
        currentWeatherHeaderView.addSubview(headerLocationImage)
        currentWeatherHeaderView.addSubview(headerCityNameLabel)
        currentWeatherHeaderView.addSubview(headerArrowDownImage)
        currentWeatherHeaderView.addSubview(headerNotificationImage)
        
        // currentWeatherContainerView
        currentWeatherContainerView.addSubview(containerDateLabel)
        currentWeatherContainerView.addSubview(containerTemperatureLabel)
        currentWeatherContainerView.addSubview(containerSummaryLabel)
        currentWeatherContainerView.addSubview(subContainerWindView)
        currentWeatherContainerView.addSubview(subContainerRainView)

        // subContainerWindView
        subContainerWindView.addSubview(windIconImage)
        subContainerWindView.addSubview(windInfoLabel)
        
        // subContainerRainView
        subContainerRainView.addSubview(rainIconImage)
        subContainerRainView.addSubview(rainInfoLabel)
        
        // detailsButton
        detailsButton.addSubview(detailsLabel)
        detailsButton.addSubview(detailsImage)
    }
    
    func setupViewsConstraints() {

        // MARK: - currentWeatherHeaderView
        NSLayoutConstraint.activate([
            // currentWeatherHeaderView
            currentWeatherHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            currentWeatherHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentWeatherHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            currentWeatherHeaderView.heightAnchor.constraint(equalToConstant: 75),
            
            // headerLocationImage
            headerLocationImage.centerYAnchor.constraint(equalTo: currentWeatherHeaderView.centerYAnchor),
            headerLocationImage.leadingAnchor.constraint(equalTo: currentWeatherHeaderView.leadingAnchor),
            
            // headerCityNameLabel
            headerCityNameLabel.centerYAnchor.constraint(equalTo: currentWeatherHeaderView.centerYAnchor),
            headerCityNameLabel.leadingAnchor.constraint(equalTo: headerLocationImage.trailingAnchor, constant: 20),
            
            // headerArrowDownImage
            headerArrowDownImage.centerYAnchor.constraint(equalTo: currentWeatherHeaderView.centerYAnchor),
            headerArrowDownImage.leadingAnchor.constraint(equalTo: headerCityNameLabel.trailingAnchor, constant: 20),
            
            // headerNotificationImage
            headerNotificationImage.centerYAnchor.constraint(equalTo: currentWeatherHeaderView.centerYAnchor),
            headerNotificationImage.trailingAnchor.constraint(equalTo: currentWeatherHeaderView.trailingAnchor),
        ])
            
        // MARK: - currentWeatherImage
        NSLayoutConstraint.activate([
            // currentWeatherImage
            currentWeatherImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            currentWeatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentWeatherImage.widthAnchor.constraint(equalToConstant: 250),
            currentWeatherImage.heightAnchor.constraint(equalToConstant: 250),
        ])

        // MARK: - currentWeatherContainerView
        NSLayoutConstraint.activate([
            // currentWeatherContainerView
            currentWeatherContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentWeatherContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            currentWeatherContainerView.widthAnchor.constraint(equalToConstant: 350),
            currentWeatherContainerView.heightAnchor.constraint(equalToConstant: 350),

            //containerDateLabel
            containerDateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerDateLabel.topAnchor.constraint(equalTo: currentWeatherContainerView.topAnchor, constant: 30),
            containerDateLabel.widthAnchor.constraint(equalToConstant: 170),
            containerDateLabel.heightAnchor.constraint(equalToConstant: 25),
            
            //containerTemperatureLabel
            containerTemperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerTemperatureLabel.topAnchor.constraint(equalTo: containerDateLabel.bottomAnchor, constant: -20),
            containerTemperatureLabel.widthAnchor.constraint(equalToConstant: 150),
            containerTemperatureLabel.heightAnchor.constraint(equalToConstant: 150),
            
            //containerSummaryLabel
            containerSummaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerSummaryLabel.topAnchor.constraint(equalTo: containerTemperatureLabel.bottomAnchor, constant: -25),
            containerSummaryLabel.widthAnchor.constraint(equalToConstant: 120),
            containerSummaryLabel.heightAnchor.constraint(equalToConstant: 35),
        ])

        // MARK: - subContainerRainView
        NSLayoutConstraint.activate([
            //subContainerRainView
            subContainerRainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subContainerRainView.bottomAnchor.constraint(equalTo: currentWeatherContainerView.bottomAnchor, constant: -40),
            subContainerRainView.widthAnchor.constraint(equalToConstant: 200),
            subContainerRainView.heightAnchor.constraint(equalToConstant: 30),

            //rainIconImage
            rainIconImage.centerYAnchor.constraint(equalTo: subContainerRainView.centerYAnchor),
            rainIconImage.leadingAnchor.constraint(equalTo: subContainerRainView.leadingAnchor),
            
            //rainInfoLabel
            rainInfoLabel.centerYAnchor.constraint(equalTo: subContainerRainView.centerYAnchor),
            rainInfoLabel.centerXAnchor.constraint(equalTo: subContainerRainView.centerXAnchor),
        ])
        
            // MARK: - subContainerWindView
        NSLayoutConstraint.activate([
            //subContainerWindView
            subContainerWindView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subContainerWindView.bottomAnchor.constraint(equalTo: subContainerRainView.topAnchor, constant: -15),
            subContainerWindView.widthAnchor.constraint(equalToConstant: 200),
            subContainerWindView.heightAnchor.constraint(equalToConstant: 30),
            
            //windIconImage
            windIconImage.centerYAnchor.constraint(equalTo: subContainerWindView.centerYAnchor),
            windIconImage.leadingAnchor.constraint(equalTo: subContainerWindView.leadingAnchor),
            
            //windInfoLabel
            windInfoLabel.centerYAnchor.constraint(equalTo: subContainerWindView.centerYAnchor),
            windInfoLabel.centerXAnchor.constraint(equalTo: subContainerWindView.centerXAnchor),
        ])
            

            // MARK: - detailsButton
        NSLayoutConstraint.activate([
            //detailsButton
            detailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            detailsButton.widthAnchor.constraint(equalToConstant: 250),
            detailsButton.heightAnchor.constraint(equalToConstant: 50),
            
            //detailsLabel
            detailsLabel.centerYAnchor.constraint(equalTo: detailsButton.centerYAnchor),
            detailsLabel.centerXAnchor.constraint(equalTo: detailsButton.centerXAnchor),
            
            //detailsImage
            detailsImage.centerYAnchor.constraint(equalTo: detailsButton.centerYAnchor),
            detailsImage.trailingAnchor.constraint(equalTo: detailsButton.trailingAnchor, constant: -20),
        ])
    }
    
    func addAction() {
        
    }
    
//    func setupGradients() {
//        containerViewGradient.frame = currentWeatherContainerView.bounds
//        containerViewGradient.colors = [UIColor(hex: "#FFFFFFB2", alpha: 0.7), UIColor(hex: "#BFBFBFB2", alpha: 0.7)]
//        containerViewGradient.startPoint = CGPoint(x: 0.5, y: 0.5)
//        view.layer.insertSublayer(gradientLayer, at: 0)
//    }
//    
//    func setupGradients() {
//        containerViewGradient.frame = currentWeatherContainerView.bounds
//        let startColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
//        let endColor = UIColor(red: 191/255, green: 191/255, blue: 191/255, alpha: 0.7)
//        containerViewGradient.colors = [startColor.cgColor, endColor.cgColor]
//        containerViewGradient.startPoint = CGPoint(x: 0.5, y: 0.5)
//        view.layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    private func setupGradients() {
        gradientLayer.frame = view.bounds
        let startColor1 = UIColor(red: 0 / 255, green: 190 / 255, blue: 229 / 255, alpha: 1)
        let endColor1 = UIColor(red: 23 / 255, green: 154 / 255, blue: 250 / 255, alpha: 1)
        gradientLayer.colors = [startColor1.cgColor, endColor1.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)

        containerViewGradient.frame = currentWeatherContainerView.bounds
        let startColor2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.7)
        let endColor2 = UIColor(red: 191 / 255, green: 191 / 255, blue: 191 / 255, alpha: 0.7)
        containerViewGradient.colors = [startColor2.cgColor, endColor2.cgColor]
        containerViewGradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        view.layer.insertSublayer(containerViewGradient, at: 0)
    }

    
}

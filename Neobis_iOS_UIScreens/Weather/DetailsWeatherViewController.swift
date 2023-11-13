//
//  DetailsWeatherViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 10/11/23.
//

import UIKit

class DetailsWeatherViewController: UIViewController {
    
    // MARK: -
    var hourlyWeather = [
        HourlyWeatherItem(temperature: "21°C", image: "weatherRainy", time: "15:00", isSelected: false),
        HourlyWeatherItem(temperature: "21°C", image: "weatherCloudy", time: "16:00", isSelected: false),
        HourlyWeatherItem(temperature: "22°C", image: "weatherSunny", time: "17:00", isSelected: true),
        HourlyWeatherItem(temperature: "21°C", image: "weatherMoon", time: "18:00", isSelected: false),
        HourlyWeatherItem(temperature: "21°C", image: "weatherRainy", time: "19:00", isSelected: false),
        HourlyWeatherItem(temperature: "21°C", image: "weatherMoreCloudy", time: "20:00", isSelected: false),
        HourlyWeatherItem(temperature: "21°C", image: "weatherRainy", time: "21:00", isSelected: false),
        HourlyWeatherItem(temperature: "21°C", image: "weatherCloudSunny", time: "22:00", isSelected: false),
    ]
    
    var weeklyWeather = [
        WeeklyWeatherItem(date: "Apr, 27", image: "weatherMoon", temperature: "21°C"),
        WeeklyWeatherItem(date: "Apr, 28", image: "weatherCloudSunny", temperature: "21°C"),
        WeeklyWeatherItem(date: "Apr, 29", image: "weatherRainy", temperature: "21°C"),
        WeeklyWeatherItem(date: "Apr, 30", image: "weatherMoon", temperature: "21°C"),
        WeeklyWeatherItem(date: "Apr, 31", image: "weatherCloudy", temperature: "21°C"),
        WeeklyWeatherItem(date: "May, 01", image: "weatherMoreCloudy", temperature: "21°C"),
        WeeklyWeatherItem(date: "May, 02", image: "weatherMoon", temperature: "21°C"),
        WeeklyWeatherItem(date: "May, 03", image: "weatherRainy", temperature: "21°C"),
    ]

    // MARK: -
    // Level 1
    private lazy var detailsWeatherHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//    private lazy var headerBackButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .clear
//        button.setTitle("Back", for: .normal)
//        button.setImage(UIImage(named: "weatherArrowLeftWhite"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    private lazy var headerGearImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherGearWhite")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Level 2
    private lazy var dateContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var monthAndDayLabel: UILabel = {
        let label = UILabel()
        label.text = "April, 26"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Level 3
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width * 70 / 414.0), height: 155)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "HourlyWeatherCollectionViewCell")
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // Level 4
    private lazy var weeklyContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var weeklyLabel: UILabel = {
        let label = UILabel()
        label.text = "Coming week"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var calendarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherCalendar")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // Level 5
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundColor = .clear
        tableView.register(WeeklyWeatherTableViewCell.self, forCellReuseIdentifier: "WeeklyWeatherTableViewCell")
        tableView.alwaysBounceVertical = true
        tableView.flashScrollIndicators()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // Level 6
    private lazy var footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var footerLogoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weatherSunLogo")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var footerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "AccuWeather"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: -
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupViewsHierarchy()
        setupViewsConstraints()
//        addActionToBackButton()
        setupGradients()
    }
    
    func setupViewsHierarchy() {
        
        // Root level
        view.addSubview(detailsWeatherHeaderView)
        view.addSubview(dateContainerView)
        view.addSubview(collectionView)
        view.addSubview(weeklyContainerView)
        view.addSubview(tableView)
        view.addSubview(footerView)
        
        // Level 1 - detailsWeatherHeaderView
//        detailsWeatherHeaderView.addSubview(headerBackButton)
        detailsWeatherHeaderView.addSubview(headerGearImage)
        
        // Level 2 - dateContainerView
        dateContainerView.addSubview(todayLabel)
        dateContainerView.addSubview(monthAndDayLabel)
        
        // Level 3 - weeklyContainerView
        weeklyContainerView.addSubview(weeklyLabel)
        weeklyContainerView.addSubview(calendarImage)
        
        // Level 4 - footerView
        footerView.addSubview(footerLogoImage)
        footerView.addSubview(footerTitleLabel)
        
    }
    
    func setupViewsConstraints() {
        
        // Level 1 - detailsWeatherHeaderView
        
        NSLayoutConstraint.activate([
            // detailsWeatherHeaderView
            detailsWeatherHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsWeatherHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            detailsWeatherHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsWeatherHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
//            // headerBackButton
//            headerBackButton.centerYAnchor.constraint(equalTo: detailsWeatherHeaderView.centerYAnchor),
//            headerBackButton.leadingAnchor.constraint(equalTo: detailsWeatherHeaderView.leadingAnchor),
            
            // headerGearImage
            headerGearImage.centerYAnchor.constraint(equalTo: detailsWeatherHeaderView.centerYAnchor),
            headerGearImage.trailingAnchor.constraint(equalTo: detailsWeatherHeaderView.trailingAnchor),
        ])
        
        // Level 2 - dateContainerView
        NSLayoutConstraint.activate([
            // dateContainerView
            dateContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            dateContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // todayLabel
            todayLabel.centerYAnchor.constraint(equalTo: dateContainerView.centerYAnchor),
            todayLabel.leadingAnchor.constraint(equalTo: dateContainerView.leadingAnchor),
            
            // monthAndDayLabel
            monthAndDayLabel.centerYAnchor.constraint(equalTo: dateContainerView.centerYAnchor),
            monthAndDayLabel.trailingAnchor.constraint(equalTo: dateContainerView.trailingAnchor),
        ])
        
        // Level 3 - collectionView
        NSLayoutConstraint.activate([
            // collectionView
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 155),
        ])
        
        // Level 4 - weeklyContainerView
        NSLayoutConstraint.activate([
            // weeklyContainerView
            weeklyContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weeklyContainerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 415),
            weeklyContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weeklyContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // weeklyLabel
            weeklyLabel.centerYAnchor.constraint(equalTo: weeklyContainerView.centerYAnchor),
            weeklyLabel.leadingAnchor.constraint(equalTo: weeklyContainerView.leadingAnchor),
            
            // calendarImage
            calendarImage.centerYAnchor.constraint(equalTo: weeklyContainerView.centerYAnchor),
            calendarImage.trailingAnchor.constraint(equalTo: weeklyContainerView.trailingAnchor),
        ])

        // Level 5 - tableView
        NSLayoutConstraint.activate([
            // tableView
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 480),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 270),
        ])

        // Level 6 - footerView
        NSLayoutConstraint.activate([
            // footerView
            footerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            footerView.widthAnchor.constraint(equalToConstant: 150),

            
            // footerLogoImage
            footerLogoImage.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            footerLogoImage.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            
            // footerTitleLabel
            footerTitleLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
            footerTitleLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
        ])
    }
    
//    func addActionToBackButton() {
//        headerBackButton.addTarget(self, action: #selector(BackButtonPressed), for: .touchUpInside)
//    }
    
    @objc func BackButtonPressed() {
        dismiss(animated: true)
    }
    
    func setupGradients() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0 / 255, green: 190 / 255, blue: 229 / 255, alpha: 1).cgColor, UIColor(red: 23 / 255, green: 154 / 255, blue: 250 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


// MARK: - Collection view methods

extension DetailsWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyWeatherCollectionViewCell", for: indexPath) as! HourlyWeatherCollectionViewCell
        let data = hourlyWeather[indexPath.item]
        cell.configureCollectionCell(with: data)
        return cell
    }
}

// MARK: - Table view methods

extension DetailsWeatherViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weeklyWeather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyWeatherTableViewCell", for: indexPath) as! WeeklyWeatherTableViewCell
        let data = weeklyWeather[indexPath.row]
        cell.configureTableCell(with: data)
        return cell
    }
    
}

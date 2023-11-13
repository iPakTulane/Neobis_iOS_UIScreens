//
//  HourlyWeatherCollectionViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 10/11/23.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: -
    private lazy var hourlyContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var hourlyTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var hourlyWeatherImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellViewsHierarchy()
        setCellViewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    func setCellViewsHierarchy() {
        // Level 1
        contentView.addSubview(hourlyContainerView)
        hourlyContainerView.addSubview(hourlyTemperatureLabel)
        hourlyContainerView.addSubview(hourlyWeatherImage)
        hourlyContainerView.addSubview(hourLabel)
    }
    
    // MARK: -
    func setCellViewsConstraints() {

        NSLayoutConstraint.activate([
            // hourlyContainerView
            hourlyContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            hourlyContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hourlyContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hourlyContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // hourlyTemperatureLabel
            hourlyTemperatureLabel.centerXAnchor.constraint(equalTo: hourlyContainerView.centerXAnchor),
            hourlyTemperatureLabel.topAnchor.constraint(equalTo: hourlyContainerView.topAnchor, constant: 13),
            
            // hourlyWeatherImage
            hourlyWeatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hourlyWeatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            hourlyWeatherImage.widthAnchor.constraint(equalToConstant: 100),
            hourlyWeatherImage.heightAnchor.constraint(equalToConstant: 100),
            
            // hourLabel
            hourLabel.centerXAnchor.constraint(equalTo: hourlyContainerView.centerXAnchor),
            hourLabel.bottomAnchor.constraint(equalTo: hourlyContainerView.bottomAnchor, constant: -13),
        ])
    }
    
    // MARK: -
    func configureCollectionCell(with data: HourlyWeatherItem) {
        hourlyTemperatureLabel.text = data.temperature
        hourlyWeatherImage.image = UIImage(named: data.image)
        hourLabel.text = data.time
        
        if data.isSelected {
            hourlyContainerView.backgroundColor = UIColor(
                red: 255.0 / 255.0,
                green: 255.0 / 255.0,
                blue: 255.0 / 255.0,
                alpha: 0.3
            )
            hourlyContainerView.layer.borderColor = UIColor.white.cgColor
            hourlyContainerView.layer.borderWidth = 1
            hourlyContainerView.layer.cornerRadius = 20
        }
    }
    
}

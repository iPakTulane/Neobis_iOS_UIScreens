//
//  WeeklyWeatherTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 10/11/23.
//

import UIKit

class WeeklyWeatherTableViewCell: UITableViewCell {

    // MARK: -
    private lazy var weeklyContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var weeklyWeatherImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setWeeklyContainerView()
        setCellViewsHierarchy()
        setCellViewsConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: -
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: -
    
    func setWeeklyContainerView() {
        layer.backgroundColor = UIColor.clear.cgColor
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    func setCellViewsHierarchy() {
        // Level 1
        contentView.addSubview(weeklyContainerView)
        weeklyContainerView.addSubview(dateLabel)
        weeklyContainerView.addSubview(weeklyWeatherImage)
        weeklyContainerView.addSubview(temperatureLabel)
    }
    
    func setCellViewsConstraints() {
        
        NSLayoutConstraint.activate([
            // weeklyContainerView
            weeklyContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            weeklyContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            weeklyContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weeklyContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // dateLabel
            dateLabel.centerYAnchor.constraint(equalTo: weeklyContainerView.centerYAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: weeklyContainerView.leadingAnchor, constant: 20),
            
            // weeklyWeatherImage
            weeklyWeatherImage.centerXAnchor.constraint(equalTo: weeklyContainerView.centerXAnchor),
            weeklyWeatherImage.centerYAnchor.constraint(equalTo: weeklyContainerView.centerYAnchor),
            weeklyWeatherImage.widthAnchor.constraint(equalToConstant: 100),
            weeklyWeatherImage.heightAnchor.constraint(equalToConstant: 100),
            
            // temperatureLabel
            temperatureLabel.centerYAnchor.constraint(equalTo: weeklyContainerView.centerYAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: weeklyContainerView.trailingAnchor, constant: -20),
        ])
        
    }
    
    // MARK: -
    func configureTableCell(with data: WeeklyWeatherItem) {
        dateLabel.text = data.date
        weeklyWeatherImage.image = UIImage(named: data.image)
        temperatureLabel.text = data.temperature
    }
    
}

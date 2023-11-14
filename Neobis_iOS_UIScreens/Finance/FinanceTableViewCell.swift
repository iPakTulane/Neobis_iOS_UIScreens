//
//  FinanceTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 13/11/23.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {

        // MARK: -
        private lazy var backgroundIconImage: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
            }()
        private lazy var iconImage: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        private lazy var labelsView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 20.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private lazy var priceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private lazy var categoryLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .lightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        // MARK: -
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            setCellViewsHierarchy()
            setCellViewsConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        // MARK: -
        func setCellViewsHierarchy() {
            
            contentView.addSubview(backgroundIconImage)
            contentView.addSubview(labelsView)
            
            backgroundIconImage.addSubview(iconImage)
            
            labelsView.addSubview(titleLabel)
            labelsView.addSubview(priceLabel)
            labelsView.addSubview(categoryLabel)

        }
        
        func setCellViewsConstraints() {
            
            NSLayoutConstraint.activate([
            // backgroundIconImage
                backgroundIconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                backgroundIconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                backgroundIconImage.widthAnchor.constraint(equalToConstant: 30),
                backgroundIconImage.heightAnchor.constraint(equalToConstant: 30),
                
            // iconImage
                iconImage.centerXAnchor.constraint(equalTo: backgroundIconImage.centerXAnchor),
                iconImage.centerYAnchor.constraint(equalTo: backgroundIconImage.centerYAnchor),
            ])
            
            NSLayoutConstraint.activate([
            // labelsView
                labelsView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                labelsView.leadingAnchor.constraint(equalTo: backgroundIconImage.trailingAnchor, constant: 20),
                labelsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                labelsView.heightAnchor.constraint(equalToConstant: 50),
                
            // titleLabel
                titleLabel.centerYAnchor.constraint(equalTo: labelsView.centerYAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
                
            // priceLabel
                priceLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 5),
                priceLabel.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor),
                
            // categoryLabel
                categoryLabel.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -5),
                categoryLabel.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor),
            ])
        }
        
        
        // MARK: -
        func configureCell(with data: FinanceItem) {
            backgroundIconImage.image = UIImage(named: data.background)
            iconImage.image = UIImage(named: data.icon)
            titleLabel.text = data.title
            priceLabel.text = data.price
            categoryLabel.text = data.category
        }
        
    }

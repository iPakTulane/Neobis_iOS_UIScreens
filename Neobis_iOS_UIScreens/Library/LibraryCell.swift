//
//  LibraryCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

class LibraryCell: UICollectionViewCell {
    
    // MARK: - Views
    private lazy var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cellLogoImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cellArrowImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "libraryArrow")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellBorders()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Setup and configure views
    
    func setupCellBorders() {
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.2
    }
    
    func addSubviews() {
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(cellDescriptionLabel)
        contentView.addSubview(cellLogoImage)
        contentView.addSubview(cellArrowImage)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            cellArrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellArrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            
            cellLogoImage.heightAnchor.constraint(equalToConstant: 100),
            cellLogoImage.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
        
    func configure(with data: LibraryItem) {
        cellTitleLabel.text = data.title
        cellDescriptionLabel.text = data.description
        cellLogoImage.image = UIImage(named: data.image)
        
        if data.isOdd {
            NSLayoutConstraint.activate([
                cellTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
                cellTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                
                cellDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
                cellDescriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 3),
                cellDescriptionLabel.trailingAnchor.constraint(equalTo: cellLogoImage.leadingAnchor, constant: -24),
                
                cellLogoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellLogoImage.trailingAnchor.constraint(equalTo: cellArrowImage.leadingAnchor, constant: -9)
            ])
        } else {
            NSLayoutConstraint.activate([
                cellLogoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                cellLogoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
                
                cellTitleLabel.leadingAnchor.constraint(equalTo: cellLogoImage.trailingAnchor, constant: 35),
                cellTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
                
                cellDescriptionLabel.leadingAnchor.constraint(equalTo: cellLogoImage.trailingAnchor, constant: 35),
                cellDescriptionLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 3),
                cellDescriptionLabel.trailingAnchor.constraint(equalTo: cellArrowImage.leadingAnchor, constant: -17),
            ])
        }
    }
}

//
//  TravelTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 14/11/23.
//

import UIKit
import CoreGraphics

class TravelTableViewCell: UITableViewCell {
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var lineImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vector")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var gradientImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gradient")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
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
    func configureCell(with data: TravelItem) {
        backgroundImage.image = UIImage(named: data.image)
        nameLabel.text = data.name
    }
    
    // MARK: -
    func setupViews() {
        contentView.addSubview(backgroundImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(lineImage)
        backgroundImage.addSubview(gradientImage)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([

            // backgroundImage
            backgroundImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
//            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // gradientImage
            gradientImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            gradientImage.topAnchor.constraint(equalTo: backgroundImage.topAnchor),
            gradientImage.widthAnchor.constraint(equalTo: backgroundImage.widthAnchor),
            
            // nameLabel
            nameLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 25),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
//            nameLabel.widthAnchor.constraint(equalToConstant: 175),

            // lineImage
            lineImage.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            lineImage.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 50),
            lineImage.widthAnchor.constraint(equalToConstant: 220),
            
        ])
    }
    
}

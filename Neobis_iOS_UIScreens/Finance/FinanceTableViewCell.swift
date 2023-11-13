//
//  FinanceTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 13/11/23.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {

        // MARK: -
        private lazy var cellContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
    //        view.tintColor = .separator
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        private lazy var subcontainerLogoBackgroundView: UIView = {
            let view = UIView()
    //        view.alpha = 0.5
            view.backgroundColor = .red
            view.layer.cornerRadius = 20
            view.backgroundColor = .clear
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        private lazy var subcontainerLogoImage: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        private lazy var subcontainerDetailLabelsView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        private lazy var subcontainerTitleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 20.0)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private lazy var subcontainerSubtitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .lightGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private lazy var subcontainerPriceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        private lazy var subcontainerInfoLabel: UILabel = {
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
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        // MARK: -
        func setCellViewsHierarchy() {
            
            contentView.addSubview(cellContainerView)
            
            cellContainerView.addSubview(subcontainerLogoBackgroundView)
            cellContainerView.addSubview(subcontainerDetailLabelsView)
            
            subcontainerLogoBackgroundView.addSubview(subcontainerLogoImage)
            
            subcontainerDetailLabelsView.addSubview(subcontainerTitleLabel)
            subcontainerDetailLabelsView.addSubview(subcontainerSubtitleLabel)
            subcontainerDetailLabelsView.addSubview(subcontainerPriceLabel)
            subcontainerDetailLabelsView.addSubview(subcontainerInfoLabel)
        }
        
        func setCellViewsConstraints() {
            
            // Level 1 - cellContainerView
            NSLayoutConstraint.activate([
            // cellContainerView
                cellContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                cellContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                cellContainerView.heightAnchor.constraint(equalToConstant: 70),
                cellContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                cellContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            ])
            
            // Sublevel 1.1 -
            NSLayoutConstraint.activate([
                
            // subcontainerLogoBackgroundView
                subcontainerLogoBackgroundView.centerYAnchor.constraint(equalTo: cellContainerView.centerYAnchor),
                subcontainerLogoBackgroundView.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor),
    //            subcontainerLogoBackgroundView.widthAnchor.constraint(equalToConstant: 30),
    //            subcontainerLogoBackgroundView.heightAnchor.constraint(equalToConstant: 30),
                
            // subcontainerLogoImage
                subcontainerLogoImage.centerXAnchor.constraint(equalTo: subcontainerLogoBackgroundView.centerXAnchor),
                subcontainerLogoImage.centerYAnchor.constraint(equalTo: subcontainerLogoBackgroundView.centerYAnchor),
                subcontainerLogoImage.widthAnchor.constraint(equalToConstant: 20),
                subcontainerLogoImage.heightAnchor.constraint(equalToConstant: 20),
            ])
            
            // Sublevel 1.2 -
            NSLayoutConstraint.activate([
                
            // subcontainerDetailLabelsView
                subcontainerDetailLabelsView.centerYAnchor.constraint(equalTo: cellContainerView.centerYAnchor),
                subcontainerDetailLabelsView.leadingAnchor.constraint(equalTo: subcontainerLogoImage.trailingAnchor, constant: 30),
                subcontainerDetailLabelsView.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor),
                subcontainerDetailLabelsView.heightAnchor.constraint(equalToConstant: 80),
                
                // subcontainerTitleLabel
                subcontainerTitleLabel.topAnchor.constraint(equalTo: subcontainerDetailLabelsView.topAnchor, constant: 20),
                subcontainerTitleLabel.leadingAnchor.constraint(equalTo: subcontainerDetailLabelsView.leadingAnchor),
                
                // subcontainerSubtitleLabel
                subcontainerSubtitleLabel.leadingAnchor.constraint(equalTo: subcontainerDetailLabelsView.leadingAnchor),
                subcontainerSubtitleLabel.bottomAnchor.constraint(equalTo: subcontainerDetailLabelsView.bottomAnchor, constant: -20),
                
                // subcontainerPriceLabel
                subcontainerPriceLabel.topAnchor.constraint(equalTo: subcontainerDetailLabelsView.topAnchor, constant: 20),
                subcontainerPriceLabel.trailingAnchor.constraint(equalTo: subcontainerDetailLabelsView.trailingAnchor),
                
                // subcontainerInfoLabel
                subcontainerInfoLabel.trailingAnchor.constraint(equalTo: subcontainerDetailLabelsView.trailingAnchor),
                subcontainerInfoLabel.bottomAnchor.constraint(equalTo: subcontainerDetailLabelsView.bottomAnchor, constant: -20),
            ])

        }
        
        
        // MARK: -
        func configureCell(with data: CryptoItem) {
            subcontainerLogoBackgroundView.backgroundColor = data.color
            subcontainerLogoImage.image = UIImage(named: data.icon)
            subcontainerTitleLabel.text = data.title
            subcontainerSubtitleLabel.text = data.tendency
            subcontainerPriceLabel.text = data.price
            subcontainerInfoLabel.text = data.info
        }
        
    }

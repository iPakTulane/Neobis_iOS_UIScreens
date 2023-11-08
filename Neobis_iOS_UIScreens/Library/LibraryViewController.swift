//
//  LibraryViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

//class LibraryViewController: UITabBarController {

class LibraryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "Library"
        
        // Create the header view
        let headerView = createHeaderView()
        view.addSubview(headerView)
        
        // Add the collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LibraryCollectionViewCell.self, forCellWithReuseIdentifier: "LibraryCollectionViewCell")
        view.addSubview(collectionView)
        
        // Create the tab bars at the bottom
        let tabBar1 = createTabBar(imageName: "tab1")
        let tabBar2 = createTabBar(imageName: "tab2")
        let tabBar3 = createTabBar(imageName: "tab3")
        let tabBarStackView = UIStackView(arrangedSubviews: [tabBar1, tabBar2, tabBar3])
        tabBarStackView.axis = .horizontal
        tabBarStackView.distribution = .fillEqually
        tabBarStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarStackView)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: tabBarStackView.topAnchor),
            
            tabBarStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabBarStackView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // Create the header view
    private func createHeaderView() -> UIView {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Left button with image
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "Outline"), for: .normal)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.text = "Library"
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Right button with image
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named: "Magnifier"), for: .normal)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Stack view for buttons and title
        let buttonStackView = UIStackView(arrangedSubviews: [leftButton, titleLabel, rightButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillProportionally
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(buttonStackView)
        
        // Layout constraints for buttons and title
        NSLayoutConstraint.activate([
            leftButton.widthAnchor.constraint(equalToConstant: 30),
            rightButton.widthAnchor.constraint(equalToConstant: 30),
            buttonStackView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
        ])
        
        return headerView
    }
    
    // Create tab bars at the bottom
    private func createTabBar(imageName: String) -> UIImageView {
        let tabBar = UIImageView()
        tabBar.image = UIImage(named: imageName)
        tabBar.contentMode = .scaleAspectFit
        return tabBar
    }
    
    // Collection view data source methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 // Number of items in the collection view
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // Customize the cell's appearance and content here
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the size of collection view cells here
        return CGSize(width: view.frame.width - 20, height: 100)
    }
}



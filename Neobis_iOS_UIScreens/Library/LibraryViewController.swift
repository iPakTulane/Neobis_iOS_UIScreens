//
//  LibraryViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//


import UIKit

class LibraryViewController: UIViewController {
    
    let libraryTabBarController = LibraryTabBarController()
    
    let categories: [LibraryItem] = [
        LibraryItem(
            title: "Magazines",
            description: "Explore the latest issues and trends in various magazines.",
            image: "libraryBook",
            isOdd: true),
        LibraryItem(
            title: "Mathematics",
            description: "Dive into the world of numbers, equations, and mathematical concepts.",
            image: "libraryBookshelf",
            isOdd: false),
        LibraryItem(
            title: "Manga",
            description: "Immerse yourself in captivating manga stories and art.",
            image: "libraryDiploma",
            isOdd: true),
        LibraryItem(
            title: "Geography",
            description: "Discover the wonders of the world and explore different landscapes.",
            image: "libraryGlobus",
            isOdd: false),
    ]
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Library"
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var outlineImage: UIImageView = {
//        let image = UIImageView(image: UIImage(named: "libraryOutline"))
//        image.tintColor = .black
//        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
    private lazy var searchImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "libraryMagnifier"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var libraryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(LibraryCell.self, forCellWithReuseIdentifier: "LibraryCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
        setTabBarItems()
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = UIColor.black
        }
    }
    
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(searchImage)
//        view.addSubview(outlineImage)
        view.addSubview(libraryCollectionView)
    }
    
    func setTabBarItems() {
        // Add the view of LibraryTabBarController as a subview
        addChild(libraryTabBarController)
        view.addSubview(libraryTabBarController.view)
        libraryTabBarController.didMove(toParent: self)
        
        // Set the frame or constraints for the libraryTabBarController.view
        libraryTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            libraryTabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            libraryTabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            libraryTabBarController.view.heightAnchor.constraint(equalToConstant: 100),
            libraryTabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: -
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            
//            outlineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
//            outlineImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
//            outlineImage.heightAnchor.constraint(equalToConstant: 24),
//            outlineImage.widthAnchor.constraint(equalToConstant: 24),
            
            searchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            searchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            searchImage.heightAnchor.constraint(equalToConstant: 24),
            searchImage.widthAnchor.constraint(equalToConstant: 24),
            
            libraryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            libraryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            libraryCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            libraryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Extension

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCell", for: indexPath) as? LibraryCell else {
            fatalError("Unable to dequeue a library cell")
        }
                
        let data = categories[indexPath.row]
        cell.configure(with: data)
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 174)
    }
}




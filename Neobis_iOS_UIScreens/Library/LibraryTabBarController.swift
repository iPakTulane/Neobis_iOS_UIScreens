//
//  LibraryTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 09/11/23.
//

import UIKit

class LibraryTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarAppearance()
        setupTabBarItems()
        self.delegate = self
    }
    
    func configureTabBarAppearance() {
        tabBar.tintColor = .black
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 0.4
        tabBar.backgroundColor = .white
    }
    
    func setupTabBarItems() {
        setViewControllers([
            createVC(
                title: "Series",
                image: UIImage(named: "librarySeries"),
                vc: SeriesVC(),
                tag: 0),
            createVC(
                title: "Headspace",
                image: UIImage(named: "libraryHeadphone"),
                vc: HeadspaceVC(),
                tag: 1),
            createVC(
                title: "Profile",
                image: UIImage(named: "libraryPerson"),
                vc: ProfileVC(),
                tag: 2)
        ], animated: true)
    }
    
    private func createVC(title: String, image: UIImage?, vc: UIViewController, tag: Int) -> UIViewController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.tabBarItem.tag = tag
        return nav
    }
}


// MARK: - UITabBarControllerDelegate
extension LibraryTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            switch index {
            case 0:
                print("Series tab tapped")
            case 1:
                print("Headspace tab tapped")
            case 2:
                print("Profile tab tapped")
            default:
                break
            }
        }
    }
}


class SeriesVC: UIViewController {
}

class HeadspaceVC: UIViewController {
}

class ProfileVC: UIViewController {
}


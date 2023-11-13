//
//  CryptoTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 13/11/23.
//

import UIKit

class CryptoTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarAppearance()
        setupTabBarItems()
        self.delegate = self
    }
    
    func configureTabBarAppearance() {
        tabBar.tintColor = .red
        tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBar.layer.borderWidth = 0.4
        tabBar.backgroundColor = .white
    }
    
    func setupTabBarItems() {
        setViewControllers([
            createVC(
                image: UIImage(named: "cryptoTabBarDashboard"),
                vc: DashboardVC(),
                tag: 0),
            createVC(
                image: UIImage(named: "cryptoTabBarCycle"),
                vc: UpdateVC(),
                tag: 1),
            createVC(
                image: UIImage(named: "cryptoTabBarPerson"),
                vc: PersonVC(),
                tag: 2)
        ], animated: true)
    }
    
    private func createVC(image: UIImage?, vc: UIViewController, tag: Int) -> UIViewController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = image
        nav.tabBarItem.tag = tag
        return nav
    }
}


// MARK: - UITabBarControllerDelegate
extension CryptoTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            switch index {
            case 0:
                print("Dashboard tab tapped")
            case 1:
                print("Update tab tapped")
            case 2:
                print("Profile tab tapped")
            default:
                break
            }
        }
    }
}


class DashboardVC: UIViewController {
}

class UpdateVC: UIViewController {
}

class PersonVC: UIViewController {
}


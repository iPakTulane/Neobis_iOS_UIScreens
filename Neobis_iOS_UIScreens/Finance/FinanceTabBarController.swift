//
//  FinanceTabBarController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 13/11/23.
//

import UIKit

class FinanceTabBarController: UITabBarController {

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
                    image: UIImage(named: "financeTabBarCircleChart"),
                    vc: MainVC(),
                    tag: 0),
                createVC(
                    image: UIImage(named: "financeTabBarChartBars"),
                    vc: ReportsVC(),
                    tag: 1),
                createVC(
                    image: UIImage(named: "financeTabBarPerson"),
                    vc: AccountVC(),
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
    extension FinanceTabBarController: UITabBarControllerDelegate {
        
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
                switch index {
                case 0:
                    print("Main tab tapped")
                case 1:
                    print("Reports tab tapped")
                case 2:
                    print("Account tab tapped")
                default:
                    break
                }
            }
        }
    }


    class MainVC: UIViewController {
    }

    class ReportsVC: UIViewController {
    }

    class AccountVC: UIViewController {
    }


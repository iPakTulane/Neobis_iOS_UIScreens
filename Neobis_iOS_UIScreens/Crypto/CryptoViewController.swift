//
//  CryptoViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by iPak Tulane on 08/11/23.
//

import UIKit

class CryptoViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = UIColor.gray
        }
    }
}

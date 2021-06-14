//
//  UIViewController+Extension.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

extension UIViewController {
    
    func showAlert (alertText: String, alertMessage: String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    func navigateToHome() {
        let newStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let newVC = newStoryboard.instantiateViewController(identifier: "HomeTabBarNav") as UITabBarController
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(newVC, animated: true)
    }
}

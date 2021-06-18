//
//  LifeStyleViewController.swift
//  Fundall
//
//  Created by omokagbo on 18/06/2021.
//

import UIKit

class LifeStyleViewController: UIViewController {
    
    @IBOutlet weak var firstNameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstName = UserDefaults.standard.string(forKey: "firstName") {
            firstNameLbl.text = "\(firstName)'s"
        }
    }
    
    @IBAction func switchAcctTapped(_ sender: UIButton) {
        let controller = LoginViewController.instantiate(storyboardName: "Login")
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func createAcctTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func enterPswdTapped(_ sender: UIButton) {
        let controller = WelcomeViewController.instantiate(storyboardName: "Welcome")
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func biometricsTapped(_ sender: UIButton) {
    }

}

//
//  LoginViewController.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var hidePswdBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let controller = LoginViewController.instantiate(storyboardName: "Welcome")
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func biometricsTapped(_ sender: UIButton) {
    }
    
    @IBAction func hidePswdBtnTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        hidePswdBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
}

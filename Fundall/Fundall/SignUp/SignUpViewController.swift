//
//  SignUpViewController.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

class SignUpViewController: UIViewController {
    
    enum SignupError: Error {
        case missingFirstName
        case missingLastName
        case invalidEmail
        case invalidPhoneNumber
        case incorrectPasswordFormat
        case incompleteField
    }

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var maskPswdBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavBar()
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        let controller = HomeViewController.instantiate(storyboardName: "Home")
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        let controller = LoginViewController.instantiate(storyboardName: "Welcome")
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func maskPswdBtnTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        maskPswdBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

//
//  SignUpViewController.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

class SignUpViewController: UIViewController {

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
    }
    
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
    }
    
    @IBAction func maskPswdBtnTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        maskPswdBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

//
//  LoginViewController.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var maskPswdBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func maskPswdBtnTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        maskPswdBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        if let email = emailTextField.text, !email.isEmpty, email != "", let password = passwordTextField.text, !password.isEmpty, password != "" {
            NetworkService.shared.authenticateUser(parameter: LoginRequest.init(email: email, password: password)) { (result) in
                switch result {
                case .success(_):
                    let controller = HomeViewController.instantiate(storyboardName: "Home")
                    self.navigationController?.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(controller, animated: true)
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}


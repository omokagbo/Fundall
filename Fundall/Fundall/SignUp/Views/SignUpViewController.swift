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
        validateTextFields()
        NetworkService.shared.registerUser(parameter: .init(firstname: firstNameTextField.text!, lastname: lastNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, passwordConfirmation: passwordTextField.text!)) { (result) in
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
    
    func validateTextFields() {
        
        if firstNameTextField.text == "" {
            self.showAlert(alertText: "First Name Empty", alertMessage: "Please, enter your first name")
        }
        
        else if lastNameTextField.text == "" {
            self.showAlert(alertText: "Last Name Empty", alertMessage: "Please, enter your last name")
        }
        
        else if emailTextField.text == "" {
            self.showAlert(alertText: "Email Empty", alertMessage: "Please, enter your email")
        }
        
        else if emailTextField.text != "" && emailTextField.text!.isValidEmail == false {
            self.showAlert(alertText: "Invalid Email", alertMessage: "Please, enter a valid email")
        }
        
        else if phoneTextField.text == "" {
            self.showAlert(alertText: "Phone Number Empty", alertMessage: "Please, enter your phone number")
        }
        
        else if phoneTextField.text != "" && phoneTextField.text!.count < 11 {
            self.showAlert(alertText: "Invalid Phone Number", alertMessage: "Please, enter a valid phone number")
        }
        
        else if passwordTextField.text == "" {
            self.showAlert(alertText: "Password Empty", alertMessage: "Please enter your password")
        }
        
        else if passwordTextField.text != "" && passwordTextField.text!.isValidPassword == false {
            self.showAlert(alertText: "Invalid Password",
                           alertMessage: "Password must be alphanumeric and must be greater than 8 characters")
        }
    }
    
}

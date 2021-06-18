//
//  WelcomeViewController.swift
//  Fundall
//
//  Created by omokagbo on 18/06/2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var hidePswdBtn: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let firstName = UserDefaults.standard.string(forKey: "firstName"), let email = UserDefaults.standard.string(forKey: "email") {
            firstNameLbl.text = "\(firstName)"
            emailLbl.text = "\(email)"
        }
    }
    
    @IBAction func hidePswdBtnTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        hidePswdBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @IBAction func didTapLoginBtn(_ sender: UIButton) {
        if let email = emailLbl.text, !email.isEmpty, email != "", let password = passwordTextField.text, !password.isEmpty, password != "" {
            NetworkService.shared.authenticateUser(parameter: LoginRequest.init(email: emailLbl.text!, password: passwordTextField.text!)) { (result) in
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
    
    @IBAction func didTapCreateAcct(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

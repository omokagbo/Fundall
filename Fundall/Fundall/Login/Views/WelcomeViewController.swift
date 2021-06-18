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
    }
    
    @IBAction func hidePswdBtnTapped(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        hidePswdBtn.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @IBAction func didTapLoginBtn(_ sender: UIButton) {
        let controller = HomeViewController.instantiate(storyboardName: "Home")
        navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func didTapCreateAcct(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

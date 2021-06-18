//
//  RequestCardViewController.swift
//  Fundall
//
//  Created by Decagon on 18/06/2021.
//

import UIKit

class RequestCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnClicked(_ sender: UIButton) {
        self.showAlert(alertText: "Yippeee!", alertMessage: "Card Request Successful.\n Welcome to tomorrow.")
    }
}

//
//  AnalyticsViewController.swift
//  Fundall
//
//  Created by Decagon on 18/06/2021.
//

import UIKit

class AnalyticsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

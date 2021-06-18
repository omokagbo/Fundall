//
//  HomeViewController.swift
//  Fundall
//
//  Created by omokagbo on 14/06/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func didTapRequestCard(_ sender: UIButton) {
    }
    
    @IBAction func didTapAnalytics(_ sender: UIButton) {
        let controller = AnalyticsViewController.instantiate(storyboardName: "Analytics")
        self.navigationController?.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

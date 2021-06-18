//
//  RequestCardViewController.swift
//  Fundall
//
//  Created by omokagbo on 18/06/2021.
//

import UIKit

class RequestCardViewController: UIViewController {

    @IBOutlet weak var cardTypeCollectionView: UICollectionView!
    @IBOutlet weak var cardTypeTableView: UITableView!
    
    var cardTypes = ["Fundal Lifestyle Card", "Rave Card", "Bitcoin Wallet", "Virtual Dollar Card", "Fundal Master Card"]
    var cardClass = ["Lifestyle Pro", "Lifestyle Premium", "Lifestyle Business"]
    var cardPrice = ["N9500", "N1000", "N1200"]
    var cardImage = [UIImage(systemName: "airplane"), UIImage(systemName: "diamond"), UIImage(systemName: "gift.fill")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your New Card"
        CardTypeTableViewCell().checkmarkButton.isHidden = true
        cardTypeTableView.isHidden = true
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.showAlert(alertText: "Yippeee!", alertMessage: "Card request successful. Welcome to tomorrow")
    }
    
}

extension RequestCardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cardTypeCollectionView.dequeueReusableCell(withReuseIdentifier: "CardTypeCollectionViewCell", for: indexPath) as? CardTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.titleLbl.text = cardTypes[indexPath.row]
        return cell
    }
}

extension RequestCardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        cardTypeTableView.isHidden = false
    }
}

extension RequestCardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cardTypeTableView.dequeueReusableCell(withIdentifier: "CardTypeTableViewCell", for: indexPath) as? CardTypeTableViewCell else {
            return UITableViewCell()
        }
        cell.cardTitleLbl.text = cardClass[indexPath.row]
        cell.cardPriceLbl.text = cardPrice[indexPath.row]
        cell.cardImage.image = cardImage[indexPath.row]
        return cell
    }
    
    
}

extension RequestCardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if CardTypeTableViewCell().checkmarkButton.isHidden {
            CardTypeTableViewCell().checkmarkButton.isHidden = false
        } else {
            CardTypeTableViewCell().checkmarkButton.isHidden = true
        }
    }
    
}

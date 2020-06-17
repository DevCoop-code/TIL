//
//  RyanWorldViewController.swift
//  RyanShop
//
//  Created by HanGyo Jeong on 2020/06/13.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RyanWorldViewController: UIViewController {

    @IBOutlet weak var cartButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    let ryanGoods = RyanGoods.ryanGoodsStuff
}

//MARK: View Lifecycle
extension RyanWorldViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Kakao Ryan Shop"
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//MARK: Rx Setup
private extension RyanWorldViewController {
    
}

//MARK: - Imperative methods
private extension RyanWorldViewController {
    func updateCartButton() {
        cartButton.title = "\(ShoppingCart.sharedCart.ryans.count)"
    }
}

// MARK - Table view data source
extension RyanWorldViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ryanGoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RyanShoppingItemCell.Identifier, for: indexPath) as? RyanShoppingItemCell else {
            return UITableViewCell()
        }
        
        let ryan = ryanGoods[indexPath.row]
        cell.configureWithRyan(ryan: ryan)
        
        return cell
    }
}

// MARK - Table view delegate
extension RyanWorldViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let ryan = ryanGoods[indexPath.row]
        ShoppingCart.sharedCart.ryans.append(ryan)
        updateCartButton()
    }
}

// MARK - SegueHandler

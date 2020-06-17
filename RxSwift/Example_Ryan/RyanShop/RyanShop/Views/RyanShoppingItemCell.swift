//
//  RyanShoppingItemCell.swift
//  RyanShop
//
//  Created by HanGyo Jeong on 2020/06/13.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import UIKit

class RyanShoppingItemCell: UITableViewCell {
    static let Identifier = "RyanShoppingItemCell"
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var goodsNameLabel: UILabel!
    @IBOutlet weak var goodsThumbnail: UIImageView!
    
    func configureWithRyan(ryan: RyanGoods) {
        priceLabel.text = CurrencyFormatter.wonsFormatter.string(from: ryan.priceInWons)
        goodsNameLabel.text = ryan.goodsName
        goodsThumbnail.image = UIImage.init(imageLiteralResourceName: ryan.goodsThumbnailName)
    }
}

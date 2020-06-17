//
//  ShoppingCart.swift
//  RyanShop
//
//  Created by HanGyo Jeong on 2020/06/13.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ShoppingCart {
    static let sharedCart = ShoppingCart()
    var ryans: [RyanGoods] = []
}

//MARK: Non-Mutating Functions
extension ShoppingCart {
    var totalCost: Float {              // Variable is read only so 'get' is droped
        return ryans.reduce(0) {
            runningTotal, ryanItem in
            return runningTotal + ryanItem.priceInWons
        }
    }
    
    var itemCountString: String {
        guard ryans.count > 0 else {
            return "No Ryan HERE"
        }
        
        // Unique the ryans
        let setOfRyans = Set<RyanGoods>(ryans)
        
        // Check how many of each exists
        let itemStrings: [String] = setOfRyans.map {
            ryan in
            let count: Int = ryans.reduce(0) {
                runningTotal, reduceRyan in
                if ryan == reduceRyan {
                    return runningTotal + 1
                }
                return runningTotal
            }
            return "\(ryan.goodsName): \(count)"
        }
        
        return itemStrings.joined(separator: "\n")
    }
}

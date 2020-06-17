//
//  CurrencyFormatter.swift
//  RyanShop
//
//  Created by HanGyo Jeong on 2020/06/14.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import Foundation

enum CurrencyFormatter {
    static let wonsFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter
    }()
}

extension NumberFormatter {
    func string(from float: Float) -> String? {
        return string(from: NSNumber(value: float))
    }
}

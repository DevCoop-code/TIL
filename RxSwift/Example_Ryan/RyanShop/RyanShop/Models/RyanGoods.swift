//
//  RyanGoods.swift
//  RyanShop
//
//  Created by HanGyo Jeong on 2020/06/13.
//  Copyright © 2020 HanGyoJeong. All rights reserved.
//

import Foundation

struct RyanGoods: Equatable, Hashable {
    let priceInWons: Float
    let goodsName: String
    let goodsThumbnailName: String
    
    // An array of RyanGoods
    static let ryanGoodsStuff: [RyanGoods] = {
        let bearRyan = RyanGoods(priceInWons: 47000, goodsName: "폼폼프렌즈 바디필로우_곰돌이라이언", goodsThumbnailName: "ryan_bear1")
        let honeyRyan = RyanGoods(priceInWons: 24000, goodsName: "허니프렌즈 말랑쿠션_라이언", goodsThumbnailName: "ryan_honey1")
        let hoodybodyRyan = RyanGoods(priceInWons: 39000, goodsName: "후디바디필로우_라이언", goodsThumbnailName: "ryan_bodyPillow1")
        let longbodyRyan = RyanGoods(priceInWons: 49000, goodsName: "롱바디필로우_후드라이언(핑크)", goodsThumbnailName: "ryan_longBodyPillow1")
        let marincoolingRyan = RyanGoods(priceInWons: 39000, goodsName: "마린 쿨링바디필로우_라이언", goodsThumbnailName: "ryan_marinCooling")
        
        return [bearRyan,
                honeyRyan,
                hoodybodyRyan,
                longbodyRyan,
                marincoolingRyan]
    }()
}

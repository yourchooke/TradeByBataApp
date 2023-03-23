//
//  Goods.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import Foundation

struct Latest: Codable {
    var latest: [Good]
}

struct FlashSale: Codable {
    var flashSale: [Good]
}

struct Good: Codable, Hashable {
    let category: String
    let name: String
    let price: Double
    let discount: Double?
    let imageUrl: String
}

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
    var category: String
    var name: String
    var price: Double
    var discount: Int?
    var imageUrl: String
}

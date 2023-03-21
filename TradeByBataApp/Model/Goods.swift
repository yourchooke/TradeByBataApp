//
//  Goods.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import Foundation

struct Latest: Codable {
    let latest: [Good]
}

struct Good: Codable {
    let category: String
    let name: String
    let price: Int
    let image_url: String
}

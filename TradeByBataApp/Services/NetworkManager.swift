//
//  NetworkManager.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImageData(from url: String) -> Data? {
        guard let imageURL = URL(string: url) else {return nil}
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}

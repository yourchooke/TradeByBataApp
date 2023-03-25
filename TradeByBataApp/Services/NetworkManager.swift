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
    
    func fetchData(for kind: KindOfGoods) async throws -> [Good] {
        
        guard let url = URL(string: kind.rawValue) else { return [] }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if kind == .flashSale {
                let decoderResponse = try decoder.decode(FlashSale.self, from: data)
                return decoderResponse.flashSale
            } else {
                let decoderResponse = try decoder.decode(Latest.self, from: data)
                return decoderResponse.latest
            }
            
        } catch {
            print("data isn't valid")
        }
        return []
    }

    
}

enum KindOfGoods: String {
    case latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    case flashSale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
}

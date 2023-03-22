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
        guard let imageURL = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
    
    func fetchLatestData(from latestUrl: String) async -> Void {
        guard let url = URL(string: latestUrl) else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoderLatestResponse = try decoder.decode(Latest.self, from: data)
            print(decoderLatestResponse)
        } catch {
            print("data isn't valid")
        }
    }
    
    func fetchSaleData(from saleUrl: String) async -> Void {
        guard let saleUrl = URL(string: saleUrl) else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let (data, _) = try await URLSession.shared.data(from: saleUrl)
            let decoderResponse = try decoder.decode(FlashSale.self, from: data)
            print(decoderResponse)
        } catch {
            print("data isn't valid")
        }
    }
    
}

enum Constants: String {
    case latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    case flashSaleURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
}

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
    
    func fetchData(for kind: KindOfGoods) async -> Void {
        
        guard let url = URL(string: kind.rawValue) else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if kind == .flashSale {
                var goods: [Good] = []
                let decoderResponse = try decoder.decode(FlashSale.self, from: data)
                for good in decoderResponse.flashSale {
                    goods.append(good)
                    print(" \(good) ")
                }
       //         print(decoderResponse)
        //        print(decoderResponse.flashSale.first)
            } else {
                let decoderResponse = try decoder.decode(Latest.self, from: data)
                print(decoderResponse)
            }
            
        } catch {
            print("data isn't valid")
        }
    }

    
}

enum KindOfGoods: String {
    case latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    case flashSale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
}

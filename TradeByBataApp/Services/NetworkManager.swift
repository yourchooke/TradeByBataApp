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
    
    func fetchLatestData(from url: String) async -> Void {
        guard let url = URL(string: url) else { return }
    //    print(url)
    //    let decoder = JSONDecoder()
    //    decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data.first)
            let decoderResponse = try JSONDecoder().decode(Latest.self, from: data)
            
            print(decoderResponse)
        } catch {
            print("data isn't valid")
        }
    }
    
    
}

enum Constants: String {
    case latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
}


public struct Throwable<T: Decodable>: Decodable {
    
    public let result: Result<T, Error>

    public init(from decoder: Decoder) throws {
        let catching = { try T(from: decoder) }
        result = Result(catching: catching )
    }
}

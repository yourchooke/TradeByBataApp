//
//  HomeViewModel.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 22.03.2023.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var latest: [Good]? { get }
    var flashSale: [Good]? { get }
}


class HomeViewModel: HomeViewModelProtocol, ObservableObject {
    
    @Published var latest: [Good]?
    @Published var flashSale: [Good]?
    
    func fetchData() async {
      self.latest = nil
      self.latest = try? await NetworkManager.shared.fetchData(for: .latest)
        print(latest?.first?.category ?? " oops! ")
    }
    
    func fetchImageData(for good: Good) -> Data? {
        NetworkManager.shared.fetchImageData(from: good.imageUrl)
    }
}

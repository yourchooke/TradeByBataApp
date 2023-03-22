//
//  HomeView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        
        HStack{
            LatestCard(
                category: "Games",
                name: "Civilization",
                price: 30.3,
                imageData: nil
            )
        }
            .task {
                await NetworkManager.shared.fetchData(for: .flashSale)
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

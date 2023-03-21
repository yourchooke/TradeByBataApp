//
//  HomeView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                await NetworkManager.shared.fetchLatestData(from: Constants.latestURL.rawValue)
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

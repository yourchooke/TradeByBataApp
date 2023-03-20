//
//  TabBarView.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            ProfileView(viewModel: ProfileViewModel(user: User.getUsers()))
                .tabItem {
                    Image(systemName: "person")
                }    
            MockupDestinationView()
                .tabItem {
                    Image(systemName: "bubble.left")
                }
        }
            .background(.white)
            .cornerRadius(30)
            .ignoresSafeArea()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

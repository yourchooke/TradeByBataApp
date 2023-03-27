//
//  TabBarView.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject private var user: UserManager
    
    init() {
           UITabBar.appearance().backgroundColor = UIColor.white
       }
    var body: some View {
        
        TabView {
            
            HomeView(viewModel: HomeViewModel())
                .tabItem {
                    Image(systemName: "house")
                }
            MockupDestinationView()
                .tabItem {
                    Image(systemName: "heart")
                }
            MockupDestinationView()
                .tabItem {
                    Image(systemName: "cart")
                }
            MockupDestinationView()
                .tabItem {
                    Image(systemName: "bubble.left")
                }
            ProfileView(viewModel: ProfileViewModel(user: StorageManager.shared.getLogged()!))
                .tabItem {
                    Image(systemName: "person")
                }

        }
            .navigationBarBackButtonHidden()
            .cornerRadius(30)
            .ignoresSafeArea()
    } 
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

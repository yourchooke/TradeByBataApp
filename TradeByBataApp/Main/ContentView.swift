//
//  ContentView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 20.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if StorageManager.shared.checkLogged() {
            SignInView()
                .task {
                    StorageManager.shared.setPreconditions()
                }
        } else {
            TabBarView()
                .environmentObject(StorageManager.shared.getLogged())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  HomeView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            if viewModel.latest != nil{
                
                Text(viewModel.latest?.first?.category ?? " ")
                
                
                ScrollView {
//                    HStack{
//                        ForEach($viewModel.latest, id: \.self) {good in
//                            LatestCard(
//                                category: good.category,
//                                name: good.name,
//                                price: good.price,
//                                imageData: nil
//                            )
//                        }
//                    }
//                }
                
            } else {
                Text("Loading...")
            }
        }.task {
            await viewModel.fetchData()
            print("await fetch data")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel.init())
    }
}

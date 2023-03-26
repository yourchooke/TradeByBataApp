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
        
        
        NavigationStack {
            VStack{
                HStack {
                    Text("Latest")
                        .bold()
                        .fontStyle(style: .body)
                    Spacer()
                    Button(action: {}) {
                        Text("View all")
                            .foregroundColor(.gray)
                    }
                } .padding()
                if let latestArray = viewModel.latest {
                    ScrollView {
                        HStack{
                            ForEach(latestArray, id: \.name) {good in
                                LatestCard(
                                    category: good.category,
                                    name: good.name,
                                    price: good.price,
                                    imageURL: good.imageUrl
                                )
                            }
                        }
                    }
                } else {
                    Text("Loading...")
                }
                
                HStack {
                    Text("Flash Sale")
                        .bold()
                        .fontStyle(style: .body)
                    Spacer()
                    Button(action: {}) {
                        Text("View all")
                            .foregroundColor(.gray)
                    }
                } .padding()
                
                if let flashSaleArray = viewModel.flashSale {
                    ScrollView {
                        HStack{
                            ForEach(flashSaleArray, id: \.name) {good in
                                FlashSaleCard(
                                    category: good.category,
                                    name: good.name,
                                    price: good.price,
                                    discount: good.discount ?? 0,
                                    imageURL: good.imageUrl
                                )
                            }
                        }
                    }
                    
                } else {
                    Text("Loading...")
                }
            }.task {
                await viewModel.fetchData()
                print("await fetch data")
            }
                .navigationTitle("Trade by bata")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        VStack {
                            ProfilePhoto(imageURL: nil, imageSize: CGSize(width: 20, height: 20))
                            Button(action: {}) {
                                HStack {
                                    Text("Location")
                                        .fontStyle(style: .footnote)
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .frame(width: 8, height: 4)
                                }
                            }
                            .foregroundColor(.black)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "line.3.horizontal")
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel.init())
    }
}

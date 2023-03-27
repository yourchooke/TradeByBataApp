//
//  HomeView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 21.03.2023.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
    @State var searchText = ""
    
    var body: some View {
        
        
        NavigationStack {
            VStack{
// Search
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 0.961, green: 0.965, blue: 0.969))
                    TextField("What are you looking for?", text: $searchText)
                        .font(AppFont().footnote)
                        .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
                    Image(systemName: "magnifyingglass")
                        .padding(.init(top: 0, leading: 220, bottom: 0, trailing: 0))
                }
                    .frame(width: 262, height: 30)
                    .padding(.top, 30)
// Categories
             Categories()
                
// Latest
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
                    ScrollView(.horizontal, showsIndicators: false) {
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
                        .frame(height: 150)
                }
// Flash sale
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
                    ScrollView(.horizontal, showsIndicators: false) {
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
                        .frame(height: 221)
                }
            }.task {
                await viewModel.fetchData()
                print("await fetch data")
            }
// Navigation bar
                .navigationTitle("Trade by bata")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        VStack {
                            ProfilePhoto(imageURL: viewModel.photoURL, imageSize: CGSize(width: 20, height: 20))
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
            
            Spacer()
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel.init())
            .environmentObject(StorageManager.shared.getLogged() ?? UserManager())
    }
}

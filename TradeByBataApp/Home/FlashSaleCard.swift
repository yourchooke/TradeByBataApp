//
//  FlashSaleCard.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 25.03.2023.
//

import SwiftUI

struct FlashSaleCard: View {
    let category: String
    let name: String
    let price: Double
    let discount: Double
    let imageURL: String
    let width = CGFloat(174)
    let height = CGFloat(221)
    let cornerRadius = CGFloat(20)
    
    var body: some View {
        
            ZStack {
                Rectangle()
                    .frame(width: width, height: height)
                    .cornerRadius(cornerRadius)
                    .foregroundColor(.gray)
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .frame(width: width, height: height)
                        .cornerRadius(cornerRadius)
                } placeholder: {
                    Image(systemName: "xmark.shield")
                }

                VStack{
                    HStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.85)))
                            Text(category)
                                .bold()
                                .fontSize(size: 10)
                        } .frame(width: 50, height: 20)
                        Spacer()
                    }
                    
                    .padding(.init(.init(top: 120, leading: 0, bottom: 0, trailing: 0)))
                    HStack {
                        Text(name)
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    } .padding(.init(.init(top: 0, leading: 0, bottom: 0, trailing: 0)))
                    
                    HStack {
                        Text("$ \(String(format: "%.3f", price))")
                            .fontSize(size: 12)
                            .foregroundColor(.white)
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "heart.circle.fill")
                                .resizable()
                                .frame(width: 30.0, height: 30.0)
                                .foregroundColor(Color(UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)))
                        } .scaledToFit()
                        
                        Button(action: {}) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30.0, height: 30.0)
                                .foregroundColor(Color(UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)))
                                
                             
                        }
                        
                            
                        
                    }
                    

                } .frame(width: width - 10, height: height - 10)
               
            }
    }
}

struct FlashSaleCard_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleCard(
            category: "Kids",
            name: "Reebok Classic",
            price: 24,
            discount: 30,
            imageURL: "https://img1.goodfon.ru/wallpaper/nbig/a/69/kartinka-3d-dikaya-koshka.jpg"
        )
    }
}

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
    let discount: Int
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
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .cornerRadius(cornerRadius)
                } placeholder: {
                    Image(systemName: "xmark.shield")
                }

                VStack{
                    HStack {
                        ProfilePhoto(
                        imageURL: nil,
                        imageSize: CGSize(width: 20, height: 20)
                        )
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(UIColor(red: 0.976, green: 0.227, blue: 0.227, alpha: 1)))
                            Text("\(discount)% off ")
                                .bold()
                                .fontSize(size: 10)
                        } .frame(width: 50, height: 20)
                    } .padding(.init(.init(top: 15, leading: 10, bottom: 0, trailing: 10)))
                    
                    
                    HStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.85)))
                            Text(category)
                                .bold()
                                .fontSize(size: 10)
                        } .frame(width: 50, height: 20)
                        Spacer()
                    }.padding(.init(.init(top: 90, leading: 10, bottom: 0, trailing: 10)))
                    
                    HStack {
                        Text(name)
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                    } .padding(.init(.init(top: 0, leading: 10, bottom: 0, trailing: 10)))
                    
                    HStack {
                        Text("$ \(String(format: "%.3f", price))")
                            .fontSize(size: 12)
                            .foregroundColor(.white)
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "heart.circle.fill")
                                .resizable()
                                .frame(width: 27.0, height: 27.0)
                                .foregroundColor(Color(UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)))
                        }
                        Button(action: {}) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 33.0, height: 33.0)
                                .foregroundColor(Color(UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)))
                        }
                    }  .padding(.init(.init(top: 0, leading: 10, bottom: 15, trailing: 10)))
                    

                } .frame(width: width, height: height)
               
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
            imageURL: "https://www.tradeinn.com/f/13754/137546 834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"
        )
    }
}

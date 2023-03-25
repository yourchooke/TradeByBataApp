//
//  LatestCard.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 22.03.2023.
//

import SwiftUI

struct LatestCard: View {
    let category: String
    let name: String
    let price: Double
    let imageURL: String
    let width = CGFloat(115)
    let height = CGFloat(150)
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
                
                .padding(.init(.init(top: 70, leading: 0, bottom: 0, trailing: 0)))
                HStack {
                    Text(name)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                } .padding(.init(.init(top: 0, leading: 0, bottom: 1, trailing: 0)))
                HStack {
                    Text("$ \(String(format: "%.3f", price))")
                        .fontSize(size: 12)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(UIColor(red: 0.898, green: 0.914, blue: 0.937, alpha: 0.85)))
                    }
                }
                

            } .frame(width: width - 10, height: height - 10)
           
        }
        
    }
}

struct LatestCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LatestCard(
                category: "Games",
                name: "Civilization",
                price: 30.3,
                imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig")
                
        }
    }
}

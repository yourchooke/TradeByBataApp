//
//  Categories.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 26.03.2023.
//

import SwiftUI
var categories = [
    "Phones" : "iphone.gen1",
    "Headphones" : "beats.headphones",
    "Games" : "gamecontroller",
    "Cars"  : "car.side",
    "Furniture" : "bed.double",
    "Kids" : "face.smiling",
    "Flats" : "house"]

struct Categories: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories.keys.sorted(), id: \.self) { category in
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(red: 0.933, green: 0.937, blue: 0.957))
                                .scaleEffect(2)
                            Image(systemName: categories[category] ?? "xmark.shield")
                                .resizable()
                                .fixedSize()
                                .scaledToFit()
                           
                        } .frame(width: 30)
                            .padding()
                        Text(category)
                            .fontSize(size: 8)
                            .frame(width: 52)
                    }
                }
                
            }
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}

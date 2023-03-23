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
    let imageData: Data?
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 115, height: 150)
                .cornerRadius(10)
                .foregroundColor(.gray)
            getImage(from: imageData)
                .resizable()
                .frame(width: 115, height: 150)
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
                

            } .frame(width: 110, height: 150)
           
        }
        
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield")}
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield")}
        return Image(uiImage: image)
    }
}

struct LatestCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LatestCard(
                category: "Games",
                name: "Civilization",
                price: 30.3,
                imageData: NetworkManager.shared.fetchImageData(from: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"))
                
        }
    }
}

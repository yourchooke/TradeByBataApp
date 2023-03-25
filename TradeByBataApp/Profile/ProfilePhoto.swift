//
//  ProfilePhoto.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import SwiftUI

struct ProfilePhoto: View {
    let imageURL: String?
    let imageSize: CGSize

    var body: some View {
        
        AsyncImage(url: URL(string: imageURL ?? "")) { image in
            image
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
                
        } placeholder: {
            ZStack {
                Circle()
                    .foregroundColor(.yellow)
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.7)
            }.frame(width: imageSize.width, height: imageSize.height)
        }
    }
}

struct ProfilePhoto_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhoto(imageURL: nil, imageSize: CGSize(width: 100, height: 100))
    }
}

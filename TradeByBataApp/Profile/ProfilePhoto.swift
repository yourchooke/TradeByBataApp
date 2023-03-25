//
//  ProfilePhoto.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import SwiftUI

struct ProfilePhoto: View {
    let imageURL: String
    let imageSize: CGSize

    var body: some View {
        
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .frame(width: imageSize.width, height: imageSize.height)
                
        } placeholder: {
            Image(systemName: "xmark.shield")
        }

            
                    
    }
    
    private func getImage(from data: Data?) -> Image {
        guard let data = data else { return Image(systemName: "xmark.shield")}
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield")}
        return Image(uiImage: image)
    }
}

struct ProfilePhoto_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhoto(imageURL: User.getUsers().photoUrl, imageSize: CGSize(width: 100, height: 100))
    }
}

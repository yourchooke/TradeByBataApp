//
//  ProfileView.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    var viewModel: ProfileViewModel
    var body: some View {
        NavigationView {
            VStack{
                Text("Profile")
                    .fontWeight(.semibold)
                ProfilePhoto(imageData: viewModel.photo, imageSize: CGSize(width: 100, height: 100))
                Button(action: {}) {
                    Text("Change photo")
                        .font(AppFont().footnote)
                }
                
            
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

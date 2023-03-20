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
                Text(viewModel.fullName)
                    .font(AppFont().body)
                    .bold()
                    .padding()
                Button(action: {}) {
                    HStack{
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                        Text("Upload item")
                        Spacer()
                    }
                }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.306, green: 0.333, blue: 0.843))
                    .padding(.init(top: 35, leading: 40, bottom: 0, trailing: 40))
            }
            
        } .font(AppFont().body)
            .bold()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

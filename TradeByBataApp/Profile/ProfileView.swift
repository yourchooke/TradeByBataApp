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
            VStack{
                Text("Profile")
                    .fontWeight(.semibold)
                ProfilePhoto(imageData: viewModel.photo, imageSize: CGSize(width: 50, height: 50))
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
                    } .bold()
                }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.306, green: 0.333, blue: 0.843))
                    .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                List{
                    NavigationLink(destination: MockupDestinationView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "menubar.rectangle",
                            text: "Trade store",
                            value: nil
                        )
                    }
                    NavigationLink(destination: MockupDestinationView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "menubar.rectangle",
                            text: "Payment method",
                            value: nil
                        )
                    }
                    NavigationLink(destination: MockupDestinationView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "menubar.rectangle",
                            text: "Balance",
                            value: viewModel.balance
                        )
                    }
                    NavigationLink(destination: MockupDestinationView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "menubar.rectangle",
                            text: "Trade history",
                            value: nil
                        )
                    }
                    NavigationLink(destination: MockupDestinationView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "arrow.triangle.2.circlepath",
                            text: "Restore purchase",
                            value: nil
                        )
                    }
                    NavigationLink(destination: MockupDestinationView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "questionmark.circle",
                            text: "Help",
                            value: nil
                        )
                    }
                    NavigationLink(destination: LoginView()) {
                        RowView(
                            viewModel: viewModel,
                            imageName: "rectangle.portrait.and.arrow.forward",
                            text: "Log out",
                            value: nil
                        )
                    }
                }.listStyle(.plain)
            }
            
         .font(AppFont().body)
            
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

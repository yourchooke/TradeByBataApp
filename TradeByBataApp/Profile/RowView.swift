//
//  RowView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 20.03.2023.
//

import SwiftUI

struct RowView: View {
    let viewModel: ProfileViewModel
    let imageName: String
    let text: String
    let value: String?
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .scaleEffect(1.4)
                .frame(width: 40, height: 40)
                .background(Color(red: 0.933, green: 0.937, blue: 0.957))
                .clipShape(Circle())
            Text(text)
            if let value = value {
                Spacer()
                Text(value)
            }
        }
            .frame(height: 37)
            .font(AppFont().body)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(
            viewModel: ProfileViewModel(
                user: StorageManager.shared.getLogged()!),
            imageName: "arrow.triangle.2.circlepath",
            text: "Restore purchase",
            value: "111"
        )
        .padding()
    }
}

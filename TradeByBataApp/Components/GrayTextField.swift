//
//  GrayTextField.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 16.03.2023.
//

import SwiftUI

struct GrayTextField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(red: 0.91, green: 0.91, blue: 0.91))
                .frame(height: 30)
            TextField(title, text: $text)
                .autocapitalization(.none)
                .textCase(.lowercase)
                .foregroundColor(Color(red: 0.482, green: 0.482, blue: 0.482))
        }
        .font(AppFont().body)
        .multilineTextAlignment(.center)
    }
}

struct GrayTextField_Previews: PreviewProvider {
    static var previews: some View {
        GrayTextField(title: "hello", text: .constant(""))
            .padding()
    }
}

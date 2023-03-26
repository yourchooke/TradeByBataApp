//
//  GraySecuredTextView.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 26.03.2023.
//

import SwiftUI

struct GraySecuredTextField: View {
    var title: String
    @Binding var text: String
    @State var isSecured: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(red: 0.91, green: 0.91, blue: 0.91))
                .frame(height: 30)
            HStack{
                    if !isSecured {
                        TextField(title, text: $text)
                            .padding(.trailing, -45)
                    } else {
                        SecureField(title, text: $text)
                            .padding(.trailing, -45)
                    }
                Button(action: { isSecured.toggle() }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                } .padding(.trailing, 15)
            }
        }
            .font(AppFont().body)
            .multilineTextAlignment(.center)
    }
}

struct GraySecuredTextView_Previews: PreviewProvider {
    static var previews: some View {
        GraySecuredTextField(title: "Password", text: .constant(""), isSecured: true)
        
    }
}

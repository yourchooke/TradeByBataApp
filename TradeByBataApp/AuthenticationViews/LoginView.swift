//
//  Login.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 14.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var name = ""
    @State private var password = ""
    
    var body: some View {

            VStack{
                Text("Welcome back")
                    .fontWeight(.semibold)
                    .fontSize(size: 30)
                    
                
                GrayTextField(title: "First name", text: $name)
                    .padding(.init(top: 60, leading: 0, bottom: 35, trailing: 0))
                
                GraySecuredTextField(title: "Password", text: $password, isSecured: true)
                
                
                Spacer(minLength: 99)
                
                    Button(action: loginAction) {
                        Spacer()
                        Text("Login")
                            .font(AppFont().body)
                            .tint(.white)
                            .bold()
                        Spacer()
                }

                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.306, green: 0.333, blue: 0.843))
                
                
                Spacer()
            }
            .padding(EdgeInsets(top: 140, leading: 43, bottom: 0, trailing: 43))
        .ignoresSafeArea()
        }
        
    
    
    func loginAction() {
        let currentName = $name.wrappedValue
        let currentPass = $password.wrappedValue
        if !StorageManager.shared.checkLogin(name: currentName, pass: currentPass){
            
        } else {print("there is no such user")}
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

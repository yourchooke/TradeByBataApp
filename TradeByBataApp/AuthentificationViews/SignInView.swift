//
//  SignInView.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 17.03.2023.
//

import SwiftUI

struct SignInView: View {
    @State private var name = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Sign in")
                    .fontWeight(.semibold)
                    .fontSize(size: 30)
                
                GrayTextField(title: "First name", text: $name)
                    .padding(.init(top: 60, leading: 0, bottom: 0, trailing: 0))
                GrayTextField(title: "Last name", text: $lastName)
                    .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
                GrayTextField(title: "Email", text: $email)
                    .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))

                Button(action: {}) {
                    Spacer()
                    Text("Sign in")
                        .font(AppFont().body)
                        .bold()
                    Spacer()
                } .frame(height: 46)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.306, green: 0.333, blue: 0.843))
                .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
                
                HStack {
                    Text("Already have an account?")
                    NavigationLink("Log in", destination: LoginView())
                            .foregroundColor(.blue)
                    Spacer()
                }.font(AppFont().footnote)
                
                VStack{
                    HStack{
                        Image("GooglePic")
                            .frame(width: 25, height: 25)
                        Text("Sign in with Google")
                        Spacer()
                    }
                    HStack{
                        Image("ApplePic")
                            .scaleEffect(1.23)
                            .frame(width: 25, height: 25)
                        Text("Sign in with Apple")
                        Spacer()
                    }
                }
                    .font(AppFont().body)
                    .padding(.init(top: 35, leading: 20, bottom: 0, trailing: 20))
                
                Spacer()
            }
            .padding(EdgeInsets(top: 100, leading: 43, bottom: 0, trailing: 43))
       
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

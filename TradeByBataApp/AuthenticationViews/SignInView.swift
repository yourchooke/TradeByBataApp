//
//  SignInView.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 17.03.2023.
//

import SwiftUI
import RealmSwift

struct SignInView: View {
    @State private var name = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var showingAlert = false
    @State private var showingValidationAlert = false
        
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
                    .textCase(.lowercase)
                    .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
// Sign in
                Button(action: signInAction) {
                    Spacer()
                    Text("Sign in")
                        .font(AppFont().body)
                        .bold()
                    Spacer()
                }
                .alert("User with this email exist", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { showingAlert.toggle()}
                       }
                .alert("Wrong email format", isPresented: $showingValidationAlert) {
                    Button("OK", role: .cancel) { showingValidationAlert.toggle()}
                       }
                .frame(height: 46)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.306, green: 0.333, blue: 0.843))
                .padding(.init(top: 35, leading: 0, bottom: 0, trailing: 0))
// Log in
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
    
    func signInAction() -> Void {
        let currentEmail = $email.wrappedValue
        if !textFieldValidatorEmail(currentEmail){
            showingValidationAlert.toggle()
        }
        let result = StorageManager.shared.checkEmail(email: currentEmail)
        if !result {
            showingAlert.toggle()
        } else {
            let user = UserManager(value: [name, lastName, email, "", "111", 0, true])
            StorageManager.shared.save(user)
        }
        
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

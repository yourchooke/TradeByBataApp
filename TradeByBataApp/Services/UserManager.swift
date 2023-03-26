//
//  UserManager.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 27.03.2023.
//

import Combine

class UserManager: ObservableObject {
    @Published var user: User
    
    static func getEmptyUser() -> User {
        User(firstName: "",
             lastName: "",
             email: "",
             photoUrl: "")
    }
    
    init(user: User){
        self.user = user
    }
    
}

//
//  User.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import Foundation

struct User: Decodable {
    var firstName: String
    var lastName: String
    var email: String
    var photoUrl: String
    var password: String?
    var balance: Double?
    
    var fullname: String {
        "\(firstName)  \(lastName)"
    }
    
    static func getUsers() -> User {
        return User(
            firstName: "Sadhi",
            lastName: "Adhi Pradana",
            email: "sadhi@mail.ru",
            photoUrl: "https://github.com/yourchooke/TradeByBataApp/blob/main/TradeByBataApp/Mocks/avatar.png?raw=true",
            password: "123",
            balance: 1593
        )
        
    }
}



//
//  UserManager.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 27.03.2023.
//

import Foundation
import RealmSwift

class UserManager: Object,Identifiable {
//    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var email: String
    @Persisted var photoUrl: String = ""
    @Persisted var password: String
    @Persisted var balance: Double = 0
    @Persisted var isLogged: Bool = false
    
    var fullname: String {
        "\(firstName)  \(lastName)"
    }
    
    

}

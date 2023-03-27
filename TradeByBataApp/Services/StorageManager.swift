//
//  StorageManager.swift
//  TradeByBataApp
//
//  Created by Olga Yurchuk on 27.03.2023.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    func save(_ user: UserManager) {
        try! realm.write {
            realm.add(user)
        }
    }
    
    func checkEmail(email: String) -> Bool {
        return realm.objects(UserManager.self).filter("email = %@", email).isEmpty
    }
    
    func checkLogin(name: String, pass: String) -> Bool {
        return realm.objects(UserManager.self).filter("firstName = %@ AND password == %@",name,pass).isEmpty
    }
    
    func getUser(name: String, pass: String) -> UserManager {
        return realm.objects(UserManager.self).filter("firstName = %@ AND password == %@",name,pass).first! 
    }
    
    func setPreconditions() {
        if realm.isEmpty {
            let user1 = UserManager(value: ["Sadhi",
                                    "Adhi Pradana",
                                    "sadhi@mail.ru",
                                    "https://github.com/yourchooke/TradeByBataApp/blob/main/TradeByBataApp/Mocks/avatar.png?raw=true",
                                    "123",
                                    1593
                                   ])
            save(user1)
            let user2 = UserManager(value: ["Olga",
                                    "Yurchuk",
                                    "o.sazhenkova@gmail.com",
                                    "https://avatars.githubusercontent.com/u/105637240?v=4",
                                    "123",
                                    1593
                                   ])
            save(user2)
        }
    }
}

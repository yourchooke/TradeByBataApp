//
//  ProfileViewModel.swift
//  TradeByBata
//
//  Created by Olga Yurchuk on 19.03.2023.
//

import Foundation

protocol ProfileViewModelProtocol {
    var fullName: String { get }
    var photoURL: String { get }
    var balance: String { get }
    
    init(user: UserManager)
}

class ProfileViewModel: ProfileViewModelProtocol {
    var fullName: String {
        "\(user.firstName) \(user.lastName)"
    }
    
    var photoURL: String {
        user.photoUrl
    }
    
    var balance: String {
        let balance = user.balance
        return "$ \(balance)"
    }
    
    private let user: UserManager
    
    required init(user: UserManager) {
        self.user = StorageManager.shared.getLogged()!
    }
}

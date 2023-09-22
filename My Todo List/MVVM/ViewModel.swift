//
//  ViewModel.swift
//  My Todo List
//
//  Created by 랑 on 2023/09/21.
//

import Foundation

class UserViewModel {
    private var user: User

    init(user: User) {
        self.user = user
    }

    var userName: String {
        return user.name
    }

    var userAge: Int {
        return user.age
    }
}

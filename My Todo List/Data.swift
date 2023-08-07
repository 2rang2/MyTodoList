//
//  Data.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/07.
//

import Foundation

class Data {
    var title: String
    var description: String
    var isCompleted: Bool
    
    init(title: String, description: String, isCompleted: Bool) {
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}

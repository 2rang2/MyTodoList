//
//  Data.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/07.
//

import Foundation

struct Todo: Codable {
    let date: Date
    var title: String
    var description: String
    var isCompleted: Bool
} // row

struct TodoSortedByDate {
    let date: Date
    let todoList: [Todo]
} // section

extension Date {
    static func getDate(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: date) ?? Date()
    }
}

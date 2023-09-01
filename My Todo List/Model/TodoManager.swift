//
//  DataManager.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/07.
//

import Foundation

class TodoManager {
    static let defaults = UserDefaults.standard
    
    var todoList: [Todo] = [
        Todo(date: Date.getDate("08/25/2023"), title: "알고리즘 풀기", description: "프로그래머스 입문", isCompleted: false),
        Todo(date: Date.getDate("08/30/2023"), title: "TIL 작성하기", description: "Velog", isCompleted: false),
        Todo(date: Date.getDate("08/28/2023"), title: "질문 & 피드백", description: "Gather", isCompleted: false)
    ]
    
    var sortedTodoList: [TodoSortedByDate] = [
        TodoSortedByDate(date: Date(), todoList: [Todo]),
        TodoSortedByDate(date: <#T##Date#>, todoList: <#T##[Todo]#>),
        TodoSortedByDate(date: <#T##Date#>, todoList: <#T##[Todo]#>),
    ]
    
    func addList(_ newTodo: Todo) {
        todoList.append(newTodo)
        updateList(todoList)
    }
    
    func updateList(_ todoList: [Todo]) {
        if let encodedTodo = try? JSONEncoder().encode(todoList) {
            TodoManager.defaults.set(encodedTodo, forKey: "TodoList")
        }                                                                               //https://zeddios.tistory.com/373
    }
    
    func setNewTodoList() -> [Todo] {
        guard let encodedTodo = TodoManager.defaults.object(forKey: "TodoList") as? Data,
              let todoList = try? JSONDecoder().decode([Todo].self, from: encodedTodo) else {
            return todoList
        }
        return todoList
    }
    
    func completeList() -> [Todo] {
        return todoList.filter { $0.isCompleted == true }
    }
}

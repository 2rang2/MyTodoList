//
//  DataManager.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/07.
//

import UIKit
import CoreData

class TodoManager {
    static let shared: TodoManager = TodoManager()

    //Core Data 초기화
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    func save(title: String,
              details: String,
              isCompleted: Bool = false) {
        if let context = context,
           let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: "Todo", in: context) {
            if let todoList: Todo = NSManagedObject(entity: entity, insertInto: context) as? Todo {
                todoList.title = title
                todoList.details = details
                todoList.isCompleted = isCompleted
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func loadTodos() -> [Todo] {
        var todoList: [Todo] = [Todo]()
        
        if let context = context {
            let request: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: "Todo")
            do {
                if let fetchResult: [Todo] = try context.fetch(request) as? [Todo] {
                    todoList = fetchResult
                }
            } catch {
                print(error)
            }
        }
        return todoList
    }
    
    func completeList() -> [Todo] {
//        loadTodos().filter(\.isCompleted)     
//        > 이렇게도 쓸 수 있지만 효율적이지 못함. 모든 데이터를 fetch 한 후에 거기서 isCompleted = true 인 애들을 골라내는거니까. 반면에 아래는 처음부터 isCompleted = true만 fetch 해옴.
        
        var todoList: [Todo] = [Todo]()
        
        if let context = context {
            let request: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: "Todo")
            let filterCompleted = NSPredicate(format: "isCompleted == %@", NSNumber(value: true))
            request.predicate = filterCompleted
            do {
                if let fetchResult: [Todo] = try context.fetch(request) as? [Todo] {
                    todoList = fetchResult
                }
            } catch {
                print(error)
            }
        }
        return todoList
    }
    
    func updateList() {
        if let context = context {
            do {
                try context.save()  // throws, try? context?.save()
            } catch {
                print(error)
            }
        }
    }
}

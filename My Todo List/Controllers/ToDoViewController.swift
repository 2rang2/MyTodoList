//
//  ToDoViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/03.
//

import UIKit

class ToDoViewController: UIViewController {
    
    var todoManager: TodoManager!
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        todoManager.todoList = todoManager.setNewTodoList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        todoManager.todoList = todoManager.setNewTodoList()    > viewDidLoad에서 해주기 때문에 중복으로 또 해줄 필요없음. 뒤로가기 누를 때 저장해줘야한다고 생각했는데 어차피 '할일 확인하기' 버튼을 누를 때 viewDidLoad가 실행되므로 그럴 필요가 없다!
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "새로운 할일", message: nil, preferredStyle: .alert)
        let toDoAddAction = UIAlertAction(title: "추가", style: .default) { (action) in
            if let title = alert.textFields?[0].text, let description = alert.textFields?[1].text {
                let newData = Todo(date: Date(), title: title, description: description, isCompleted: false)
                self.todoManager.addList(newData)
                self.toDoTableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
                // self.toDoTableView.insertRows(at: [IndexPath(row: self.todoManager.todoList.count-1, section: 0)], with: .automatic)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addTextField { (titleTextField) in
            titleTextField.placeholder = "Title"
        }
        alert.addTextField { (descriptionTextField) in
            descriptionTextField.placeholder = "Description"
        }
        alert.addAction(cancelAction)
        alert.addAction(toDoAddAction)
        
        present(alert, animated: true, completion: nil)
    }
}

//extension ToDoViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("you tapped me!")
//    }
//}

extension ToDoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let date = Array(Set(todoManager.todoList.map { $0.date })).sorted()[section]
        return todoManager.todoList.filter{ $0.date == date }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() } // Class 이름
        
        let todoData = todoManager.todoList[indexPath.row]
        let attributes = NSAttributedString(
            string: todoData.description,
            attributes: [
                NSAttributedString.Key.strikethroughStyle: 2,
                .strikethroughColor: UIColor.red
            ])
        
        cell.titleLabel.text = todoData.title
        
        if todoData.isCompleted {
            cell.checkSwitch.setOn(true, animated: false)
            cell.descriptionLabel.attributedText = attributes
        } else {
            cell.checkSwitch.setOn(false, animated: false)
            cell.descriptionLabel.text = todoData.description
        }
        
        cell.checkSwitch.tag = indexPath.row
        cell.checkSwitch.addTarget(self, action: #selector(didToggled(_:)), for: .valueChanged)
        
        return cell
    }
    
    @objc func didToggled(_ checkSwitch: UISwitch){
        let dataIndex = checkSwitch.tag
        todoManager.todoList[dataIndex].isCompleted.toggle()
        todoManager.updateList(todoManager.todoList)
        toDoTableView.reloadRows(at: [IndexPath(row: dataIndex, section: 0)], with: .automatic)      // 얘도 고쳐야할 듯
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(Set(todoManager.todoList.map { $0.date })).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let array = Array(Set(todoManager.todoList.map { $0.date })).sorted(by: >)
        let todo = array[section]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: todo)
        return dateString
    }
}

// https://www.youtube.com/watch?v=P5opi9tIuro


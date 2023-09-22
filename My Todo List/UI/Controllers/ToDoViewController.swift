//
//  ToDoViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/03.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoTableView.dataSource = self
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "새로운 할일", message: nil, preferredStyle: .alert)
        let toDoAddAction = UIAlertAction(title: "추가", style: .default) { [weak self] (action) in
            guard let self else { return }
            
            if let title = alert.textFields?[0].text, let description = alert.textFields?[1].text {
                TodoManager.shared.save(title: title, details: description)
                toDoTableView.insertRows(at: [IndexPath(row: TodoManager.shared.loadTodos().count - 1, section: 0)], with: .automatic)
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

extension ToDoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TodoManager.shared.loadTodos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() } // Class 이름
        
        let todoData = TodoManager.shared.loadTodos()[indexPath.row]
        let attributes = NSAttributedString(
            string: todoData.details ?? "",
            attributes: [
                NSAttributedString.Key.strikethroughStyle: 2,
                .strikethroughColor: UIColor.red
            ])
        
        let normalAttributes = NSAttributedString(
            string: todoData.details ?? "")
        
        cell.titleLabel.text = todoData.title
        
        if todoData.isCompleted {
            cell.checkSwitch.setOn(true, animated: false)
            cell.descriptionLabel.attributedText = attributes
        } else {
            cell.checkSwitch.setOn(false, animated: false)
//            cell.descriptionLabel.text = todoData.details
            cell.descriptionLabel.attributedText = normalAttributes
        }
        
        print("\(todoData.details)", todoData.isCompleted)
        
        cell.checkSwitch.tag = indexPath.row
        cell.checkSwitch.addTarget(self, action: #selector(didToggled(_:)), for: .valueChanged)
        return cell
    }
    
    @objc func didToggled(_ checkSwitch: UISwitch){
        let dataIndex = checkSwitch.tag
        TodoManager.shared.loadTodos()[dataIndex].isCompleted.toggle()
        TodoManager.shared.updateList()
        toDoTableView.reloadRows(at: [IndexPath(row: dataIndex, section: 0)], with: .automatic)
    }
}

//
//  ToDoViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/03.
//

import UIKit

class ToDoViewController: UIViewController {
    
    var dataManager: DataManager!

    @IBOutlet weak var toDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        toDoTableView.delegate = self
        toDoTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.toDoTableView.reloadData()
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "새로운 할일", message: nil, preferredStyle: .alert)
        let toDoAddAction = UIAlertAction(title: "추가", style: .default) { (action) in
            if let title = alert.textFields?[0].text, let description = alert.textFields?[1].text {
                self.dataManager.data.append(Data(title: title, description: description, isCompleted: false))
                self.toDoTableView.insertRows(at: [IndexPath(row: self.dataManager.data.count-1, section: 0)], with: .automatic)
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
        return dataManager.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell else { return UITableViewCell() } // Class 이름
        let toDoData = dataManager.data[indexPath.row]
        let attributes = NSAttributedString(
            string: toDoData.description,
            attributes: [
                NSAttributedString.Key.strikethroughStyle: 2,
                .strikethroughColor: UIColor.red
            ])
        
        cell.titleLabel.text = toDoData.title
        
        if toDoData.isCompleted {
            cell.checkSwitch.setOn(true, animated: false)
            cell.descriptionLabel.attributedText = attributes
        } else {
            cell.checkSwitch.setOn(false, animated: false)
            cell.descriptionLabel.text = toDoData.description
        }
        
        cell.checkSwitch.tag = indexPath.row
        cell.checkSwitch.addTarget(self, action: #selector(didToggled(_:)), for: .valueChanged)
        
        return cell
    }
    
    @objc func didToggled(_ checkSwitch: UISwitch){
        let dataIndex = checkSwitch.tag
        dataManager.data[dataIndex].isCompleted.toggle()
        toDoTableView.reloadRows(at: [IndexPath(row: dataIndex, section: 0)], with: .automatic)
    }
    
}

//
//  ToDoViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/03.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    var data: [Data] = [
        Data(title: "알고리즘 풀기", description: "프로그래머스 입문", isCompleted: false),
        Data(title: "TIL 작성하기", description: "Velog", isCompleted: false),
        Data(title: "질문 & 피드백", description: "Gather", isCompleted: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "새로운 할일", message: nil, preferredStyle: .alert)
        let toDoAddAction = UIAlertAction(title: "추가", style: .default) { (action) in
//            cell.title.text = alert.textFields?[0].text     // https://zeddios.tistory.com/249
            if let title = alert.textFields?[0].text, let description = alert.textFields?[1].text {
                self.data.append(Data(title: title, description: description, isCompleted: false)) // self가 왜 필요함?
                self.toDoTableView.reloadData() // 추가하고 나타나기까지 시간 좀 걸림,,
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addTextField { (titleTextField) in // https://zeddios.tistory.com/249
            titleTextField.placeholder = "Title"
        }
        alert.addTextField { (descriptionTextField) in
            descriptionTextField.placeholder = "Description"
        }
        alert.addAction(cancelAction)
        alert.addAction(toDoAddAction)
        
        present(alert, animated: true, completion: nil) // https://zeddios.tistory.com/111
    }
}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
    }
}

extension ToDoViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell // Class 이름

        cell.titleLabel.text = data[indexPath.row].title
        cell.descriptionLabel.text = data[indexPath.row].description
        data[indexPath.row].isCompleted = cell.switchOn.isOn
        
        return cell
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

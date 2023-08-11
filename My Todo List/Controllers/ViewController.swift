//
//  ViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/01.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var dataManager = DataManager()
    
    @IBAction func toDoButton(_ sender: Any) {
        let toDoViewController = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(withIdentifier: "ToDoViewController") as! ToDoViewController
        toDoViewController.dataManager = self.dataManager
        navigationController?.pushViewController(toDoViewController, animated: true)
    }
    
    @IBAction func completedButton(_ sender: Any) {
        let completeViewController = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "CompleteViewController") as! CompleteViewController
        completeViewController.dataManager = self.dataManager
        navigationController?.pushViewController(completeViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

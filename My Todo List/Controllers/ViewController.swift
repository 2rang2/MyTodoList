//
//  ViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/01.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var todoManager = TodoManager ()
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func toDoButton(_ sender: Any) {
        let toDoViewController = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(withIdentifier: "ToDoViewController") as! ToDoViewController
        toDoViewController.todoManager = self.todoManager
        navigationController?.pushViewController(toDoViewController, animated: true)
    }
    
    @IBAction func completedButton(_ sender: Any) {
        let completeViewController = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "CompleteViewController") as! CompleteViewController
        completeViewController.dataManager = self.todoManager
        navigationController?.pushViewController(completeViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageView()
    }
    
    private func setImageView() {
        let imageUrl = "https://spartacodingclub.kr/css/images/scc-og.jpg"
        AF.request(imageUrl)
            .response { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data!)
                    }
                case .failure(let error):
                    print("error", error)
                }
            }
    }
}

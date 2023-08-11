//
//  CompleteViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/08/09.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var dataManager: DataManager!
    
    @IBOutlet weak var completeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        completeTableView.delegate = self
        completeTableView.dataSource = self
//        print(dataManager == nil)
//        print(dataManager.completeList().count)
    }
}

//extension CompleteViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
//}

extension CompleteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.completeList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = completeTableView.dequeueReusableCell(withIdentifier: "CompleteTableViewCell", for: indexPath) as? CompleteTableViewCell else { return UITableViewCell() } // Class 이름
        let completeData = dataManager.completeList()[indexPath.row]

        cell.titleLabel.text = completeData.title
        cell.descriptionLabel.text = completeData.description
        
        return cell
    }
    
}

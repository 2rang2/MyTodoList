//
//  ProfileViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/09/21.
//

import UIKit
import SnapKit

// MVVM 의 View 역할을 하는 Controller

class ProfileViewController: UIViewController {
    
    private var label = UILabel()
    private var nameLabel = UILabel()
    private var ageLabel = UILabel()
    
    private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
   
    func setUpView() {
        view.backgroundColor = .systemBackground
        setUpLabel()
        setUpNameLabel()
        setUpAgeLabel()
    }
    
    func setUpLabel() {
        label.text = "나는요"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.frame.height / 3)
        }
    }
    
    func setUpNameLabel() {
        nameLabel.text = "이름: \(viewModel.userName)"
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(10)
        }
    }
    
    func setUpAgeLabel() {
        ageLabel.text = "나이: \(String(viewModel.userAge))"
        view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
}

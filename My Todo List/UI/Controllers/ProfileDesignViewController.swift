//
//  ProfileDesignViewController.swift
//  My Todo List
//
//  Created by 랑 on 2023/09/20.
//

import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController {
    
    // MARK: - Properties
    
    private let backButton = UIButton()
    private let userNameLabel = UILabel()
    private let menuButton = UIButton()
    private let userPicImageView = UIImageView()
    private let postCountLabel = UILabel()
    private let postLabel = UILabel()
    private let postStackView = UIStackView()
    private let followerCountLabel = UILabel()
    private let followerLabel = UILabel()
    private let followerStackView = UIStackView()
    private let followingCountLabel = UILabel()
    private let followingLabel = UILabel()
    private let followingStackView = UIStackView()
    private let userInfoNameLabel = UILabel()
    private let userInfoBioLabel = UILabel()
    private let userInfoLinkLabel = UILabel()
    private let followButton = UIButton()
    private let messageButton = UIButton()
    private let moreButton = UIButton()
    private let dividerView = UIView()
    private let gridButton = UIButton()
    private let borderView = UIView()
    private let gridCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    private let profileButton = UIButton()
    private let imageList: [UIImage?] = [UIImage(named: "picture 0"), UIImage(named: "picture 1"), UIImage(named: "picture 2"), UIImage(named: "picture 3"), UIImage(named: "picture 4"), UIImage(named: "picture 5"), UIImage(named: "picture 6"), UIImage(named: "picture 0"), UIImage(named: "picture 1"), UIImage(named: "picture 2"), UIImage(named: "picture 3"), UIImage(named: "picture 4"), UIImage(named: "picture 5"), UIImage(named: "picture 6")]
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        // Bottom border 추가 > layer는 다른 layout이 다 그려진 다음에(모든 요소들의 frame이 결정이 된 후에,,,,) 추가해야함 (frame 기준으로 생성되기 때무네..)
    //        let border = CALayer()
    //        border.borderColor = UIColor.black.cgColor  // core graphics, layer는 autolayout이랑 상관없이 돌아감
    //        border.frame = CGRect(x: 0, y: gridButton.bounds.size.height - 1, width: gridButton.frame.size.width, height: 1)
    //        border.borderWidth = 1
    //        print(gridButton.frame)
    //        gridButton.layer.addSublayer(border)
    //    }
    
}

private extension ProfileDesignViewController {
    
    // MARK: - UI
    
    func setUpView() {
        view.backgroundColor = .systemBackground
        setUpBackButton()
        setUpUserNameLabel()
        setUpMenuButton()
        setUpUserPicImageView()
        setUpPostStackView()
        setUpFollowerStackView()
        setUpFollowingStackView()
        setUpUserFollowInfoStackView()
        setUpUserInfoNameLabel()
        setUpUserInfoBioLabel()
        setUpUserInfoLinkLabel()
        setUpFollowButton()
        setUpMessageButton()
        setUpMoreButton()
        setUpMiddleBarStackView()
        setUpDividerView()
        setUpGridButton()
        setUpBorderView()
        setUpGridCollectionView()
        setUpProfileButton()
    }
    
    func setUpBackButton() {
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func setUpUserNameLabel() {
        userNameLabel.text = "nabaecamp"
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
    }
    
    func setUpMenuButton() {
        menuButton.setImage(UIImage(named: "Menu"), for: .normal)
        menuButton.tintColor = .black
        view.addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func setUpUserPicImageView() {
        userPicImageView.image = UIImage(named: "룬")
        userPicImageView.contentMode = .scaleAspectFill
        userPicImageView.layer.cornerRadius = 50
        userPicImageView.clipsToBounds = true
        view.addSubview(userPicImageView)
        userPicImageView.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(14)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    func setUpPostStackView() {
        postCountLabel.text = "7"
        postCountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        postLabel.text = "post"
        postLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        postStackView.axis = .vertical
        postStackView.alignment = .center
        postStackView.spacing = 3
        postStackView.addArrangedSubview(postCountLabel)
        postStackView.addArrangedSubview(postLabel)

    }
    
    func setUpFollowerStackView() {
        followerCountLabel.text = "0"
        followerCountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        followerLabel.text = "follower"
        followerLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        followerStackView.axis = .vertical
        followerStackView.alignment = .center
        followerStackView.spacing = 3
        followerStackView.addArrangedSubview(followerCountLabel)
        followerStackView.addArrangedSubview(followerLabel)
    }
    
    func setUpFollowingStackView() {
        followingCountLabel.text = "0"
        followingCountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        followingLabel.text = "following"
        followingLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        followingStackView.axis = .vertical
        followingStackView.alignment = .center
        followingStackView.spacing = 3
        followingStackView.addArrangedSubview(followingCountLabel)
        followingStackView.addArrangedSubview(followingLabel)
    }
    
    func setUpUserFollowInfoStackView() {
        let userFollowInfoStackView = UIStackView()
        userFollowInfoStackView.axis = .horizontal
        userFollowInfoStackView.alignment = .center
        userFollowInfoStackView.spacing = 10         //label 안의 글자가 꽉 찬 경우 spacing = 0 으로 두면 spacing 없이 달라붙은 형태로 3등분 됨
        userFollowInfoStackView.distribution = .fillEqually
        userFollowInfoStackView.addArrangedSubview(postStackView)
        userFollowInfoStackView.addArrangedSubview(followerStackView)
        userFollowInfoStackView.addArrangedSubview(followingStackView)
        view.addSubview(userFollowInfoStackView)
        userFollowInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(userPicImageView.snp.top).offset(30)
            make.left.equalTo(userPicImageView.snp.right).offset(20)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-28)
        }
    }
    
    func setUpUserInfoNameLabel() {
        userInfoNameLabel.text = "르탄이"
        userInfoNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.addSubview(userInfoNameLabel)
        userInfoNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userPicImageView.snp.bottom).offset(14)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func setUpUserInfoBioLabel() {
        userInfoBioLabel.text = "iOS Developer 🍎"
        userInfoBioLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        view.addSubview(userInfoBioLabel)
        userInfoBioLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoNameLabel.snp.bottom).offset(3)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func setUpUserInfoLinkLabel() {
        userInfoLinkLabel.text = "spartacodingclub.kr"
        userInfoLinkLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        userInfoLinkLabel.textColor = .systemBlue
        view.addSubview(userInfoLinkLabel)
        userInfoLinkLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoBioLabel.snp.bottom).offset(3)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
    }
    
    func setUpFollowButton() {
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.white, for: .normal)
        followButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        followButton.layer.cornerRadius = 4
        followButton.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1)
    }
    
    func setUpMessageButton() {
        messageButton.setTitle("Message", for: .normal)
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        messageButton.layer.borderWidth = 1
        messageButton.layer.borderColor = UIColor.systemGray4.cgColor
        messageButton.layer.cornerRadius = 4
    }
    
    func setUpMoreButton() {
        moreButton.setImage(UIImage(named: "More"), for: .normal)
        moreButton.layer.borderWidth = 1
        moreButton.layer.borderColor = UIColor.systemGray4.cgColor
        moreButton.layer.cornerRadius = 4
        view.addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(userInfoLinkLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    func setUpMiddleBarStackView() {
        let middleBarStackView = UIStackView()
        middleBarStackView.axis = .horizontal
        middleBarStackView.alignment = .center
        middleBarStackView.distribution = .fillEqually
        middleBarStackView.spacing = 8
        middleBarStackView.addArrangedSubview(followButton)
        middleBarStackView.addArrangedSubview(messageButton)
        view.addSubview(middleBarStackView)
        middleBarStackView.snp.makeConstraints { make in
            make.top.equalTo(userInfoLinkLabel.snp.bottom).offset(10)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.right.equalTo(moreButton.snp.left).offset(-8)
            make.height.equalTo(30)
        }
    }
    
    func setUpDividerView() {
        dividerView.backgroundColor = UIColor.systemGray6
        view.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(followButton.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func setUpGridButton() {
        gridButton.setImage(UIImage(named: "Grid"), for: .normal)
        view.addSubview(gridButton)
        gridButton.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(8)
            make.width.equalTo(view.frame.width / 3)
            make.height.equalTo(30)
        }
    }
    
    func setUpBorderView() {
        borderView.backgroundColor = UIColor.black
        view.addSubview(borderView)
        borderView.snp.makeConstraints { make in
            make.top.equalTo(gridButton.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.width.equalTo((view.frame.width - 4) / 3)
            make.height.equalTo(1)
        }
    }
    
    func setUpGridCollectionView() {
        gridCollectionView.dataSource = self
        gridCollectionView.delegate = self
        gridCollectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: GridCollectionViewCell.identifier)
        view.addSubview(gridCollectionView)
        gridCollectionView.snp.makeConstraints { make in
            make.top.equalTo(gridButton.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(gridCollectionView.snp.width)
        }
    }
    
    func setUpProfileButton() {
        profileButton.setImage(UIImage(systemName: "person.fill"), for: .normal)
        profileButton.contentMode = .scaleAspectFill
        profileButton.tintColor = .black
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        view.addSubview(profileButton)
        profileButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
        }
    }
    
    // MARK: - Helpers
    
    @objc func didTapBackButton() {
        print("you tapped backButton!")
        dismiss(animated: true)
    }
    
    @objc func didTapProfileButton() {
        print("you tapped profileButton!")
        let user = User(name: "르탄이", age: 10)
        let userViewModel = UserViewModel(user: user)
        let profileView = ProfileViewController(viewModel: userViewModel)
        present(profileView, animated: true)
    }
}

extension ProfileDesignViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
        
        cell.imageView.image = imageList[indexPath.row]
        
        return cell
    }
}

extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.frame.width - 4) / 3 // (view.frame.width / 3) - 2 > 3등분 후에 옆 간격(2)만큼 빼주기
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    // 셀 간 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    //셀 간 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}


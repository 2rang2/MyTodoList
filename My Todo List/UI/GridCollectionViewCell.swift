//
//  GridCollectionViewCell.swift
//  My Todo List
//
//  Created by 랑 on 2023/09/20.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    static let identifier = "GridCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true  //이미지 뷰 셀 경계에 맞게 설정
        return imageView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalToSuperview()
        }
    }
}

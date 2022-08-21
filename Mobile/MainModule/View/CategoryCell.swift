//
//  CategoryCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseId = "CategoryCell"
    
    lazy var ellipseView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FFFFFF")
        return imageView
    }()
    
    lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 12)
        label.textColor = UIColor(hexString: "010035")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ellipseView.layer.cornerRadius = 35
        
        addSubview(ellipseView)
        addSubview(categoryImageView)
        addSubview(categoryLabel)
        
        ellipseView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(71)
            make.top.equalToSuperview()
        }
        
        categoryImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(40)
            make.width.equalTo(29)
            make.height.equalTo(31)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ellipseView.snp.bottom).inset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

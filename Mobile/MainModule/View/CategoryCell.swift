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
        imageView.backgroundColor = .systemYellow
        return imageView
    }()
    
    lazy var categoryImage: UIImage = {
        let image = UIImage()
        return image
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ellipseView.layer.cornerRadius = 35
        
        addSubview(ellipseView)
        addSubview(categoryLabel)
        
        ellipseView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(71)
            make.top.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ellipseView.snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

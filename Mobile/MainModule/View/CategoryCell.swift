//
//  CategoryCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseId = "CategoryCell"
    
    lazy var categoryLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

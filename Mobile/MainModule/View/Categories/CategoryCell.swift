//
//  CategoryCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit

extension UICollectionViewCell {
    static var reuseId: String {
        return String(describing: Self.self)
    }
}

class CategoryCell: UICollectionViewCell {
    lazy var ellipseView = createEllipseView()
    lazy var categoryImageView = createCategoryImageView()
    lazy var categoryLabel = createCategoryLabel()
    
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
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension CategoryCell {
    private func createEllipseView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FFFFFF")
        return imageView
    }
    
    private func createCategoryImageView() -> UIImageView {
        let imageView = UIImageView()
        return imageView
    }
    
    private func createCategoryLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 12)
        label.textColor = UIColor(hexString: "010035")
        return label
    }
}

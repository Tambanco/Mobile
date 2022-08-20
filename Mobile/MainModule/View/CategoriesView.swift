//
//  CategoriesView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit
import SnapKit

class CategoriesView: UIView {
    lazy var categoriesCardView: UIView! = {
        let view = UIView()
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var header: UILabel! = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 17)
        label.textColor = UIColor(hexString: "010035")
        label.text = "Select Category"
        return label
    }()
    
    lazy var viewAllButton: UIButton! = {
        var config = UIButton.Configuration.borderless()
        let button = UIButton(configuration: config)
        button.setTitle("view all", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(categoriesCardView)
        categoriesCardView.addSubview(header)
        categoriesCardView.addSubview(viewAllButton)
        
        categoriesCardView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        header.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.top.equalTo(17)
        }
        
        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalTo(-33)
            make.top.equalTo(108)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

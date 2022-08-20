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
            make.height.equalTo(200)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

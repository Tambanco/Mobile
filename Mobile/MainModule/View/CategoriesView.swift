//
//  CategoriesView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit

class CategoriesView: UIView {
    lazy var fiatCardView: UIView! = {
        let view = UIView()
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var fiatHeader: UILabel! = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 17)
        label.text = "Select Category"
        return label
    }()
    
    lazy var cancelButton: UIButton! = {
        var config = UIButton.Configuration.borderless()
        let button = UIButton(configuration: config)
        button.setTitle("view all", for: .normal)
        return button
    }()
    
    

}

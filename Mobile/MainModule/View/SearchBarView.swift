//
//  SearchBarView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 21.08.2022.
//

import UIKit

class SearchBarView: UIView {
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchTextField.font = UIFont(name: "MarkPro", size: 15)
        searchBar.searchTextField.backgroundColor = .clear
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        let imageV = textFieldInsideSearchBar?.leftView as! UIImageView
        imageV.image = imageV.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imageV.tintColor = UIColor(hexString: "FF6E4E")
        return searchBar
    }()
    
    lazy var scanQRButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(hexString: "FF6E4E")
        config.cornerStyle = .capsule
        let button = UIButton(configuration: config)
        return button
    }()
    
    lazy var qrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "QR")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(searchBar)
        addSubview(scanQRButton)
        scanQRButton.addSubview(qrImageView)
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(32)
            make.centerY.equalToSuperview()
            make.height.equalTo(34)
            make.width.equalTo(300)
        }
        
        scanQRButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchBar.snp.trailing).inset(-5)
            make.width.height.equalTo(34)
        }
        
        qrImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(14.78)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

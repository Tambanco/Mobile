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
        return searchBar
    }()
    
    lazy var scanQR: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = UIColor(hexString: "FF6E4E")
        config.image = UIImage(named: "QR")
        let button = UIButton(configuration: config)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(searchBar)
        addSubview(scanQR)
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        scanQR.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(searchBar.snp.trailing).inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

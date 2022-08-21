//
//  HotSalesCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 21.08.2022.
//

import UIKit

class HotSalesCell: UICollectionViewCell {
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FFFFFF")
        return imageView
    }()
    
    lazy var newFlagView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FF6E4E")
        return imageView
    }()
    
    lazy var newLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 10)
        label.textColor = UIColor(hexString: "010035")
        return label
    }()
    
    lazy var brandName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 10)
        label.textColor = UIColor(hexString: "010035")
        return label
    }()
    
    lazy var brandDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 10)
        label.textColor = UIColor(hexString: "010035")
        return label
    }()
    
    lazy var buyButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(hexString: "FF6E4E")
        config.cornerStyle = .capsule
        config.title = "Buy now!"
        config.attributedTitle?.font = UIFont(name: "SFPro Display", size: 11)
        let button = UIButton(configuration: config)
        return button
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        hotSalesCardView.layer.cornerRadius = 30
        
        addSubview(bgImageView)
        addSubview(newFlagView)
        newFlagView.addSubview(newLabel)
        addSubview(brandName)
        addSubview(brandDescription)
        addSubview(buyButton)
        
        
        bgImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        newFlagView.snp.makeConstraints { make in
            make.leading.equalTo(40)
            make.top.equalTo(23)
            make.width.height.equalTo(27)
        }
        
        newLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        brandName.snp.makeConstraints { make in
            make.leading.equalTo(40)
            make.top.equalTo(68)
        }
        
        brandDescription.snp.makeConstraints { make in
            make.leading.equalTo(40)
            make.top.equalTo(103)
        }
        
        buyButton.snp.makeConstraints { make in
            make.leading.equalTo(40)
            make.top.equalTo(142)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

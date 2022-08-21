//
//  HotSalesCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 21.08.2022.
//

import UIKit

class HotSalesCell: UICollectionViewCell {
    private lazy var bgImageView: UIImageView = createbgImageView()
    private lazy var newFlagView = createNewFlagView()
    private lazy var newLabel = createNewLabel()
    private lazy var brandNameLabel = createBrandNameLabel()
    private lazy var brandDescription = createBrandDescriptionLabel()
    private lazy var buyButton: UIButton = createBuyButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bgImageView)
        addSubview(newFlagView)
        newFlagView.addSubview(newLabel)
        addSubview(brandNameLabel)
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
        
        brandNameLabel.snp.makeConstraints { make in
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

fileprivate extension HotSalesCell {
    private func createbgImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FFFFFF")
        return imageView
    }
    
    private func createNewFlagView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FF6E4E")
        return imageView
    }
    
    private func createNewLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 10)
        label.textColor = UIColor(hexString: "010035")
        return label
    }
    
    private func createBrandNameLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 10)
        label.textColor = UIColor(hexString: "010035")
        return label
    }
    
    private func createBrandDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 10)
        label.textColor = UIColor(hexString: "010035")
        return label
    }
    
    private func createBuyButton() -> UIButton {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(hexString: "FF6E4E")
        config.cornerStyle = .capsule
        config.title = "Buy now!"
        config.attributedTitle?.font = UIFont(name: "SFPro Display", size: 11)
        let button = UIButton(configuration: config)
        return button
    }
}

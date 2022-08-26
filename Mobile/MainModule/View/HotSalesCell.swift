//
//  HotSalesCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 21.08.2022.
//

import UIKit

class HotSalesCell: UICollectionViewCell {
    lazy var bgImageView: UIImageView = createbgImageView()
    lazy var newFlagView = createNewFlagView()
    private lazy var newLabel = createNewLabel()
    lazy var brandNameLabel = createBrandNameLabel()
    lazy var brandDescription = createBrandDescriptionLabel()
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
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
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
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension HotSalesCell {
    private func createbgImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(hexString: "FFFFFF")
        return imageView
    }
    
    private func createNewFlagView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hexString: "FF6E4E")
        imageView.layer.cornerRadius = 13.5
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
        label.font = UIFont(name: "SFPro-Display-Bold", size: 25)
        label.textColor = UIColor(hexString: "FFFFFF")
        return label
    }
    
    private func createBrandDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SFPro Display", size: 11)
        label.textColor = UIColor(hexString: "FFFFFF")
        return label
    }
    
    private func createBuyButton() -> UIButton {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(hexString: "FFFFFF")
        config.title = "Buy now!"
        config.attributedTitle?.font = UIFont(name: "SFPro Display", size: 11)
        config.attributedTitle?.foregroundColor = UIColor(hexString: "#010035")
        let button = UIButton(configuration: config)
        return button
    }
}

//
//  BestSellerCell.swift
//  Mobile
//
//  Created by tambanco 🥳 on 29.08.2022.
//

import UIKit
import SnapKit

class BestSellerCell: UICollectionViewCell {
    lazy var bestSellerImageView: UIImageView = createBestSellerImageView()
    private lazy var likeButton: UIButton = createLikeButton()
    lazy var currentPrice = createCurrentPriceLabel()
    lazy var oldPrice = createOldPriceLabel()
    lazy var brandNameLabel = createBrandDescriptionLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bestSellerImageView)
        addSubview(likeButton)
        addSubview(currentPrice)
        addSubview(oldPrice)
        addSubview(brandNameLabel)
        
        bestSellerImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints { make in
            make.trailing.equalTo(12)
            make.top.equalTo(12)
            make.width.height.equalTo(25)
        }
    
        currentPrice.snp.makeConstraints { make in
            make.leading.equalTo(26)
            make.bottom.equalTo(68)
        }
        
        oldPrice.snp.makeConstraints { make in
            make.leading.equalTo(currentPrice.snp.trailing).inset(20)
            make.centerY.equalTo(currentPrice)
        }
        
        brandNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(26)
            make.bottom.equalTo(20)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension BestSellerCell {
    private func createBestSellerImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(hexString: "FFFFFF")
        return imageView
    }
    
    private func createLikeButton() -> UIButton {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(hexString: "FFFFFF")
        config.image = UIImage(named: "heart")
        let button = UIButton(configuration: config)
        return button
    }
    
    private func createCurrentPriceLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Mark Pro Bold", size: 20)
        label.textColor = UIColor(hexString: "010035")
        return label
    }
    
    private func createOldPriceLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Mark Pro", size: 13)
        label.textColor = UIColor(hexString: "CCCCCC")
        return label
    }
    
    private func createBrandDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Mark Pro", size: 13)
        label.textColor = UIColor(hexString: "010035")
        return label
    }
}

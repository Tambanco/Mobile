//
//  CollectionReusableView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 23.08.2022.
//

import UIKit

class SectionHeaders: UICollectionReusableView {
    lazy var headerLabel = createHeaderLabel()
    lazy var headerButton = createViewAllButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerLabel)
        addSubview(headerButton)
        
        headerLabel.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.centerY.equalToSuperview()
        }
        
        headerButton.snp.makeConstraints { make in
            make.trailing.equalTo(-23)
            make.centerY.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension SectionHeaders {
    private func createHeaderLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textColor = UIColor(hexString: "010035")
        label.text = "Select Category"
        return label
    }
    
    private func createViewAllButton() -> UIButton {
        var config = UIButton.Configuration.plain()
        config.title = "view all"
        config.attributedTitle?.font = UIFont(name: "MarkPro", size: 15)
        config.baseForegroundColor = UIColor(hexString: "FF6E4E")
        let button = UIButton(configuration: config)
        return button
    }
}

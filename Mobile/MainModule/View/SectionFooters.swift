//
//  SectionFooters.swift
//  Mobile
//
//  Created by tambanco 🥳 on 25.08.2022.
//

import UIKit

class SectionFooters: UICollectionReusableView {
    lazy var footerLabel = createFooterLabel()
    private lazy var footerButton = createQRButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(footerLabel)
        addSubview(footerButton)
        
        footerLabel.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.centerY.equalToSuperview()
        }
        
        footerButton.snp.makeConstraints { make in
            make.trailing.equalTo(-33)
            make.centerY.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension SectionFooters {
    private func createFooterLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.textColor = UIColor(hexString: "010035")
        label.text = "Select Category"
        return label
    }
    
    private func createQRButton() -> UIButton {
        var config = UIButton.Configuration.plain()
        config.title = "view all"
        config.attributedTitle?.font = UIFont(name: "MarkPro", size: 15)
        config.baseForegroundColor = UIColor(hexString: "FF6E4E")
        let button = UIButton(configuration: config)
        return button
    }
}

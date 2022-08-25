//
//  HotSalesView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 21.08.2022.
//

import UIKit

class HotSalesView: UIView {
    private lazy var hotSalesCollectionView = createHotSalesCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(hotSalesCollectionView)
        
        hotSalesCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension HotSalesView {
    private func createHotSalesCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        hotSalesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        hotSalesCollectionView.backgroundColor = .clear
        
        return hotSalesCollectionView
    }
}

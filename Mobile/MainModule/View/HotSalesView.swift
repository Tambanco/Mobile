//
//  HotSalesView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 21.08.2022.
//

import UIKit

class HotSalesView: UIView {
    private lazy var hotSalesItems: [HotSalesCell] = []
    private lazy var hotSalesCollectionView = createHotSalesCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hotSalesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        hotSalesCollectionView.delegate = self
        hotSalesCollectionView.dataSource = self
        
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

extension HotSalesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotSalesItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCell.reuseId, for: indexPath) as! HotSalesCell
        cell.bgImageView.image = UIImage(named: "testImage")
        cell.newFlagView.backgroundColor = .systemGreen
        cell.brandNameLabel.text = "Iphone 12"
        cell.brandDescription.text = "Súper. Mega. Rápido."
        return cell
    }
}

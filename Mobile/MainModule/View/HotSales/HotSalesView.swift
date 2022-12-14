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
        
        hotSalesCollectionView.register(HotSalesCell.self, forCellWithReuseIdentifier: HotSalesCell.reuseId)
        hotSalesCollectionView.delegate = self
        hotSalesCollectionView.dataSource = self
        
        addSubview(hotSalesCollectionView)
        
        hotSalesCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
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
        
        return hotSalesCollectionView
    }
}

extension HotSalesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotSalesCell.reuseId, for: indexPath) as! HotSalesCell
        cell.hotSalesImageView.image = UIImage(named: "testImage")
        cell.brandNameLabel.text = "IPhone 12"
        cell.brandDescription.text = "Súper. Mega. Rápido."
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
    }
}

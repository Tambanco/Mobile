//
//  BestSellerView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 29.08.2022.
//

import Foundation
import UIKit

class BestSellerView: UIView {
    private lazy var bestSellerCollectionView = createBestSellerCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bestSellerCollectionView.register(BestSellerCell.self, forCellWithReuseIdentifier: BestSellerCell.reuseId)
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.backgroundColor = .systemGreen
        
        addSubview(bestSellerCollectionView)
        
        bestSellerCollectionView.snp.makeConstraints { make in
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

fileprivate extension BestSellerView {
    private func createBestSellerCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        bestSellerCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        return bestSellerCollectionView
    }
}

extension BestSellerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestSellerCell.reuseId, for: indexPath) as! BestSellerCell
        cell.bestSellerImageView.image = UIImage(named: "BestSellerImage")
        cell.currentPrice.text = "$1500"
        cell.oldPrice.text = "$1047"
        cell.brandNameLabel.text = "Samsung Galaxy s20 Ultra"
        cell.backgroundColor = .systemBlue
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 230)
    }
}

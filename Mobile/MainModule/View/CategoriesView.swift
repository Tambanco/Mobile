//  CategoriesView.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit
import SnapKit

class CategoriesView: UIView {
    
    let categories = Categories().categories
    
    private lazy var headerLabel = createHeaderLabel()
    private lazy var viewAllButton = createViewAllButton()
    private lazy var categoriesCollectionView = createCategoriesCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        addSubview(headerLabel)
        addSubview(viewAllButton)
        addSubview(categoriesCollectionView)
        
        headerLabel.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.top.equalTo(17)
        }

        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalTo(-33)
            make.top.equalTo(17)
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(170)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension CategoriesView {
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
    
    private func createCategoriesCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 71, height: 100)
        layout.scrollDirection = .horizontal
        
        categoriesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        categoriesCollectionView.backgroundColor = .clear
        
        return categoriesCollectionView
    }
}


extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        cell.categoryLabel.text = categories[indexPath.row]
        cell.categoryImageView.image = UIImage(named: "\(categories[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else {
            return
        }
        cell.ellipseView.backgroundColor = UIColor(hexString: "FF6E4E")
        cell.categoryLabel.textColor = UIColor(hexString: "FF6E4E")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else {
            return
        }
        cell.ellipseView.backgroundColor = UIColor(hexString: "FFFFFF")
        cell.categoryLabel.textColor = UIColor(hexString: "010035")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 77, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 27, bottom: 5, right: 5)
    }
}

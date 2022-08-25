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
    private lazy var searchBar = createSearchBar()
    private lazy var scanQRButton = createScanQRButton()
    private lazy var qrImageView = createQRImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        
        searchBar.searchTextField.clipsToBounds = true
        searchBar.searchTextField.layer.cornerRadius = 17
        
        addSubview(headerLabel)
        addSubview(viewAllButton)
        addSubview(categoriesCollectionView)
        addSubview(searchBar)
        addSubview(scanQRButton)
        scanQRButton.addSubview(qrImageView)
        
        headerLabel.snp.makeConstraints { make in
            make.leading.equalTo(17)
            make.top.equalTo(17)
        }

        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalTo(-23)
            make.top.equalTo(17)
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(130)
        }
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(categoriesCollectionView.snp.bottom)
            make.height.equalTo(36)
            make.width.equalTo(320)
        }
        
        scanQRButton.snp.makeConstraints { make in
            make.leading.equalTo(searchBar.snp.trailing).inset(-5)
            make.centerY.equalTo(searchBar)
            make.width.height.equalTo(34)
        }
        
        qrImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(14.78)
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
        layout.scrollDirection = .horizontal
        
        categoriesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        categoriesCollectionView.backgroundColor = .clear
        
        return categoriesCollectionView
    }
    
    private func createSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = "   Search"
        searchBar.setPositionAdjustment(UIOffset(horizontal: 20, vertical: 0), for: .search)
        searchBar.searchTextField.font = UIFont(name: "MarkPro", size: 15)
        searchBar.searchTextField.backgroundColor = UIColor(hexString: "FFFFFF")
        searchBar.backgroundImage = UIImage()
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        let imageV = textFieldInsideSearchBar?.leftView as! UIImageView
        imageV.image = imageV.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imageV.tintColor = UIColor(hexString: "FF6E4E")
        return searchBar
    }
    
    private func createScanQRButton() -> UIButton {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor(hexString: "FF6E4E")
        config.cornerStyle = .capsule
        let button = UIButton(configuration: config)
        return button
    }
    
    private func createQRImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "QR")
        return imageView
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
        return UIEdgeInsets(top: 0, left: 27, bottom: 5, right: 5)
    }
}

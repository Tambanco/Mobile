//
//  MainViewController.swift
//  Mobile
//
//  Created tambanco 🥳 on 20.08.2022.
//
//  Template generated by Tambanco
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol!
    var categoriesView: CategoriesView!
    var categoriesCollectionView: UICollectionView!
    var searchBarView: SearchBarView!
    var layout: UICollectionViewFlowLayout!
    var categories: [String] = ["Phones", "Computer", "Health", "Books", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupCategoriesView()
        setupCollectionView()
        setupSearchBarView()
    }
    
    private func setupSearchBarView() {
        searchBarView = SearchBarView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        searchBarView.backgroundColor = .systemRed
        view.addSubview(searchBarView)
        
        searchBarView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(categoriesView.snp.bottom)
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    private func setupMainView() {
        self.view.backgroundColor = UIColor(hexString: "#E5E5E5")
    }
    
    private func  setupCategoriesView() {
        categoriesView = CategoriesView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.addSubview(categoriesView)
        
        categoriesView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    func setupCollectionView() {
        layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        categoriesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        categoriesCollectionView.allowsMultipleSelection = false
        categoriesCollectionView.allowsSelection = true
        categoriesCollectionView.backgroundColor = .clear
        
        categoriesView.addSubview(categoriesCollectionView)
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(54)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
}

// MARK: - CollectionView methods
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
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
}

// MARK: - Binding
extension MainViewController: MainViewProtocol {
    
}

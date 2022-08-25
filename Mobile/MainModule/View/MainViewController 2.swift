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
    private var presenter: MainPresenterProtocol!
    private lazy var mainCollectionView = createCollectionView()
    private lazy var categoriesCollectionView = createCategoriesCollectionView()
    private var searchBarView: SearchBarView!
    private var categoriesView: CategoriesView!
    private var sections = ["Hot sales", "Best Sellers"]
    private var buttonText = ["view all", "see more", "see more"]
    private var categories = ["Phones", "Computer", "Health", "Books", "Other"]
    
    private func createCollectionView() -> UICollectionView {
        fatalError()
    }
    
    private func createCategoriesCollectionView() -> UICollectionView {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupCategoriesView()
        setupMainCollectionView()
        setupCategoriesCollectionView()
    }
    
    private func setupMainView() {
        self.view.backgroundColor = UIColor(hexString: "#E5E5E5")
    }
    
    private func setupCategoriesView() {
        categoriesView = CategoriesView(frame: CGRect.zero)
        
        view.addSubview(categoriesView)
        
        categoriesView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
//    private func setupSearchBarView() {
//        searchBarView = SearchBarView(frame: CGRect.zero)
//        view.addSubview(searchBarView)
//        
//        searchBarView.searchBar.searchTextField.clipsToBounds = true
//        searchBarView.searchBar.searchTextField.layer.cornerRadius = 17
//        
//        searchBarView.snp.makeConstraints { make in
//            make.leading.equalToSuperview()
//            make.top.equalTo(categoriesView.snp.bottom)
//            make.trailing.equalToSuperview()
//            make.height.equalTo(60)
//        }
//    }
    
    private func setupCategoriesCollectionView() {
        
    }
    
    private func setupMainCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .vertical
        mainCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mainCollectionView.backgroundColor = .systemBlue
        
        self.view.addSubview(mainCollectionView)
        
        mainCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(categoriesView.snp.bottom)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        mainCollectionView.register(SectionHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        mainCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }
}

// MARK: - CollectionView methods
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        cell.categoryLabel.text = categories[indexPath.row]
        cell.categoryImageView.image = UIImage(named: "\(categories[indexPath.row])")
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else {
//            return
//        }
//        cell.ellipseView.backgroundColor = UIColor(hexString: "FF6E4E")
//        cell.categoryLabel.textColor = UIColor(hexString: "FF6E4E")
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else {
//            return
//        }
//        cell.ellipseView.backgroundColor = UIColor(hexString: "FFFFFF")
//        cell.categoryLabel.textColor = UIColor(hexString: "010035")
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeaders
            sectionHeader.headerLabel.text = sections[indexPath.row]
            sectionHeader.backgroundColor = .systemOrange
            return sectionHeader
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
}

// MARK: - Binding
extension MainViewController: MainViewProtocol {
    
}

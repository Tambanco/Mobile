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
    private var categoriesView: CategoriesView!
    //    private lazy var categoriesCollectionView = createCollectionView()
    private var searchBarView: SearchBarView!
    private lazy var mainCollectionReusableView = createCollectionView()
    //    private var hotSalesView: HotSalesView!
    //    private var hotSalesCollectionView: UICollectionView!
    private var categories: [String] = ["Phones", "Computer", "Health", "Books", "Other"]
    
    private func createCollectionView() -> UICollectionView {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupMainCollectionReusableView()
        //        setupCategoriesView()
        //        setupSearchBarView()
        //        setupHotSalesView()
        //        setupHotSalesCollectionView()
    }
    
    private func setupMainCollectionReusableView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.scrollDirection = .horizontal
        mainCollectionReusableView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        mainCollectionReusableView.backgroundColor = .green
        
        mainCollectionReusableView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        mainCollectionReusableView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        mainCollectionReusableView.dataSource = self
        mainCollectionReusableView.delegate = self
        
        view.addSubview(mainCollectionReusableView)
        
        mainCollectionReusableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview()
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
    }
    
    //    private func setupHotSalesCollectionView() {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    //        layout.itemSize = CGSize(width: 90, height: 90)
    //        layout.scrollDirection = .horizontal
    //        hotSalesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    //        hotSalesCollectionView.allowsMultipleSelection = false
    //        hotSalesCollectionView.allowsSelection = true
    //        hotSalesCollectionView.backgroundColor = .clear
    //
    //        hotSalesView.addSubview(hotSalesCollectionView)
    //
    //        hotSalesCollectionView.snp.makeConstraints { make in
    //            make.leading.equalToSuperview()
    //            make.top.equalTo(10)
    //            make.trailing.equalToSuperview()
    //            make.bottom.equalToSuperview()
    //        }
    //
    //        hotSalesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
    //
    //        hotSalesCollectionView.dataSource = self
    //        hotSalesCollectionView.delegate = self
    //    }
    
    //    private func setupHotSalesView() {
    //        hotSalesView = HotSalesView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    //        view.addSubview(hotSalesView)
    //        hotSalesView.backgroundColor = .systemOrange
    //
    //        hotSalesView.snp.makeConstraints { make in
    //            make.leading.equalToSuperview()
    //            make.top.equalTo(searchBarView.snp.bottom)
    //            make.trailing.equalToSuperview()
    //            make.height.equalTo(200)
    //        }
    //    }
    
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
    
    private func setupMainView() {
        self.view.backgroundColor = UIColor(hexString: "#E5E5E5")
    }
    
    //    private func setupCategoriesView() {
    //        categoriesView = CategoriesView(frame: CGRect.zero)
    //        view.addSubview(categoriesView)
    //
    //        categoriesView.snp.makeConstraints { make in
    //            make.leading.equalToSuperview()
    //            make.top.equalTo(self.view.safeAreaLayoutGuide)
    //            make.trailing.equalToSuperview()
    //            make.height.equalTo(200)
    //        }
    //    }
    
    //    private func setupCollectionView() {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    //        layout.itemSize = CGSize(width: 90, height: 90)
    //        layout.scrollDirection = .horizontal
    //        categoriesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    //        categoriesCollectionView.allowsMultipleSelection = false
    //        categoriesCollectionView.allowsSelection = true
    //        categoriesCollectionView.backgroundColor = .clear
    //
    //        categoriesView.addSubview(categoriesCollectionView)
    //
    //        categoriesCollectionView.snp.makeConstraints { make in
    //            make.leading.equalToSuperview()
    //            make.top.equalTo(54)
    //            make.trailing.equalToSuperview()
    //            make.bottom.equalToSuperview()
    //        }
    //
    //        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
    //
    //        categoriesCollectionView.dataSource = self
    //        categoriesCollectionView.delegate = self
    //    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        cell.categoryLabel.text = categories[indexPath.row]
        cell.categoryImageView.image = UIImage(named: "\(categories[indexPath.row])")
        cell.backgroundColor = .systemBlue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            sectionHeader.label.text = "TRENDING"
            sectionHeader.backgroundColor = .systemOrange
            return sectionHeader
        } else { //No footer in this case but can add option for that
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
}

//// MARK: - CollectionView methods
//extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 3
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return categories.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
//        cell.categoryLabel.text = categories[indexPath.row]
//        cell.categoryImageView.image = UIImage(named: "\(categories[indexPath.row])")
//
//        return cell
//    }
//
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
//}

// MARK: - Binding
extension MainViewController: MainViewProtocol {
    
}

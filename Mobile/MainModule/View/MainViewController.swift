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
    private lazy var mainCollectionView = createMainCollectionView()
    private var categoriesView: CategoriesView!
    private var hotSalesView: HotSalesView!
    private var sections = ["Hot sales", "Best Sellers"]
    private var buttonText = ["view all", "see more"]
    
    private var customCollectionView: [UIView] = []
    
    private func createMainCollectionView() -> UICollectionView {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupCategoriesView()
        setupMainCollectionView()
        setupHotSalesView()
        
    }
    
    private func setupMainView() {
        self.view.backgroundColor = UIColor(hexString: "#E5E5E5")
    }
    
    private func setupHotSalesView() {
        hotSalesView = HotSalesView(frame: CGRect(x: 0, y: 0, width: 360, height: 200))
        hotSalesView.layer.cornerRadius = 15
        hotSalesView.layer.masksToBounds = true
        customCollectionView.append(hotSalesView)
    }
    
    private func setupCategoriesView() {
        categoriesView = CategoriesView(frame: CGRect.zero)
        
        self.view.addSubview(categoriesView)
        categoriesView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview()
            make.height.equalTo(230)
        }
    }
    
    private func setupMainCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize(width: 50, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 360, height: 200)
        layout.scrollDirection = .vertical
        mainCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        mainCollectionView.backgroundColor = .clear
        
        self.view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(categoriesView.snp.bottom)
            make.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        mainCollectionView.register(SectionHeaders.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        mainCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
    }
}

// MARK: - CollectionView methods
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.addSubview(customCollectionView[indexPath.section])
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeaders
            sectionHeader.headerLabel.text = sections[indexPath.section]
            sectionHeader.headerButton.setTitle(buttonText[indexPath.section], for: .normal)
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

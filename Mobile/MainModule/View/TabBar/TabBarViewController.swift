//
//  TabBarViewController.swift
//  Mobile
//
//  Created by tambanco 🥳 on 29.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private lazy var VCs: [UIViewController] = []
    private lazy var firstVC = createFirstVC()
    
    private func createFirstVC() -> UIViewController {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        setupVCs()
    }
    
    func setupVCs() {
        //        viewControllers = [
        //            createNavController(for: MainViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "explorerImage") ?? UIImage()),
        //            createNavController(for: MainViewController(),
        //                                title: NSLocalizedString("", comment: ""),
        //                                image: UIImage(named: "bagImage") ?? UIImage()),
        //            createNavController(for: MainViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "heartImage") ?? UIImage()),
        //            createNavController(for: MainViewController(), title: NSLocalizedString("", comment: ""), image: UIImage(named: "profileImage") ?? UIImage())
        //        ]
        viewControllers = VCs
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        //        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}

extension TabBarViewController {
    
    
}

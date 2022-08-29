//
//  TabBarViewController.swift
//  Mobile
//
//  Created by tambanco 🥳 on 29.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let button = UIButton.init(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().barTintColor = .systemRed
        tabBar.tintColor = .label
        
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: MainViewController(),
                                title: NSLocalizedString("● Explore", comment: ""),
                                image: UIImage()),
            createNavController(for: MainViewController(),
                                title: NSLocalizedString("", comment: ""),
                                image: UIImage(named: "bagImage")?.resized(to: CGSize(width: 18, height: 18)) ?? UIImage()),
            createNavController(for: MainViewController(),
                                title: NSLocalizedString("", comment: ""),
                                image: UIImage(named: "heartImage")?.resized(to: CGSize(width: 20, height: 18)) ?? UIImage()),
            createNavController(for: MainViewController(),
                                title: NSLocalizedString("", comment: ""),
                                image: UIImage(named: "profileImage")?.resized(to: CGSize(width: 17, height: 18)) ?? UIImage())
        ]
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

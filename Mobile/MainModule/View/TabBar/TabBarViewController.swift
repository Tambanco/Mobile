//
//  TabBarViewController.swift
//  Mobile
//
//  Created by tambanco 🥳 on 29.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupVCs()
    }
    
    private func setupTabBar() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .white
        tabBar.layer.cornerRadius = tabBar.frame.height * 0.95
        tabBar.tintColor = .systemGray
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor = UIColor(hexString: "#010035")
    }
    
    private func setupVCs() {
        viewControllers = [
            createNavController(for: MainViewController(),
                                title: NSLocalizedString("● Explore", comment: ""),
                                image: UIImage()),
            createNavController(for: MainViewController(),
                                title: nil,
                                image: UIImage(named: "bagImage")?.resized(to: CGSize(width: 18, height: 18)) ?? UIImage()),
            createNavController(for: MainViewController(),
                                title: nil,
                                image: UIImage(named: "heartImage")?.resized(to: CGSize(width: 20, height: 18)) ?? UIImage()),
            createNavController(for: MainViewController(),
                                title: nil,
                                image: UIImage(named: "profileImage")?.resized(to: CGSize(width: 17, height: 18)) ?? UIImage())
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                     title: String?,
                                     image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        //        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}

extension UITabBarItem {
    func tabBarItemShowingOnlyImage() -> UITabBarItem {
        // offset to center
        self.imageInsets = UIEdgeInsets(top:6,left:0,bottom:-6,right:0)
        // displace to hide
        self.titlePositionAdjustment(UIOffset(horizontal:0,vertical:30000))
        return self
    }
}

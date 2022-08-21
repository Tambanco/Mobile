//
//  SceneDelegate.swift
//  Mobile
//
//  Created by tambanco 🥳 on 20.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let mainVC = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.view.backgroundColor = .white
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

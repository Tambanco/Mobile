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
        let assemblyBuilder = AssemblyModuleBuilder()
        let tabBar = TabBarViewController()
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .systemCyan
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initialViewController()

        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}

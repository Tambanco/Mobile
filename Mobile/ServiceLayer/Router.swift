//
//  Router.swift
//  Mobile
//
//  Created by tambanco 🥳 on 27.08.2022.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var tabBarController: UITabBarController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func popToRoot()
}

class Router: RouterProtocol {
    var tabBarController: UITabBarController?
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.pushViewController(mainViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

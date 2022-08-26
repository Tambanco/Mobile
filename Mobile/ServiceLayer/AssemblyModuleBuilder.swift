//
//  AssemblyModuleBuilder.swift
//  Mobile
//
//  Created by tambanco 🥳 on 27.08.2022.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func createFiatModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createFiatModule(router: RouterProtocol) -> UIViewController {
        let networkService = NewtworkService()
        let view = MainViewController()
        let presenter = MainPresenter(router: router, view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}

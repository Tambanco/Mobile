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
    func createCurrencyModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createFiatModule(router: RouterProtocol) -> UIViewController {
        let networkService = NewtworkService()
        let view = FiatViewController()
        let presenter = FiatPresenter(router: router, view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    func createCurrencyModule(router: RouterProtocol) -> UIViewController {
        let networkService = NewtworkService()
        let view = CurrencyViewController()
        let presenter = CurrencyPresenter(router: router, view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}

//
//  ModuleFactory.swift
//  Avito Test
//
//  Created by Dimon on 31.12.2020.
//

import UIKit

final class ModuleFactory {
    
    func makeAdBoosterModule() -> (view: UIViewController, moduleInput: AdBoosterModuleInput) {
        let view = AdBoosterViewController()
        let presenter = AdBoosterPresenter()
        let interactor = AdBoosterInteractor()
        let router = AdBoosterRouter(viewController: view)
        let provider = DefaultAdBoosterProvider()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        interactor.provider = provider

        return (view, presenter)
    }
}

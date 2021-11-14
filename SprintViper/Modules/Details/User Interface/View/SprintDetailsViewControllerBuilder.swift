//
//  SprintDetailsViewControllerBuilder.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

class SprintDetailsViewControllerBuilder {
    
    static func make(router: SprintDetailsRouter) -> SprintDetailsViewController {
        
        let viewController = SprintDetailsViewController(nibName: String(describing: SprintDetailsViewController.self), bundle: nil)
        let manager = SprintDetailsManager()
        let interactor = SprintDetailsInteractor(manager: manager)
        let presenter = SprintDetailsPresenter(interactor: interactor, router: router)
        
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
        
    }
}

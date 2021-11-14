//
//  SprintListViewBuilder.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

class SprintListViewControllerBuilder {
    
    static func make(router: SprintListRouter) -> SprintListViewController {
        let viewController = SprintListViewController(nibName: String(describing: SprintListViewController.self), bundle: nil)
        
        let manager = SprintListManager()
        let interactor = SprintListInteractorBuilder.make(manager: manager)
        let presenter = SprintListPresenterBuilder.make(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}

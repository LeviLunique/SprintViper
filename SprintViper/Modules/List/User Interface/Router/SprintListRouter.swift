//
//  SprintListRouter.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import UIKit

class SprintListRouter {
    
    var navigationController: UINavigationController?
    
    func present(in window: UIWindow) {
        window.makeKeyAndVisible()
        let viewController = SprintListViewControllerBuilder.make(router: self)
        navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
    
    func presentDetails(_ id: Int) {
        guard let navigationController = self.navigationController else { return }
        SprintDetailsRouter(id: id).present(navigationController: navigationController)

    }
    
}

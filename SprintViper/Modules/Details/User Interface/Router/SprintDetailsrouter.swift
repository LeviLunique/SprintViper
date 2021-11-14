//
//  SprintDetailsrouter.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation
import UIKit

class SprintDetailsRouter {
    
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func present(navigationController: UINavigationController) {
        navigationController.pushViewController(SprintDetailsViewControllerBuilder.make(router: self), animated: true)
    }
    
}

//
//  SprintListPresenterBuilder.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

class SprintListPresenterBuilder {
    
    static func make(interactor: SprintListInteractorInput, router: SprintListRouter) -> SprintListPresenter {
        let presenter = SprintListPresenter(interactor: interactor, router: router)
        
        return presenter
    }
}

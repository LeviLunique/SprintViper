//
//  SprintListInteractorBuilder.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

class SprintListInteractorBuilder {
    
    static func make(manager: SprintListManagerInput) -> SprintListInteractor {
        return SprintListInteractor(manager: manager)
    }
}

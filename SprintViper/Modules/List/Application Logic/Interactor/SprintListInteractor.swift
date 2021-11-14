//
//  SprintListInteractor.swift
//  SprintViper
//
//  Created by user204006 on 11/13/21.
//

import Foundation

protocol SprintListInteractorInput {
    func fetch()
}

protocol SprintListInteractorOutput: class {
    func fetched(sprints: [Sprint])
}

class SprintListInteractor: SprintListInteractorInput {
    
    weak var output: SprintListInteractorOutput?
    var manager: SprintListManagerInput
    
    var entities: [Sprint] = []
    
    init(manager: SprintListManagerInput) {
        self.manager = manager
    }
    
    func fetch() {
        manager.getSprints{
            sprints in
            
            self.entities = SprintMapper.parse(from: sprints)
            self.output?.fetched(sprints: self.entities)
        }
    }
    
}

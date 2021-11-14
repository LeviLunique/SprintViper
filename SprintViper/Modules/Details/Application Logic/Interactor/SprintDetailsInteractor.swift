//
//  SprintDetailsInteractor.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

protocol SprintDetailsInteractorInput {
    var output: SprintDetailsInteractorOutput? {get set}
    
    func fetchDetails(id: Int)
}

protocol SprintDetailsInteractorOutput: class {
    func fetchedDetails(_ details: Sprint)
}

class SprintDetailsInteractor: SprintDetailsInteractorInput {
    
    weak var output: SprintDetailsInteractorOutput?
    var manager: SprintDetailsManagerInput
    
    var entity: Sprint?
    
    init(manager: SprintDetailsManagerInput) {
        self.manager = manager
    }
    
    func fetchDetails(id: Int) {
        manager.getSprintDetails(id: "\(id)"){
            details in
            
            self.entity = SprintMapper.parse(from: details)
            guard let entity = self.entity else { return }
            self.output?.fetchedDetails(entity)
        }
        
    }
}

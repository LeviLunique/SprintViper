//
//  SprintDetailsManager.swift
//  SprintViper
//
//  Created by user204006 on 11/14/21.
//

import Foundation

protocol SprintDetailsManagerInput {
    func getSprintDetails(id: String, completion: @escaping ((SprintAPIModel) -> ()))
}

class SprintDetailsManager: SprintDetailsManagerInput {
    
    var object: SprintAPIModel?
    
    func getSprintDetails(id: String, completion: @escaping ((SprintAPIModel) -> ())) {
        SprintAPI.shared.getSprint(id: id){
            sprint in
            
            self.object = sprint
            guard let object = self.object else { return }
            completion(object)

        }
        
    }
    
}

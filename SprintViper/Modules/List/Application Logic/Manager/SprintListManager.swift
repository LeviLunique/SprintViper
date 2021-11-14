//
//  SprintListManager.swift
//  SprintViper
//
//  Created by user204006 on 11/13/21.
//

import Foundation

protocol SprintListManagerInput {
    func getSprints(completion: @escaping ([SprintAPIModel]) -> ())
}

class SprintListManager: SprintListManagerInput {
    
    var objects: [SprintAPIModel] = []
    
    func getSprints(completion: @escaping ([SprintAPIModel]) -> ()) {
        SprintAPI.shared.getSprints{
            objects in
            
            self.objects = objects
            completion(self.objects)
        }
    }
    
}

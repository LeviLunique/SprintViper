//
//  SprintMapper.swift
//  SprintViper
//
//  Created by user204006 on 11/13/21.
//

import Foundation

class SprintMapper {
    
    static func parse(from sprints: [SprintAPIModel]) -> [Sprint] {
        
        var array: [Sprint] = []
        
        for sprint in sprints {
            array.append(Sprint(id: sprint.id!, nome: sprint.nome, link: sprint.link))
        }
        
        return array
        
    }
    
    static func parse(from sprints: [Sprint]) -> [SprintListItemViewModel] {
        
        var array: [SprintListItemViewModel] = []
        
        for sprint in sprints {
            array.append(SprintListItemViewModel(id: sprint.id, nome: sprint.nome, link: sprint.link))
        }
        
        return array
        
    }
    
    static func parse(from details: SprintAPIModel) -> Sprint {
        return Sprint(id: details.id!, nome: details.nome, link: details.link)
    }
    
    static func parse(from details: Sprint) -> SprintListItemViewModel {
        return SprintListItemViewModel(id: details.id, nome: details.nome, link: details.link)
    }
    
}

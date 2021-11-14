//
//  SprintAPIModel.swift
//  SprintViper
//
//  Created by user204006 on 11/13/21.
//

import Foundation
import ObjectMapper

class SprintAPIModel: Mappable {
    
    var id: Int?
    var nome: String = ""
    var link: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        nome <- map["nome"]
        link <- map["link"]
    }
    
}

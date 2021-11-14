//
//  SprintAPI.swift
//  SprintViper
//
//  Created by user204006 on 11/13/21.
//

import Foundation
import Alamofire
import RxAlamofire
import ObjectMapper

class SprintAPI{
    
    var baseURL = "https://scrum-deck-backend.herokuapp.com/sprint/"
    static var shared: SprintAPI = SprintAPI()
    
    private init(){}
    
    func getSprints(completion: @escaping ([SprintAPIModel]) -> ()) {
        
        request(url: baseURL){(json) in
            
            guard let _json = json, let sprints = Mapper<SprintAPIModel>().mapArray(JSONObject: _json["results"]) else{
                completion([])
                return
            }
            
            completion(sprints)
            
        }
        
    }
    
    func getSprint(id: String, completion: @escaping (SprintAPIModel) -> ()){
        
        let sprintURL = baseURL+id
        
        request(url: sprintURL){(json) in
            
            guard let _json = json, let sprint = Mapper<SprintAPIModel>().map(JSON: _json) else {
                return
            }
            completion(sprint)
            
        }
    }
    
    private func request(url: String, completion: @escaping ([String: Any]?) -> ()){
        guard let url = URL(string: url) else { return }
        
        let _ = AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON(completionHandler: { (repsonse) in
            completion(repsonse.result as? [String: Any])
        })
    }
    
}

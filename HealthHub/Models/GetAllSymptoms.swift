//
//  GetAllSymptoms.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import Foundation


class GetAllSymptoms: Decodable
{
    
    var data : [symtopms]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }
    
}



class symtopms : Decodable
{
    var id : Int?
    var name : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}


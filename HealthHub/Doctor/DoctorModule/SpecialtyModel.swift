//
//  SpecialtyModel.swift
//  HealthHub
//
//  Created by Hamza on 05/03/2022.
//

import Foundation

class SpecialtyModel: Decodable
{

    var data : [SpecialtyDataModel]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }

}


class SpecialtyDataModel : Decodable
{
    var id : Int?
    var cat_id : Int?
    var name : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    var totaldoctors : Int?
  
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case cat_id = "cat_id"
        case name = "name"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case totaldoctors = "totaldoctors"
       
    }
}

class AddSpecialtyModel: Decodable
{
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
    }

}


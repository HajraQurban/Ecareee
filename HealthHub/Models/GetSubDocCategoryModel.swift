//
//  GetSubDocCategoryModel.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation

class GetSubCatDocData: Decodable
{
    
    var data : [subdata]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }
    
}



class subdata : Decodable
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



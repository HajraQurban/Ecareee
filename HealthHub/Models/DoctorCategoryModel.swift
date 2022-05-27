//
//  DoctorCategoryModel.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation


class GetDocData: Decodable
{
    var data : [Docdata]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }
}


class Docdata: Decodable
{
    var status : String?
    var id : Int?
    var created_at : String?
    var deleted_at : String?
    var image : String?
    var updated_at : String?
    var name : String?
    var url : String?
    
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case id = "id"
        case created_at = "created_at"
        case deleted_at = "deleted_at"
        case image = "image"
        case updated_at = "updated_at"
        case name = "name"
        case url = "url"
    }
    
}

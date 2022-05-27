//
//  GetDocAgainstSubCatData.swift
//  HealthHub
//
//  Created by OBS on 31/12/2021.
//

import Foundation


class GetDocAgainstSubCatData: Decodable
{
    var doctor : [Doctor]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case doctor = "doctor"
        case status = "status"
        case message = "message"
    }
}


class subdocdata: Decodable
{
    
    var id : Int?
    var subcat_id : Int?
    var doctor_id : Int?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    var doctor : Doctor?
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case subcat_id = "subcat_id"
        case doctor_id = "doctor_id"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case doctor = "doctor"
        
        
    }
    
}



class Doctor : Decodable
{
    var id : Int?
    var name : String?
    var email : String?
    var email_verified_at : String?
    var contact : String?
    var gender : String?
    var address : String?
    var date_of_birth : String?
    var medical_record : String?
    var type : String?
    var cat_id : Int?
    var image : String?
    var url : String?
    var description : String?
    var hospital_name : String?
    var fees : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    var category : CategoryData?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case email_verified_at = "email_verified_at"
        case contact = "contact"
        case gender = "gender"
        case address = "address"
        case date_of_birth = "date_of_birth"
        case medical_record = "medical_record"
        case type = "type"
        case cat_id = "cat_id"
        case image = "image"
        case url = "url"
        case description = "description"
        case hospital_name = "hospital_name"
        case fees = "fees"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case category = "category"
    }
    
}


class CategoryData: Decodable
{
    
    var id : Int?
    var name : String?
    var image : String?
    var url : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case image = "image"
        case url = "url"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        
    }
    
}

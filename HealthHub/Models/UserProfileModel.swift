//
//  UserProfileModel.swift
//  HealthHub
//
//  Created by OBS on 11/01/2022.
//

import Foundation

//EDIT Model
class UserProfileModel: Decodable
{
    var status : String?
    var data : profiledata1?
    var illness : [getill]?
    var appointments :  Int?
    var blodwork: Int?
    var spending : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case data = "data"
        case illness = "illness"
        case appointments = "appointments"
        case blodwork = "blood_work"
        case spending = "spendings"

    }
    
}


class profiledata1 : Decodable
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
    var medical_record_url : String?
    var emergencey_contact : String?
    var type : String?
    var cat_id : Int?
    var social_id : Int?
    var image : String?
    var url : String?
    var description : String?
    var hospital_name : String?
    var fees : String?
    var status : String?
    var created_at : String?
    var deleted_at : String?
    var updated_at : String?
    
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
        case medical_record_url = "medical_record_url"
        case emergencey_contact = "emergencey_contact"
        case type = "type"
        case cat_id = "cat_id"
        case social_id = "social_id"
        case image = "image"
        case url = "url"
        case description = "description"
        case hospital_name = "hospital_name"
        case fees = "fees"
        case status = "status"
        case created_at = "created_at"
        case deleted_at = "deleted_at"
        case updated_at = "updated_at"
        
    }
    
}



class getill : Decodable
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

//
//  SocialloginModel.swift
//  HealthHub
//
//  Created by OBS on 06/01/2022.
//

import Foundation



class SocialloginModel: Decodable
{
    var data : socialuser?
    var accessToken : String?
    var status : String?
    var message : String?
    var new_password : String?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
        case accessToken = "accessToken"
        case status = "status"
        case message = "message"
        case new_password = "new_password"
    }
    
}



class socialuser : Decodable
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
    var social_id : String?
    var image : String?
    var url : String?
    var description : String?
    var hospital_name : String?
    var fees : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    
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
        case social_id = "social_id"
        case image = "image"
        case url = "url"
        case description = "description"
        case hospital_name = "hospital_name"
        case fees = "fees"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
    }
    
}

//
//  SigninModel.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import UIKit
import ObjectMapper


class SigninModel: Decodable
{
    var data : data1?
    var status : String?
    var type : String?
    var message : String?
    var accessToken : String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case type = "type"
        case message = "message"
        case accessToken = "accessToken"
    }
    
}


class data1 : Decodable
{
    var id : Int?
    var status : String?
    var cat_id : Int?
    var contact : String?
    var created_at : String?
    var type : String?
    var email_verified_at : String?
    var fcm_token : String?
    var url : String?
    var medical_record : String?
    var address : String?
    var deleted_at : String?
    var updated_at : String?
    var date_of_birth : String?
    var email : String?
    var name : String?
    var gender : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case cat_id = "cat_id"
        case contact = "contact"
        case created_at = "created_at"
        case type = "type"
        case fcm_token = "fcm_token"
        case url = "url"
        case email_verified_at = "email_verified_at"
        case medical_record = "medical_record"
        case address = "address"
        case deleted_at = "deleted_at"
        case updated_at = "updated_at"
        case date_of_birth = "date_of_birth"
        case email = "email"
        case name = "name"
        case gender = "gender"
        
    }
    
}



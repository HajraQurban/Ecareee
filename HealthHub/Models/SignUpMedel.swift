//
//  SignUpMedel.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//


import Foundation
import UIKit
import ObjectMapper

class SignupModel: Decodable
{
    var data : signupdata1?
    var status : String?
    var message : String?
    var accessToken : String?
    var Error : errordata?
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
        case accessToken = "accessToken"
        case Error = "Error"
    }
    
}


class errordata: Decodable
{
    //    var name : [String?]
    var email : [String]?
    var password : [String]?
    //    var image : String?
    //    var contact : [Int?]
    //    var address : String?
    //    var Emer_number : String?
    enum CodingKeys: String, CodingKey {
        //        case name = "name"
        case email = "email"
        //        case contact = "contact"
        case password = "password"
        //        case image = "image"
        //        case phonenumber = "phonenumber"
        //        case address = "address"
        
    }
    
    
    
}

class signupdata1 : Decodable
{
    var id : Int?
    var status : String?
    var cat_id : String?
    var contact : String?
    var created_at : String?
    var type : String?
    var updated_at : String?
    var date_of_birth : String?
    var email : String?
    var name : String?
    var gender : String?
    var image : String?
    var url : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case status = "status"
        case cat_id = "cat_id"
        case contact = "contact"
        case created_at = "created_at"
        case type = "type"
        case updated_at = "updated_at"
        case date_of_birth = "date_of_birth"
        case email = "email"
        case name = "name"
        case gender = "gender"
        case image = "image"
        case url = "url"
        
    }
    
}



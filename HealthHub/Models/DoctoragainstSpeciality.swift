//
//  DoctoragainstSpeciality.swift
//  HealthHub
//
//  Created by OBS on 04/01/2022.
//

import Foundation


class DoctoragainstSpecialityData: Decodable
{
    var doctor : docdata1?
    var speciality : [specilialitydata]?
    var review : [reviewdata]?
    var slots : [slotsdata]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        
        case doctor = "doctor"
        case speciality = "speciality"
        case review = "review"
        case slots = "slots"
        case status = "status"
        case message = "message"
    }
}


class docdata1 : Decodable
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
    var deleted_at : String?
    var updated_at : String?
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
        case deleted_at = "deleted_at"
        case updated_at = "updated_at"
        case category = "category"
        
        
        
        
    }
    
}



class specilialitydata: Decodable
{
    
    var id : Int?
    var cat_id : Int?
    var name : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case cat_id = "cat_id"
        case name = "name"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        
        
        
    }
    
}

class slotsdata: Decodable
{
    
    var id : Int?
    var doctor_id : Int?
    var date : String?
    var start_time : String?
    var end_time : String?
    var total : String?
    var description : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case doctor_id = "doctor_id"
        case date = "date"
        case start_time = "start_time"
        case end_time = "end_time"
        case total = "total"
        case description = "description"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        
    }
    
}




class reviewdata: Decodable
{
    
    var id : Int?
    var doctor_id : Int?
    var patient_id : Int?
    var description : String?
    var stars : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    var deleted_at : String?
    var user : userdata?
    
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case doctor_id = "doctor_id"
        case patient_id = "patient_id"
        case description = "description"
        case stars = "stars"
        case status = "status"
        
        case created_at = "created_at"
        case updated_at = "updated_at"
        case deleted_at = "deleted_at"
        case user = "user"
        
        
    }
    
}


class userdata : Decodable
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
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case email_verified_at = "email_verified_at"
        case contact = "contact"
        case gender = "gender"
        case address = "address"
        case date_of_birth = "date_of_birth"
        case medical_record = "medical_record_url"
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
    }
    
}

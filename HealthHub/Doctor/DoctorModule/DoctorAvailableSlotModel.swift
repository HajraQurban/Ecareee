//
//  GetAllSymptoms.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import Foundation


class GetDoctorAvailableSlot: Decodable
{

    var data : [Availableslot]?
    var review : [reviewdata]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case review = "review"
        case status = "status"
        case message = "message"
    }

}



class Availableslot : Decodable
{
    var id : Int?
    var doctor_id : Int?
    var patient_id : Int?
    var date : String?
    var start_time : String?
    var end_time : String?
    var total : String?
    var name : String?
    var description : String?
    var status : String?
    var created_at : String?
    var updated_at : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case doctor_id = "doctor_id"
        case patient_id = "patient_id"
        case date = "date"
        case start_time = "start_time"
        case end_time = "end_time"
        case total = "total"
        case name = "name"
        case description = "description"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}


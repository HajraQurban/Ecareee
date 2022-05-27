//
//  DoctorAppointmentModel.swift
//  HealthHub
//
//  Created by OBS on 08/02/2022.
//

import Foundation

class DoctorAppointmentModel: Decodable
{

    var data : [appointdata1]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }

}


class appointdata1: Decodable
{
    
    var id : Int?
    var doctor_id : Int?
    var patient_id : Int?
    var description : String?
    var complaint_name : String?
    var patient : patient?
    var slot : slot?
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case doctor_id = "doctor_id"
        case patient_id = "patient_id"
        case description = "description"
        case complaint_name = "complaint_name"
        case patient = "patient"
        case slot = "slot"
      
    }
    
}


class patient: Decodable
{

    var id : Int?
    var name : String?
    var url : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
    }

}


class slot: Decodable
{

    var id : Int?
    var date : String?
    var start_time : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
        case start_time = "start_time"
    }

}

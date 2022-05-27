//
//  GetappointmentModal.swift
//  HealthHub
//
//  Created by OBS on 20/01/2022.
//

import Foundation



class GetappointmentModal: Decodable
{
    var data : [appointdata]?
    var status : Int?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }
    
}


class appointdata: Decodable
{
    var id : Int?
    var doctor_id : Int?
    var appoinment_type : String?
    var doctor : docdata1?
    var slot : slotsdata?
    var roomName :  String?
    var patient : userdata?
    var compName : String?
    var compDesc : String?
    var smoke : String?
    var diabetes : String?
    var asthma : String?
    var allergic : String?
    var diagnosed_diabetes : String?
    var diagnosed_heart : String?
    var diagnosed_kidney : String?
    var diagnosed_arthritis : String?
    var diagnosed_pulmonary : String?
    var diagnosed_eating : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case doctor_id = "doctor_id"
        case appoinment_type = "appoinment_type"
        case doctor = "doctor"
        case slot = "slot"
        case roomName = "room_name"
        case patient = "patient"
        case compName = "complaint_name"
        case compDesc = "description"
        case smoke = "smoke"
        case diabetes = "diabetes"
        case asthma = "asthma"
        case allergic = "allergic"
        case diagnosed_diabetes = "diagnosed_diabetes"
        case diagnosed_heart = "diagnosed_heart"
        case diagnosed_kidney = "diagnosed_kidney"
        case diagnosed_arthritis = "diagnosed_arthritis"
        case diagnosed_pulmonary = "diagnosed_pulmonary"
        case diagnosed_eating = "diagnosed_eating"
    }
    
}


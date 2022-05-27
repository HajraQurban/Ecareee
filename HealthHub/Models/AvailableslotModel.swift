//
//  AvailableslotModel.swift
//  HealthHub
//
//  Created by Mac on 12/03/2022.
//

import Foundation


class AvailableslotModel: Decodable
{
    var doctordata : [String]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case doctordata = "doctor"
        case status = "status"
        case message = "message"
    }
    
}

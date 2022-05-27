//
//  DoctorReviewsModel.swift
//  HealthHub
//
//  Created by OBS on 07/02/2022.
//

import Foundation

class DoctorReviewsModel: Decodable
{

    var data : [reviewdata]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }

}




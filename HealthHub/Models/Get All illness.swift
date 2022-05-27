//
//  Get All illness.swift
//  HealthHub
//
//  Created by OBS on 12/01/2022.
//

import Foundation


class GetAllillness: Decodable
{
    var data : [symtopms]?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }

}


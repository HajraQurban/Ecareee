//
//  ForgotPasswordModel.swift
//  HealthHub
//
//  Created by OBS on 06/01/2022.
//

import Foundation



class ForgotPasswordModel: Decodable
{
    var status : String?
    var message : String?
    var new_password : String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case new_password = "new_password"
    }
    
}

//
//  NotificationModel.swift
//  HealthHub
//
//  Created by Hamza on 08/03/2022.
//

import Foundation
import UIKit
import ObjectMapper


class NotificationModel: Decodable
{
   
    var status : String?
    var success : Int?
   
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
    }
    
}

//
//  BaseModel.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import UIKit
import ObjectMapper

//class BaseModel: NSObject , Mappable
//{
//    var status : String?
//    var message : String?
//
//    override init() {
//        self.status = ""
//        self.message = ""
//    }
//
//    required init?(map: Map) {
//      self.status = ""
//      self.message = ""
//    }
//
//    func mapping(map: Map) {
//
//      self.status <- map["status"]
//      self.message <- map["message"]
//
//    }
//
//}

class BaseModel: Decodable
{
//    var data : data1?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
//        case data = "data"
        case message = "message"
    }
    
}

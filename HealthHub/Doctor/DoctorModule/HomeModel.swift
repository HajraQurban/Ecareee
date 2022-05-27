//
//  HomeModel.swift
//  HealthHub
//
//  Created by Hamza on 09/03/2022.
//

import Foundation

class HomeModel: Decodable
{

    var data : HomeModelData?
    var status : String?
    var message : String?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case status = "status"
        case message = "messgae"
    }

}

class HomeModelData: Decodable
{

    var paidVisit : Int?
    var totalVisit : Int?
    var upcomming : [appointdata]?
    var pending : [appointdata]?
    
    enum CodingKeys: String, CodingKey {
        case paidVisit = "paid_visits"
        case totalVisit = "total_visits"
        case upcomming = "upcomming_appointments"
        case pending = "pending_appointments"
    }

}

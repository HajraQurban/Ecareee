//
//  File.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import Foundation
import SwiftUI


class ChatListModel: Decodable
{
  var status : String?
  var contacts : [ChatListData]?
  var message : String?
  enum CodingKeys: String, CodingKey {
    case status = "status"
    case contacts = "contacts"
    case message = "message"
  }
}
class ChatListData: Decodable
{
  var id : Int?
  var name : String?
  var url : String?
  var date : String?
  var lastMsg : UserObjectData?
  var created_at : String?
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case url = "url"
    case date = "date"
    case lastMsg = "lastMsg"
    case created_at = "created_at"
  }
}

class UserObjectData: Decodable
{
  var name : String?
  var lastMsg : String?
  var Seen : Int?
  var max_created_at : String?
    
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case Seen = "seen"
    case lastMsg = "body"
    case max_created_at = "created_at"
  }
}





class UserChatModel: Decodable
{
  var status : String?
  var messagelist : [UserChatData]?
  var message : String?
  enum CodingKeys: String, CodingKey {
    case status = "status"
    case messagelist = "messages_list"
    case message = "message"
  }
}
class UserChatData: Decodable
{
  var id : Int?
  var type : String?
  var from_id : Int?
  var to_id : Int?
  var body : String?
  var attachment : Int?
  var seen : Int?
  var created_at : String?
  var updated_at : String?
  var lastmsg : String?
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case type = "type"
    case from_id = "from_id"
    case to_id = "to_id"
    case body = "body"
    case attachment = "attachment"
    case seen = "seen"
    case created_at = "created_at"
    case updated_at = "updated_at"
    case lastmsg = "lastmsg"
  }
}
class SendMessageModel: Decodable
{
    var status : String?
  enum CodingKeys: String, CodingKey {
    case status = "status"
  }
}



class GetNotificationModel: Decodable
{
  var data : [GetNotificationData]?
  var message : String?
  var status : String?
  enum CodingKeys: String, CodingKey {
     case status = "status"
      case data = "data"
      case message = "message"
  }
}


class GetNotificationData: Decodable
{
  var id : Int?
  var title : String?
  var body : String?
  var type : String?
  enum CodingKeys: String, CodingKey {
     case id = "id"
     case title = "title"
     case body = "body"
     case type = "type"
  }
}

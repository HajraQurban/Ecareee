//
// InbocManager.swift
// HealthHub
//
// Created by Hamza on 14/03/2022.
//
import Foundation
import Alamofire

class InboxManager{
  func getChatList(complition: @escaping(ChatListModel?,String,Bool) -> Void){
      
      if (!detectNetwork()) {
          complition(nil,"Network Error!",true)

      }
      
    let url = URLConstants.chatList
    //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
    let headers: HTTPHeaders = [
        "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
      "Accept": "application/json"
    ]
    print("Token\(acesstoken ?? "")")
    AF.request(url, method: .get, parameters: nil, headers: headers).response
    {
      response in
      // if let result = response.value {
      switch response.result{
      case .success(let data):
        do{
          let json = try JSONDecoder().decode(ChatListModel.self, from: data ?? Data())
          if json.status == "200" {
            print(json)
            print("Login Successfull")
            complition(json,"Success!",false)
            print("The Acess Token\(String(describing: acesstoken))")
          }
          else
          {
            complition(nil,json.message ?? "failure!",true)
            print("Invalid User")
          }
        }
        catch{
          complition(nil,error.localizedDescription,true)
          print(error.localizedDescription)
          print(error)
        }
      case .failure(let err):
        complition(nil,err.localizedDescription,true)
        print(err.localizedDescription)
        print(err)
      }
    }
  }
  func getChat(id :Int,complition: @escaping(UserChatModel?,String,Bool) -> Void){
      
      if (!detectNetwork()) {
          complition(nil,"Network Error!",true)

      }
      
    let url = URLConstants.getChat
    //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
    let headers: HTTPHeaders = [
      "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",//56|LkU0niIljnf1Bq4Ecg10h9Gf25R3cCIodA4j5OyG
      "Accept": "application/json"
    ]
    print("Token\(acesstoken ?? "")")
    let params : [String:Any] = ["id":id,"type":"user","page":"1"]
    AF.request(url, method: .post, parameters: params, headers: headers).response
    {
      response in
      // if let result = response.value {
      switch response.result{
      case .success(let data):
        do{
          let json = try JSONDecoder().decode(UserChatModel.self, from: data ?? Data())
          if json.status == "200" {
            print(json)
            print("Login Successfull")
            complition(json,"Success!",false)
            print("The Acess Token\(String(describing: acesstoken))")
          }
          else
          {
            complition(nil,json.message ?? "failure!",true)
            print("Invalid User")
          }
        }
        catch{
          complition(nil,error.localizedDescription,true)
          print(error.localizedDescription)
          print(error)
        }
      case .failure(let err):
        complition(nil,err.localizedDescription,true)
        print(err.localizedDescription)
        print(err)
      }
    }
  }
  func sendMsg(id :Int,msg:String,complition: @escaping(SendMessageModel?,String,Bool) -> Void){
      
      if (!detectNetwork()) {
          complition(nil,"Network Error!",true)

      }
      
    let url = URLConstants.sendMsg
    //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
    let headers: HTTPHeaders = [
        "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
      "Accept": "application/json"
    ]
    print("Token\(acesstoken ?? "")")
    let params : [String:Any] = ["file":"","id":id,"type":"user","temporaryMsgId":"temp_1","message":msg]
    AF.request(url, method: .post, parameters: params, headers: headers).response
    {
      response in
      // if let result = response.value {
      switch response.result{
      case .success(let data):
        do{
          let json = try JSONDecoder().decode(SendMessageModel.self, from: data ?? Data())
          if json.status == "200" {
//            print(json)
//            print("Login Successfull")
            complition(json,"Success!",false)
            print("The Acess Token\(String(describing: acesstoken))")
          }
          else
          {
            complition(nil, "failure!",true)
//            print("Invalid User")
          }
        }
        catch{
          complition(nil,error.localizedDescription,true)
          print(error.localizedDescription)
          print(error)
        }
      case .failure(let err):
        complition(nil,err.localizedDescription,true)
        print(err.localizedDescription)
        print(err)
      }
    }
  }
    
    func updatecontacts(id :Int,complition: @escaping(String,Bool) -> Void){
      let url = URLConstants.update_contacts
      //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
      let headers: HTTPHeaders = [
        "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",//56|LkU0niIljnf1Bq4Ecg10h9Gf25R3cCIodA4j5OyG
        "Accept": "application/json"
      ]
      print("Token\(acesstoken ?? "")")
      let params : [String:Any] = ["user_id":id]
      AF.request(url, method: .post, parameters: params, headers: headers).response
      {
        response in
        // if let result = response.value {
        switch response.result{
        case .success(let data):
          do{
            let json = try JSONDecoder().decode(BaseModel.self, from: data ?? Data())
              if response.response?.statusCode == 200 {
              print(json)
                complition(json.message ?? "Success!",false)
              print("The Acess Token\(String(describing: acesstoken))")
            }
            else
            {
              complition(json.message ?? "failure!",true)
              print("Invalid User")
            }
          }
          catch{
            complition(error.localizedDescription,true)
            print(error.localizedDescription)
            print(error)
          }
        case .failure(let err):
          complition(err.localizedDescription,true)
          print(err.localizedDescription)
          print(err)
        }
      }
    }
    
    
    func makeseen(id :Int,complition: @escaping(String,Bool) -> Void){
      let url = URLConstants.make_seen
      //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
      let headers: HTTPHeaders = [
        "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",//56|LkU0niIljnf1Bq4Ecg10h9Gf25R3cCIodA4j5OyG
        "Accept": "application/json"
      ]
      print("Token\(acesstoken ?? "")")
      let params : [String:Any] = ["id":id]
      AF.request(url, method: .post, parameters: params, headers: headers).response
      {
        response in
        // if let result = response.value {
        switch response.result{
        case .success(let data):
          do{
//            let json = try JSONDecoder().decode(BaseModel.self, from: data ?? Data())
              if response.response?.statusCode == 200 {
//              print(json)
//                complition(json.message ?? "Success!",false)
              print("The Acess Token\(String(describing: acesstoken))")
            }
            else
            {
//              complition(json.message ?? "failure!",true)
              print("Invalid User")
            }
          }
          catch{
            complition(error.localizedDescription,true)
            print(error.localizedDescription)
            print(error)
          }
        case .failure(let err):
          complition(err.localizedDescription,true)
          print(err.localizedDescription)
          print(err)
        }
      }
    }
    
    
    func getnotification(complition: @escaping(GetNotificationModel?,String,Bool) -> Void){
      let url = URLConstants.get_notification
      //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
      let headers: HTTPHeaders = [
          "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
        "Accept": "application/json"
      ]
      print("Token\(acesstoken ?? "")")
      AF.request(url, method: .get, parameters: nil, headers: headers).response
      {
        response in
        // if let result = response.value {
        switch response.result{
        case .success(let data):
          do{
            let json = try JSONDecoder().decode(GetNotificationModel.self, from: data ?? Data())
            if json.status == "200" {
  //            print(json)
  //            print("Login Successfull")
              complition(json,"Success!",false)
              print("The Acess Token\(String(describing: acesstoken))")
            }
            else
            {
              complition(nil, "failure!",true)
  //            print("Invalid User")
            }
          }
          catch{
            complition(nil,error.localizedDescription,true)
            print(error.localizedDescription)
            print(error)
          }
        case .failure(let err):
          complition(nil,err.localizedDescription,true)
          print(err.localizedDescription)
          print(err)
        }
      }
    }
    
    
    
}




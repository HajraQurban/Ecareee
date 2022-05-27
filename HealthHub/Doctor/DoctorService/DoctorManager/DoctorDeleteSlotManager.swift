//
//  GetSubDocCategory.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import Alamofire


class DoctorDeleteSlotManager{
    
    func deleteslot(id:Int,complition: @escaping(String,String,Bool) -> Void){
      
        if (!detectNetwork()) {
            complition("","Network Error!",true)

        }
        
        let url = URLConstants.doctor_delete_slot + String(id)


    //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
     
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
        AF.request(url, method: .get, parameters: nil, headers: headers).response
                 {
                     response in
                     print(response)
                     
                     switch response.result{
                     case .success(let data):
                         do{
//                             let json = try JSONDecoder().decode(GetSubCatDocData.self, from: data!)
                             if response.response != nil {
                             complition("Slot Deleted Successfully","",false)
                             }
                             else
                             {
                                 complition("","",true)
                                 print("Check Internet")
                             }
                         }
                         
                         catch{
                             complition("",error.localizedDescription,true)
                             print(error.localizedDescription)
                             print(error)
                         }

                     case .failure(let err):
                         complition("",err.localizedDescription,true)
                         print(err.localizedDescription)
                     }
                     
                     
                 }
        
    }


    }
    
    



class DoctorDeleteBookedSlotManager{
    
    func deleteslot(id:Int,complition: @escaping(String,String,Bool) -> Void){
      
        
        let url = URLConstants.doctor_delete_slot + String(id)


    //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
     
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
        AF.request(url, method: .get, parameters: nil, headers: headers).response
                 {
                     response in
                     print(response)
                     
                     switch response.result{
                     case .success(let data):
                         do{
//                             let json = try JSONDecoder().decode(GetSubCatDocData.self, from: data!)
                             if response.response != nil {
                             complition("Slot Deleted Successfully","",false)
                             }
                             else
                             {
                                 complition("","",true)
                                 print("Check Internet")
                             }
                         }
                         
                         catch{
                             complition("",error.localizedDescription,true)
                             print(error.localizedDescription)
                             print(error)
                         }

                     case .failure(let err):
                         complition("",err.localizedDescription,true)
                         print(err.localizedDescription)
                     }
                     
                     
                 }
        
    }


    }
    
    

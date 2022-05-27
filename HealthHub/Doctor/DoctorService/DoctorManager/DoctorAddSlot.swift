//
//  EditProfileManager.swift
//  HealthHub
//
//  Created by OBS on 10/01/2022.
//

import Foundation
import Alamofire


class DoctorAddSlot{
    
    func doctoraddSlot(params : [String:Any],complition: @escaping(String,Bool) -> Void){
       
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.doctor_add_slot
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
 
            //  Try this after your parameters, with your URL
        AF.request(url, method: .post, parameters: params, headers: headers).response
                 {
                     response in
                   //  if let result = response.value {
                         switch response.result{
                         case .success(let data):
                             do{
                                 let json = try JSONDecoder().decode(BaseModel.self, from: data ?? Data())
                                 if json.status == "200" {
                                     complition(json.message ?? "Data Uploaded Successfull",false)
                                 }
                                 else
                                 {
                                     complition(json.message ?? "Not Found",true)
                                     print("Invalid")
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
    
    
    
}

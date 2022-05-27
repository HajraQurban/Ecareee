//
//  AppointmentStatusChangeManager.swift
//  HealthHub
//
//  Created by Hamza on 10/03/2022.
//

import Foundation
import Alamofire

class AppointmentStatusChangeManager{
    func changeStatus(params: [String:Any],complition: @escaping(String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.changeStatus
        
        
        //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
        
        
        AF.request(url, method: .post, parameters: params, headers: headers).response
        {
            response in
            print(response)
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(BaseModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        complition("",false)
                    }
                    else
                    {
                        complition(json.message ?? "Not Added",true)
                        print("Check Internet")
                    }
                }
                
                catch{
                    complition(error.localizedDescription,true)
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

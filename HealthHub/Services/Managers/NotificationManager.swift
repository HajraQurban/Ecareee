//
//  NotificationManager.swift
//  HealthHub
//
//  Created by Hamza on 08/03/2022.
//

import Foundation
import Alamofire

class NotificationManager{
    
    func sendNotification(params : [String:Any],complition: @escaping(String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.sendNotification
        
        
        //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")"
        ]
        print("Token\(acesstoken ?? "")")
        
        AF.request(url, method: .post, parameters: params, headers: ["Accept": "application/json"]).response
        {
            response in
            //  if let result = response.value {
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(NotificationModel.self, from: data ?? Data())
                    if json.status == "200" {
                      
                        print(json)
                        print("Login Successfull")
                        complition("Success!",false)
                       
                        print("The Acess Token\(String(describing: acesstoken))")
                    }
                    else
                    {
                        complition("Failure!",true)
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
    
    
}

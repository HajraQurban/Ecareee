//
//  ForgotPasswordManager.swift
//  HealthHub
//
//  Created by OBS on 06/01/2022.
//

import Foundation
import Alamofire


class ForgotPasswordManager
{
    
    func setforgotpassword(params : [String:Any],complition: @escaping(ForgotPasswordModel?,String,Bool) -> Void){
        
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        
        let url = URLConstants.forgot_password
        
        
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
                    let json = try JSONDecoder().decode(ForgotPasswordModel.self, from: data ?? Data())
                    if response.response != nil {
                        print(json)
                        complition(json,"",false)
                    }
                    else
                    {
                        complition(nil,"",true)
                        print("Check Internet")
                    }
                }
                
                catch{
                    complition(nil,error.localizedDescription,true)
                    print(error)
                }
                
            case .failure(let err):
                complition(nil,err.localizedDescription,true)
                print(err.localizedDescription)
            }
            
            
        }
        
    }
    
}

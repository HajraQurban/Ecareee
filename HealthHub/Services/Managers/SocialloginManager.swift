//
//  SocialloginManager.swift
//  HealthHub
//
//  Created by OBS on 06/01/2022.
//

import Foundation
import Alamofire


class SocialloginManager
{
    
    func setsociallogin(params : [String:Any],complition: @escaping(String,Bool) -> Void){
        
        
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.social_login
        
        
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
                    let json = try JSONDecoder().decode(SigninModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        print("Login Successfull")
                        complition(json.message ?? "Success",false)
                        Helper.saveUser(json)
                        print("The Acess Token\(String(describing: acesstoken))")
                    }
                    else
                    {
                        complition(json.message ?? "Something went wrong",true)
                        print("Invalid User")
                    }
                }
                
                catch{
                    complition(error.localizedDescription,true)
                    print(error.localizedDescription)
                }
                
            case .failure(let err):
                complition(err.localizedDescription,true)
                print(err.localizedDescription)
            }
            
            
        }
        
    }
    
}

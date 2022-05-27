//
//  UserProfileManager.swift
//  HealthHub
//
//  Created by OBS on 11/01/2022.
//

import Foundation
import Alamofire


class UserProfileManager{
    
    func userprofilelist(complition: @escaping(UserProfileModel?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        
        let url = URLConstants.user_profile
        
        
        //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json",
            // "Content-type": "multipart/form-data"
        ]
        
        
        print("Token\(acesstoken ?? "")")
        
        AF.request(url, method: .post, headers: headers).response
        {
            response in
            print(response)
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(UserProfileModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        
                        complition(json,"",false)
                        
                    }
                    else
                    {
                        complition(nil,"",true)
                        print("Check Internet")
                    }
                }catch(let error){
                    complition(nil,error.localizedDescription,true)
                    print(error)
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
        
        
    }
    
    
}




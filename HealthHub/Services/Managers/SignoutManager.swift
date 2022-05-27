//
//  SignoutManager.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import Foundation
import Alamofire


class SignoutManager{
    
    func Signoutuser(complition: @escaping(String,Bool) -> Void){
        let url = URLConstants.user_logout
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
        
        //  Try this after your parameters, with your URL
        AF.request(url, method: .get, parameters: nil, headers: headers).response
        {
            response in
            //  if let result = response.value {
            switch response.result{
            case .success(let data):
                do{
                    
                    let json = try JSONDecoder().decode(BaseModel.self, from: data ?? Data())
                    if json.status == "200" {
                        complition(json.message ?? "User Signout Successfully",false)
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

//
//  Dr_HomeManger.swift
//  HealthHub
//
//  Created by Hamza on 09/03/2022.
//

import Foundation
import Alamofire

class Dr_HomeManager{
    
    func homeData(complition: @escaping(HomeModel?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        
        let url = URLConstants.home
        
        
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
                    let json = try JSONDecoder().decode(HomeModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        complition(json,json.message ?? "Ok",false)
                    }
                    else
                    {
                        complition(nil,json.message ?? "Error",true)
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
                print(err)
            }
            
            
        }
        
    }
    
    
    
    
}




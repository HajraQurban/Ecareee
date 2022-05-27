//
//  GetSymtopslist.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import Foundation


import Alamofire

class GetSymtopslistManagers{
    
    func symtopmslist(complition: @escaping(GetAllSymptoms?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        let url = URLConstants.get_symptops
        
        
        //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")"
        ]
        print("Token\(acesstoken ?? "")")
        
        AF.request(url, method: .get, headers: headers).response
        {
            response in
            print(response)
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(GetAllSymptoms.self, from: data ?? Data())
                    if response.response?.statusCode == 200 {
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
                    print(error.localizedDescription)
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
        
        
    }
    
    
}





class GetillnesslistManagers{
    
    func illnesslist(complition: @escaping(GetAllillness?,String,Bool) -> Void){
        
        
        let url = URLConstants.get_illness
        
        
        //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")"
        ]
        print("Token\(acesstoken ?? "")")
        
        AF.request(url, method: .get, headers: headers).response
        {
            response in
            print(response)
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(GetAllillness.self, from: data ?? Data())
                    if json.status == "200" {
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
                    print(error.localizedDescription)
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
        
        
    }
    
    
}



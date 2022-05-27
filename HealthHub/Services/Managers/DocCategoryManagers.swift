//
//  DocCategoryManagers.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import Alamofire

class DocCategoryManagers{
    
    func categorylist(complition: @escaping(GetDocData?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        let url = URLConstants.doc_cat
        
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
                    let json = try JSONDecoder().decode(GetDocData.self, from: data ?? Data())
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
                    response.response?.statusCode
                    complition(nil,"Unathenticated",true)
                    print(error)
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
        
        
    }
    
    
}




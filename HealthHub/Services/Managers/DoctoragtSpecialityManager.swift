//
//  DoctoragtSpecialityManager.swift
//  HealthHub
//
//  Created by OBS on 04/01/2022.
//

import Foundation
import Alamofire


class DoctoragtSpeciality
{
    
    func docagainstspecialitylist(id:Int,date:String,complition: @escaping(DoctoragainstSpecialityData?,String,Bool) -> Void){
        
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        
        let url = URLConstants.doc_specility + String(id) + "/" + date
        
        
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
                    let json = try JSONDecoder().decode(DoctoragainstSpecialityData.self, from: data ?? Data())
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
                print(err)
            }
            
            
        }
        
    }
    
    
    func docOwnspecialitylist(complition: @escaping(SpecialtyModel?,String,Bool) -> Void){
        
        
        let url = URLConstants.doctor_own_specitly
        
        
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
                    let json = try JSONDecoder().decode(SpecialtyModel.self, from: data ?? Data())
                    if response.response != nil {
                        print(json)
                        complition(json,json.message ?? "",false)
                    }
                    else
                    {
                        complition(nil,json.message ?? "",true)
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

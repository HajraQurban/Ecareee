//
//  SecialtyManager.swift
//  HealthHub
//
//  Created by Hamza on 05/03/2022.
//

import Foundation
import Alamofire

class SpecialtyManager{
    
    func allSpecialty(complition: @escaping(SpecialtyModel?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        let url = URLConstants.all_Specialty_Sub
        
        
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
                    if json.status == "200" {
                        print(json)
                        complition(json,"",false)
                    }
                    else
                    {
                        complition(nil,"No Appointment Right Now",true)
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
    
    func addSpecialty(ids : [Int],complition: @escaping(AddSpecialtyModel?,String,Bool) -> Void){
        
        
        let url = URLConstants.add_Specialty
        
        
        //    let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
        
        let params : [String:Any] = [
            "speciality": ids
        ]
        
        AF.request(url, method: .post, parameters: params, headers: headers).response
        {
            response in
            print(response)
            
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(AddSpecialtyModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        complition(json,"",false)
                    }
                    else
                    {
                        complition(nil,json.message ?? "Not Added",true)
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




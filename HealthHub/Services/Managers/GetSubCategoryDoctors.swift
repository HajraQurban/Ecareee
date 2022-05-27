//
//  GetSubCategoryDoctors.swift
//  HealthHub
//
//  Created by OBS on 30/12/2021.
//

import Foundation
import Alamofire


class GetSubCategoryDoctors
{
    
    func subcategorydoclist(params : [String:Any],complition: @escaping(GetDocAgainstSubCatData?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        
        let url = URLConstants.check_available_docs
        
        
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
                    let json = try JSONDecoder().decode(GetDocAgainstSubCatData.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        complition(json,"",false)
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
            }
            
            
        }
        
    }
    
    
    func getavailableslotslist(id : Int,complition: @escaping(AvailableslotModel,String,Bool) -> Void){
        
        
        let url = URLConstants.check_available_dates + ("?subcat_id=\(id)")
        
        
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
                    let json = try JSONDecoder().decode(AvailableslotModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print(json)
                        complition(json,json.message ?? "Success",false)
                    }
                    else
                    {
                        complition(json,json.message ?? "Not Found",true)
                        print("Check Internet")
                    }
                }
                
                catch{
//                    complition(nil,error.localizedDescription,true)
                    print(error)
                }
                
            case .failure(let err):
//                complition(nil,err.localizedDescription,true)
                print(err)
            }
            
            
        }
        
    }
    
    
}

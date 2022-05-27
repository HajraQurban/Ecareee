//
//  PostSypmtopsData.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import Foundation
import Alamofire


class PostSypmtopsDataManager{
    
    func postsymptopdata(params : [String:Any],complition: @escaping(String,Bool) -> Void){
        
        
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        
        let url = URLConstants.add_symptops
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json"
        ]
        
        //  Try this after your parameters, with your URL
        AF.request(url, method: .post, parameters: params, headers: headers).response
        {
            response in
            //  if let result = response.value {
            switch response.result{
            case .success(let data):
                do{
                    
                    let json = try JSONDecoder().decode(BaseModel.self, from: data ?? Data())
                    if json.status == "200" {
                        print("Data Uploaded Successfull")
                        complition(json.message ?? "Data Uploaded Successfully",false)
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

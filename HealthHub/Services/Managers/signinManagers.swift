//
//  signinManagers.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import Alamofire


class signinManagers{
    
    func signin(params : [String:Any],complition: @escaping(String,String,Bool) -> Void){
        
        
        let url = URLConstants.signin
        
        
        //  Try this after your parameters, with your URL
        AF.request(url, method: .post, parameters: params, headers: ["Accept": "application/json"]).response
        {
            response in
            //  if let result = response.value {
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONDecoder().decode(SigninModel.self, from: data ?? Data())
                    if json.status == "200" {
                        Helper.saveUser(json)
                        print(json)
                        print("Login Successfull")
                        complition(json.type ?? "","Success",false)
                       
                        print("The Acess Token\(String(describing: acesstoken))")
                    }
                    else
                    {
                        complition("",json.message ?? "",true)
                        print("Invalid User")
                    }
                }
                
                catch{
                    complition("",error.localizedDescription,true)
                    print(error.localizedDescription)
                    print(error)
                }
                
            case .failure(let err):
                complition("",err.localizedDescription,true)
                print(err.localizedDescription)
                print(err)
            }
            
            
        }
    }
    
}

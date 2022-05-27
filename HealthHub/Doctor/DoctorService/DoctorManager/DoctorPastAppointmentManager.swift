//
//  DoctorPastAppointmentManager.swift
//  HealthHub
//
//  Created by OBS on 22/02/2022.
//

import Foundation
import Alamofire


class GetDoctorPastAppointmentManager{
    
    func getdoctorpastappointmentlist(complition: @escaping(DoctorAppointmentModel?,String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition(nil,"Network Error!",true)

        }
        
        let url = URLConstants.doctor_past_appoinment
        
        
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
                    let json = try JSONDecoder().decode(DoctorAppointmentModel.self, from: data ?? Data())
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
    
    
}




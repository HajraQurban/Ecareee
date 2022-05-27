//
//  EditProfileManager.swift
//  HealthHub
//
//  Created by OBS on 10/01/2022.
//

import Foundation
import Alamofire


class DoctorEditProfileManager{
    
    func doctoreditprofile(params : [String:Any],complition: @escaping(String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.doctor_edit_profile
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json",
            //"Content-type": "multipart/form-data; boundary=<calculated when request is sent>"
        ]
        AF.upload(
                    multipartFormData: { multipartFormData in
                        
                        for (key, value) in params {
                            if key != "image"{
                                multipartFormData.append(((value as? String)?.data(using: .utf8))!, withName: key)

                            }
                        }
                        
                        guard let imageData = doceditimageName1.jpegData(compressionQuality: 0.5) else {
                               print("Could not get JPEG representation of UIImage")
                               return
                           }
                        
                        for (key, value) in params {
                            if key == "image"{
                                multipartFormData.append(imageData, withName: "image" , fileName: doceditimagenameof, mimeType: "image/jpg")
                            }
                        }
                        
                        print("Multi part Content -Type")
                        print(multipartFormData.contentType)
                        print("Multi part FIN ")
                        print("Multi part Content-Length")
                        print(multipartFormData.contentLength)
                        print("Multi part Content-Boundary")
                        print(multipartFormData.boundary)
                        
                },
                    to: url, method: .post , headers: headers)
                    .response { reaponse in
                    print(reaponse)
                        if reaponse.value != nil {
                        switch reaponse.result{
                        case .success(let data):
                        do{
                        let json = try JSONDecoder().decode(DoctorEditProfileModel.self, from: data ?? Data())
                        if json.status == "200" {
                        print(json)
                        print("Account Edit Successfull")
                    // Helper.saveUser(json)
                        complition("",false)
                              }
                        else
                       {
                           complition(json.message ?? "",true)
                       }
                 }
                       
                    catch{
                    complition(error.localizedDescription,true)
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
        
    
}

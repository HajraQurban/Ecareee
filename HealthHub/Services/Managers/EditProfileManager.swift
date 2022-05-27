//
//  EditProfileManager.swift
//  HealthHub
//
//  Created by OBS on 10/01/2022.
//

import Foundation
import Alamofire


class EditProfileManager{
    
    func editprofile(params : [String:Any],complition: @escaping(String,Bool) -> Void){
     
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.edit_profile
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json",
            "Content-type": "multipart/form-data; boundary=<calculated when request is sent>"
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                                
                if pdfDataForDisease.count != 0{
                    multipartFormData.append(pdfDataForDisease, withName: "medical_record" , fileName: filenameof, mimeType: "application/pdf")
                }
                
                
                for (key, value) in params {
                    if key == "illness_id"{
                        for illness  in value as! [String]{
                            multipartFormData.append(((illness as? String)?.data(using: .utf8))!, withName: "illness_id[]")
                        }
                        
                    }else if  key != "image"{
                        multipartFormData.append(((value as? String)?.data(using: .utf8))!, withName: key)
                    }
                }
                
                guard let imageData = editimageName1.jpegData(compressionQuality: 0.5) else {
                    print("Could not get JPEG representation of UIImage")
                    return
                }
                
    
                for (key, value) in params {
                    if key == "image"{
                        multipartFormData.append(imageData, withName: "image" , fileName: editimagenameof, mimeType: "image/jpg")
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
                            let json = try JSONDecoder().decode(EditModel.self, from: data ?? Data())
                            if json.status == "200" {
                                print(json)
                                print("Account Edit Successfull")
                                // Helper.saveUser(json)
                                complition("",false)
                            }
                            else
                            {
                                complition(json.message ?? "",true)
                                print("Invalid User")
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

//
//  SignupManager.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import Alamofire

class DoctorSignUpManager{
    
    func signup(params : [String:Any],complition: @escaping(String,Bool) -> Void){
        
        if (!detectNetwork()) {
            complition("Network Error!",true)

        }
        
        let url = URLConstants.signup
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(AppUserDefault.shared.accessToken ?? "")",
            "Accept" : "application/json",
            "Content-type": "multipart/form-data"
        ]
        
        //  Try this after your parameters, with your URL
        
        AF.upload(
            multipartFormData: { multipartFormData in
                
                guard let imageData = docimageName1!.jpegData(compressionQuality: 0.5) else {
                    print("Could not get JPEG representation of UIImage")
                    return
                }
                
                
                for (key, value) in params {
                    multipartFormData.append(((value ?? "") as? String)!.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                }
                
                multipartFormData.append(imageData, withName: "image" , fileName: "image.jpg", mimeType: "image/jpg")
                
                
            },
            to: url, method: .post , headers: headers)
            .response {
                reaponse in
                print(reaponse)
                if reaponse.value != nil {
                    switch reaponse.result{
                    case .success(let data):
                        do{
                            let json = try JSONDecoder().decode(SignupModel.self, from: data ?? Data())
                            if json.status == "200" {
                                print(json)
                                
                                print("Account Created Successfull")
                                //   Helper.saveUser1(json)
                                
                                complition(json.message ?? "",false)
                            }
                            else
                            {
                                
                                let concateerror = (json.Error?.email?.first ?? "")! + "" + (json.Error?.password?.first ?? "")!
                              //  + "" + (json.message ?? "")!
                                complition(concateerror,true)
                                //                            complition((json.Error?.email.first ?? "") ?? "",true)
                                // complition(json.message ?? "",true)
                                
                                print("Invalid User")
                            }
                        }
                        
                        catch{
                            complition("Unathenticated",true)
                            print(String(describing: error))
                            print(error)
                        }
                        
                    case .failure(let err):
                        complition(err.localizedDescription,true)
                        print(err.localizedDescription)
                        print(String(describing: err))
                        
                    }
                    
                }
                
            }
        
    }
    
}

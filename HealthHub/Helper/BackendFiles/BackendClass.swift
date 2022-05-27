//
//  BackendClass.swift
//  HealthHub
//
//  Created by mac on 13/12/2021.
//

import UIKit
import Reachability

enum BackendClassReturnValue {
    case OK
    case NetworkError
    case UnknowError
    case WrongLogin
}

// There are  protocols define
protocol BackendClassResultDelegate {
    func didGetprofileData(_ success: BackendClassReturnValue)
    func didGeAllCertData(_ success: BackendClassReturnValue)
}

// There are option protocols
extension BackendClassResultDelegate {
    func didGetprofileData(_ success: BackendClassReturnValue) {}
    func didGeAllCertData(_ success: BackendClassReturnValue) {}
    
}

// Optional protocols end



class BackendClass: NSObject {
    
    static let sharedInstance = BackendClass()

//    var actView: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var titleLabel: UILabel = UILabel()
    var view : UIView = UIView()
    
    var BackendToken: String = ""
    
    //Development server
//    let WEBURL = "http://www.massolabs.com/certifly/"

    //live server PUBLIC
//    let WEBURL = "https://certiflyapi.massolabs.com/certifly/"//"http://ec2-18-135-196-87.eu-west-2.compute.amazonaws.com/"
    // AWS
    let WEBURL =  "http://192.168.18.106:8000/api/"//"https://api.certifly.co/"
    // Delegate method
    var delegate: BackendClassResultDelegate?

    // Variables
    var userProfiles = [[String: Any]]()
    var allCertData  = [[String: Any]]()
    var qrResult = Bool()
    var forgotPasswordDone = Bool()
    var pendingCertCount = String()
    

    
    override init() {
        super.init()
        if  (UserDefaults.standard.string(forKey: "BackendToken") != nil)
        {
            BackendToken = UserDefaults.standard.string(forKey: "BackendToken")!
        }
    }
}

extension BackendClass {
    
    /**
     Get  token status
     
     Return:
     - false: not token
     - true:  we have a token
     
     */
   func currentTokenStatus () -> Bool {
        if (BackendToken != "") {
            return true
        } else {
            return false
        }
    }
   
    /**
     Get  network  status
     
     Return:
     - false: not Network
     - true:  we have a Network
     
     */
    func detectNetwork() -> Bool  {
        var net = true
        let reachability = try! Reachability()
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            net = false
        }
        return net
    }
    

}


extension BackendClass {
    
    func joinRoom(identity:String,name: String,completionHandler: @escaping (String,String,Bool) -> Void) {
        
        if (!detectNetwork()) {
            completionHandler("","Network Error!",true)

        }

//        if (!currentTokenStatus()) {
//            completionHandler("","Token Error!",true)
//        }
//
        
        var request = URLRequest(url: URL(string: URLConstants.join_room)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer " + self.BackendToken,forHTTPHeaderField: "Authorization")
        let postString =  ["identity": identity,"room_name": name]
    
        guard let httpBody = try? JSONSerialization.data(withJSONObject: postString, options: [.prettyPrinted]) else {
               return
           }
        request.httpBody = httpBody
                
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data, error == nil else {
                completionHandler("",error?.localizedDescription ?? "Something went wrong!",true)
                return
            }
//
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
//
//                completionHandler("","Error",true)
//            }
            
            do
            {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                
                if let token = json["token"] as? String{
                    let name  = json["room_name"] as? String ?? ""
                    completionHandler(token,name,false)
                }else{
                    completionHandler("",json["message"] as? String ?? "Error",true)
                }
            } catch let error as NSError {
                print(error)
                completionHandler("",error.localizedDescription,true)
            }
        }
        task.resume()
    }
    
}

//
//  BaseManager.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation
import Alamofire

class BaseManager:NSObject{
    
    var sessionManager : Session
    
    
    override init(){
        var headers  = Alamofire.HTTPHeaders.default
        
        headers["Accept"] = "application/json"
        headers["Content-Type"] = "application/json"
            // create a custom session configuration
        let configuration = URLSessionConfiguration.default
            // add the headers
        configuration.headers = headers
            // create a session manager with the configuration
        self.sessionManager = Alamofire.Session(configuration: configuration)
        sessionManager = Alamofire.Session.default
    }
    
    
    
}

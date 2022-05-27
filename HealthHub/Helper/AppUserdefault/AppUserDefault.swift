//
//  AppUserDefault.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation

class AppUserDefault {
   
    static let shared = AppUserDefault()
    private init(){}
    
    // Handling in app login

    
    var accessToken : String? {
        set {
            UserDefaults.standard.set(newValue, forKey:"accessTokens" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "accessTokens")
        }
    }
    
    var fcmToken : String? {
        set {
            UserDefaults.standard.set(newValue, forKey:"fcmTokens" )
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "fcmTokens")
        }
    }
    
    
    var isLogin :  Bool? {
           set {
               UserDefaults.standard.set(newValue, forKey:"isLogin" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.bool(forKey: "isLogin")
           }
    }
    
    var isPatientLogin :  Bool? {
           set {
               UserDefaults.standard.set(newValue, forKey:"isPatientLogin" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.bool(forKey: "isPatientLogin")
           }
    }
    
    var isDoctorLogin :  Bool? {
           set {
               UserDefaults.standard.set(newValue, forKey:"isDoctorLogin" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.bool(forKey: "isDoctorLogin")
           }
    }
    
    var username :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"username" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "username")
           }
    }
    
    var useremail :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"useremail" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "useremail")
           }
    }
    
    var userpatientemail :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"userpatientemail" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "userpatientemail")
           }
    }
    
    var userdoctoremail :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"userdoctoremail" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "userdoctoremail")
           }
    }
    
    var userdoctorpassword :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"userdoctorpassword" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "userdoctorpassword")
           }
    }
    
    var userphonenum :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"userphonenum" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "userphonenum")
           }
    }
    
    var userdob :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"userdob" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "userdob")
           }
    }
    
    var usergender :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"usergender" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "usergender")
           }
    }
    
    var useraddress :   String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"useraddress" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "useraddress")
           }
    }
    
    var userpassword :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"userpassword" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "userpassword")
           }
    }

    var url :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"url" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "url")
           }
    }
    
    var smoke :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"smoke" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "smoke")
           }
    }
    
    var diabetes :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"diabetes" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "diabetes")
           }
    }
    
    
    var epilepsy :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"epilepsy" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "epilepsy")
           }
    }
    
    var allergy :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"allergy" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "allergy")
           }
    }
    
    var diabetes2 :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"diabetes2" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "diabetes2")
           }
    }
    
    var heart :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"heart" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "heart")
           }
    }
    
    var kindny :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"kindny" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "kindny")
           }
    }
    
    var arthistics :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"arthistics" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "arthistics")
           }
    }
    
    var pulmonary :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"pulmonary" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "pulmonary")
           }
    }
    
    var eatingdisorder :  String? {
           set {
               UserDefaults.standard.set(newValue, forKey:"eatingdisorder" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.string(forKey: "eatingdisorder")
           }
    }
    
    var isAppointment :  Bool? {
           set {
               UserDefaults.standard.set(newValue, forKey:"isAppointment" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.bool(forKey: "isAppointment")
           }
    }
    
    var isFirstTimeHistory :  Bool? {
           set {
               UserDefaults.standard.set(newValue, forKey:"isFirstTimeHistory" )
               UserDefaults.standard.synchronize()
           }
           get {
               return UserDefaults.standard.bool(forKey: "isFirstTimeHistory")
           }
    }
    
    
    
    
    /*
     
     var smoke = ""
     var diabetes = ""
     var epilepsy = ""
     var allergy = ""
     var diabetes2 = ""
     var heart = ""
     var kindny = ""
     var arthistics = ""
     var pulmonary = ""
     var eatingdisorder = ""
     
     */
    

    
   
 }

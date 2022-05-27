//
//  Helper.swift
//  HealthHub
//
//  Created by OBS on 27/12/2021.
//

import Foundation
import UIKit

class Helper{
    
   static func validateEmail(_ email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: email)
    }
    
    static func validatePassword(_ email: String) -> Bool {
        let password = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
         return password.evaluate(with: email)
     }
    
    static func saveUser(_ user: SigninModel){
        AppUserDefault.shared.username = user.data?.name
        AppUserDefault.shared.useremail = user.data?.email
        AppUserDefault.shared.userphonenum = user.data?.contact
        AppUserDefault.shared.userdob = user.data?.date_of_birth
        AppUserDefault.shared.usergender = user.data?.gender
        AppUserDefault.shared.useraddress = user.data?.address
        AppUserDefault.shared.url = user.data?.url
        AppUserDefault.shared.isLogin = true
        AppUserDefault.shared.accessToken = user.accessToken
    
    }
    
    static func saveUser2(_ user: UserProfileModel){
        AppUserDefault.shared.username = user.data?.name
        AppUserDefault.shared.useremail = user.data?.email
        AppUserDefault.shared.userphonenum = user.data?.contact
        AppUserDefault.shared.userdob = user.data?.date_of_birth
        AppUserDefault.shared.usergender = user.data?.gender
        AppUserDefault.shared.useraddress = user.data?.address
        AppUserDefault.shared.isLogin = true
        AppUserDefault.shared.accessToken = user.data?.url
    
    }
    
    
    static func saveUser1(_ user: SignupModel){
        AppUserDefault.shared.username = user.data?.name
        AppUserDefault.shared.useremail = user.data?.email
        AppUserDefault.shared.userphonenum = user.data?.contact
        AppUserDefault.shared.userdob = user.data?.date_of_birth
        AppUserDefault.shared.usergender = user.data?.gender
        AppUserDefault.shared.url = user.data?.url
        AppUserDefault.shared.isLogin = true
        AppUserDefault.shared.accessToken = user.accessToken
        
    }
    
    static func clearUser(){
        AppUserDefault.shared.username = ""
        AppUserDefault.shared.useremail = ""
        AppUserDefault.shared.userphonenum = ""
        AppUserDefault.shared.userdob = ""
        AppUserDefault.shared.usergender = ""
        AppUserDefault.shared.useraddress = ""
        AppUserDefault.shared.url = ""
        AppUserDefault.shared.isLogin = false
        AppUserDefault.shared.isPatientLogin = false
        AppUserDefault.shared.isDoctorLogin = false
        AppUserDefault.shared.isAppointment = false
        AppUserDefault.shared.userdoctoremail = ""
        AppUserDefault.shared.userdoctorpassword = ""
        AppUserDefault.shared.userpatientemail = ""
        AppUserDefault.shared.userpassword = ""
        AppUserDefault.shared.accessToken = ""
//        AppUserDefault.shared.fcmToken = ""
    }
    
}


func alertWithMsg(vc:UIViewController,msg:String,title:String){
    
    let alert = UIAlertController(title: title, message: msg,         preferredStyle: UIAlertController.Style.alert)

    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        //Cancel Action
        
    }))
//    alert.addAction(UIAlertAction(title: title,
//                                  style: UIAlertAction.Style.default,
//                                  handler: {(_: UIAlertAction!) in
//                                    //Sign out action
 //   }))
    vc.present(alert, animated: true, completion: nil)
}

//extension UITextField{
//    func setupToolbar(textfield : UITextField, view: UIView){
//            //Create a toolbar
//            let bar = UIToolbar()
//            
//            //Create a done button with an action to trigger our function to dismiss the keyboard
//            let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissMyKeyboard))
//            
//            //Create a felxible space item so that we can add it around in toolbar to position
//            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        
//            //Add the created button items in the toobar
//            bar.items = [flexSpace, flexSpace, doneBtn]
//                bar.sizeToFit()
//                
//                //Add the toolbar to our textfield
//                textfield.inputAccessoryView = bar
//            }
//            
//            @objc func dismissMyKeyboard(){
//                view.endEditing(true)
//            }
//
//
//}


public extension UITextField {

    func addToolbarInputAccessoryView(toolbarHeight: CGFloat) {
        let timeCancelButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action:#selector(endEditing(_:)))
        timeCancelButton.tintColor = UIColor.blue
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let toolbar = UIToolbar()

        toolbar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: toolbarHeight)
        toolbar.items = [dateFlexSpace,timeCancelButton]
        toolbar.isTranslucent = false
    //    toolbar.barTintColor = .selectedBtn
        toolbar.contentMode = .right

        inputAccessoryView = toolbar
    }


//    fileprivate func setPasswordToggleImage(_ button: UIButton) {
//    if(isSecureTextEntry){
//        let img = UIImage(systemName: "eye.fill" )
//
//        button.setImage(img!.maskWithColor(color: .black), for: .normal)
//    }else{
//        let img = UIImage(systemName: "eye.slash.fill")
//        button.setImage(img!.maskWithColor(color: .black), for: .normal)
//
//    }
//        }

//    func enablePasswordToggle(){
//    let button = UIButton(type: .custom)
//    setPasswordToggleImage(button)
//    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
//    button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
//        button.contentMode = .scaleAspectFill
//        button.clipsToBounds = false
//    button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
//    self.rightView = button
//    self.rightViewMode = .always
//    }
//    @objc func togglePasswordView(_ sender: Any) {
//    self.isSecureTextEntry = !self.isSecureTextEntry
//    setPasswordToggleImage(sender as! UIButton)
//    }
}


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
 
var symptopdata : [SysmtopmData]? = []
var doctor_id1 = 0


var email_password = ""

var vSpinner: UIView?

extension UIViewController {
//  @available(iOS 13.0, *)
//  func showSpinner(onView : UIView) {
//    let spinnerView = UIView.init(frame: onView.bounds)
//    spinnerView.backgroundColor = UIColor.clear//UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//    let ai = UIActivityIndicatorView.init(style: .large)
//    ai.color = .black
//    ai.startAnimating()
//    ai.center = spinnerView.center
//    DispatchQueue.main.async {
//      spinnerView.addSubview(ai)
//      onView.addSubview(spinnerView)
//    }
//    vSpinner = spinnerView
//  }
//  func removeSpinner() {
//    DispatchQueue.main.async {
//      vSpinner?.removeFromSuperview()
//      vSpinner = nil
//    }
//  }
}



class ActivityIndicator {
  static var shared = ActivityIndicator()

    var vSpinner: UIView?
    
    func showSpinner(onView : UIView) {
          let spinnerView = UIView.init(frame: onView.bounds)
          spinnerView.backgroundColor = UIColor.clear//UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
          let ai = UIActivityIndicatorView.init(style: .large)
          ai.color = .black
          ai.startAnimating()
          ai.center = spinnerView.center
          DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
          }
        self.vSpinner = spinnerView
    }
    
    func removeSpinner() {
      DispatchQueue.main.async {
          self.vSpinner?.removeFromSuperview()
          self.vSpinner = nil
      }
    }
}



//For Doctor Helper Things

var isHworking = ""


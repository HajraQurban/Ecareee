//
//  ForgotPasswordController.swift
//  HealthHub
//
//  Created by OBS on 24/12/2021.
//

import UIKit
import Alamofire
//import RSLoadingView

class ForgotPasswordController: BaseController {

    lazy var ForgettitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Forgot password?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var resetdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Reset here"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 14)
        lbl.text = "Please enter your registered email"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var EmailTextFieldlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Email"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmailTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "richard@gmail.com"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.autocorrectionType = .no
        tf.keyboardType  = .emailAddress
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var SendBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Send", for: .normal)
        btn.addTarget(self, action: #selector(sendbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    let manager = ForgotPasswordManager()
//    let loadingView = RSLoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLbl.text = "Forgot Password"
        backBtn.tintColor = .white
        setup()
    }
    
    func setup()
    {
        childView.addSubview(ForgettitleLbl)
        childView.addSubview(resetdescLbl)
        childView.addSubview(descLbl)
        childView.addSubview(EmailTextFieldView)
        childView.addSubview(EmailTextFieldlbl)
        childView.addSubview(EmailTF)
        childView.addSubview(SendBtn)
        
        NSLayoutConstraint.activate([
        
            ForgettitleLbl.topAnchor.constraint(equalTo: childView.topAnchor, constant: 59 * appConstant.heightRatio),
            ForgettitleLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 21 * appConstant.heightRatio),
            ForgettitleLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            resetdescLbl.topAnchor.constraint(equalTo: ForgettitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            resetdescLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 21 * appConstant.heightRatio),
            resetdescLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            
            descLbl.topAnchor.constraint(equalTo: resetdescLbl.bottomAnchor, constant: 49 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 21 * appConstant.heightRatio),
            descLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            EmailTextFieldView.topAnchor.constraint(equalTo: descLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            EmailTextFieldView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            EmailTextFieldView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            EmailTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            EmailTextFieldlbl.topAnchor.constraint(equalTo: EmailTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            EmailTextFieldlbl.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            EmailTextFieldlbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            EmailTF.topAnchor.constraint(equalTo: EmailTextFieldlbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            EmailTF.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            EmailTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        
            SendBtn.topAnchor.constraint(equalTo: EmailTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            SendBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            SendBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SendBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
        ])
        
        
    }
   
    @objc func sendbtn_press()
    {
        ForgotPasswordServiceCall()
        
    }

    func ForgotPasswordServiceCall()  {
        
        
        let params = [
            "email":EmailTF.text!,
            ]
        
     //   let strUrl = "forgotPassword?"
        
        
        
    //    loadingView.show(on: view)
        ActivityIndicator.shared.showSpinner(onView: self.view)
        manager.setforgotpassword(params: params) { data , msg, hasError  in
        //    RSLoadingView.hide(from: self.view)
            ActivityIndicator.shared.removeSpinner()
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                alertWithMsg(vc: self, msg: "Your Password Update Successfully Your New Password Is \(data?.new_password ?? "")", title: "Alert!")
                email_password = data?.new_password ?? ""
                self.navigationController?.pushViewController(SigninController(), animated: true)
            

            }
        }
    }
    
    
}

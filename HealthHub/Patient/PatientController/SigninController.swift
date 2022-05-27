//
//  SigninController.swift
//  HealthHub
//
//  Created by OBS on 11/12/2021.
//

import UIKit
import Alamofire
//import RSLoadingView
import FacebookLogin
import GoogleSignIn
import LGSideMenuController
import SwiftUI



var acesstoken : String?

class SigninController: BaseController {
    
    
    lazy var welcomeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Welcome!"
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
        lbl.font = bold(size: 24)
        lbl.text = "take your health in your hands"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var NameTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var NameTextFieldlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Name"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var NameTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Username"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var NameValidationIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "CirclecheckIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var EmailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var EmailTextFieldlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "Email"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmailValidationIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "CirclecheckIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var EmailTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Email"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var PasswordTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var PasswordTextFieldlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "Password"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var passwordIcon : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.tintColor =  UIColor(named: Colors.TextColor)
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "EyeIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(passhiddenbtn_press), for: .touchUpInside)
        return btn
    }()
    

    
    lazy var PasswordTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Password"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var signinBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Sign In", for: .normal)
        btn.addTarget(self, action: #selector(signinbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var forgotpasswordBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.layer.shadowOpacity = 0
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("Forgot Password?", for: .normal)
        btn.addTarget(self, action: #selector(forgotbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var MediaAccountslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .center
        lbl.font = regular(size: 13)
        lbl.text = "Or you can connect with any of your social media accounts"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var socialView : UIView = {
        let view = UIView()
       // view.backgroundColor = .red
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var FacebookBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "FacebookIcon"), for: .normal)
        btn.addTarget(self, action: #selector(facebookbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var GoogleBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "GoogleIcon"), for: .normal)
        btn.addTarget(self, action: #selector(googlebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var TwitterBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "TwitterIcon"), for: .normal)
//        btn.addTarget(self, action: #selector(facebookbtn_press), for: .touchUpInside)
      
        return btn
    }()
   
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.translatesAutoresizingMaskIntoConstraints = false
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//    let loadingView = RSLoadingView()
    let manager = signinManagers()
    let socialmanager = SocialloginManager()
    var imgtoggle:Bool = true
    
    let signInConfig = GIDConfiguration.init(clientID: appConstant.GOOGLE_CLIENT_ID)
    
    //
    var name = ""
    var socialid = ""
    var email = ""
    var image : URL!
    
    var loginasDoctor = ""
    
    var type = ""
    var type1 = ""
    
    var isfromdoctorSignup = "DoctorSignup"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //We make a call to our keyboard handling function as soon as the view is loaded.
//        initializeHideKeyboard()

        backBtn.tintColor = .white
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        childView.backgroundColor = UIColor(named: Colors.AppBGColor)
        containerView.backgroundColor = UIColor(named: Colors.AppBGColor)

//        EmailTF.delegate = self
//        NameTF.delegate = self
        EmailTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .allEvents)
        NameTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .allEvents)

        NameValidationIcon.isHidden = true
        EmailValidationIcon.isHidden = true
      
        if let token = AccessToken.current,
            !token.isExpired {
            // User is logged in, do work such as go to next view controller.
        }
        
       // validate()
        setup()
        passwordIcon.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        PasswordTF.isSecureTextEntry = true
        if type == "Doctor"
        {
        self.welcomeLbl.text = "Welcome Doctor!"
        descLbl.text = loginasDoctor
        EmailTF.text = AppUserDefault.shared.userdoctoremail
        self.PasswordTF.text = AppUserDefault.shared.userdoctorpassword
        }
        else
        {
        self.welcomeLbl.text = "Welcome Patient!"
        descLbl.text = "Take Your Health In Your Hands"
        EmailTF.text = AppUserDefault.shared.userpatientemail
        PasswordTF.text = AppUserDefault.shared.userpassword
        }
    }
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(welcomeLbl)
        containerView.addSubview(descLbl)
//        containerView.addSubview(NameTextFieldView)
//        containerView.addSubview(NameTextFieldlbl)
//        containerView.addSubview(NameValidationIcon)
//        containerView.addSubview(NameTF)
        containerView.addSubview(EmailTextFieldView)
        containerView.addSubview(EmailTextFieldlbl)
        containerView.addSubview(EmailTF)
        containerView.addSubview(EmailValidationIcon)
        containerView.addSubview(PasswordTextFieldView)
        containerView.addSubview(PasswordTextFieldlbl)
        containerView.addSubview(PasswordTF)
        containerView.addSubview(passwordIcon)
        containerView.addSubview(signinBtn)
        containerView.addSubview(forgotpasswordBtn)
        containerView.addSubview(MediaAccountslbl)
        containerView.addSubview(socialView)
        socialView.addSubview(FacebookBtn)
        socialView.addSubview(GoogleBtn)
        socialView.addSubview(TwitterBtn)
                        
        NSLayoutConstraint.activate([
            
            welcomeLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 59 * appConstant.heightRatio),
            welcomeLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 21 * appConstant.heightRatio),
            welcomeLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            descLbl.topAnchor.constraint(equalTo: welcomeLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 21 * appConstant.heightRatio),
            descLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
//            NameTextFieldView.topAnchor.constraint(equalTo: descLbl.bottomAnchor, constant: 23 * appConstant.heightRatio),
//            NameTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
//            NameTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
//            NameTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
//
//            NameTextFieldlbl.topAnchor.constraint(equalTo: NameTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
//            NameTextFieldlbl.leadingAnchor.constraint(equalTo: NameTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
//            NameTextFieldlbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
//
//            NameTF.topAnchor.constraint(equalTo: NameTextFieldlbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
//            NameTF.leadingAnchor.constraint(equalTo: NameTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
//            NameTF.trailingAnchor.constraint(equalTo: NameValidationIcon.leadingAnchor, constant: -10 * appConstant.widthRatio),
//            NameTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
//
//            NameValidationIcon.centerYAnchor.constraint(equalTo: NameTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            NameValidationIcon.topAnchor.constraint(equalTo: NameTextFieldView.topAnchor, constant: 29 * appConstant.heightRatio),
//            NameValidationIcon.trailingAnchor.constraint(equalTo: NameTextFieldView.trailingAnchor, constant: -12 * appConstant.widthRatio),
//            NameValidationIcon.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
//            NameValidationIcon.widthAnchor.constraint(equalToConstant: 22 * appConstant.widthRatio),

            
            EmailTextFieldView.topAnchor.constraint(equalTo: descLbl.bottomAnchor, constant: 40 * appConstant.heightRatio),
            EmailTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            EmailTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            EmailTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            EmailTextFieldlbl.topAnchor.constraint(equalTo: EmailTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            EmailTextFieldlbl.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmailTextFieldlbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            EmailTF.topAnchor.constraint(equalTo: EmailTextFieldlbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            EmailTF.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmailTF.trailingAnchor.constraint(equalTo: EmailValidationIcon.leadingAnchor, constant: -10 * appConstant.widthRatio),
            EmailTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            EmailValidationIcon.centerYAnchor.constraint(equalTo: EmailTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
            EmailValidationIcon.topAnchor.constraint(equalTo: EmailTextFieldView.topAnchor, constant: 29 * appConstant.heightRatio),
            EmailValidationIcon.trailingAnchor.constraint(equalTo: EmailTextFieldView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            EmailValidationIcon.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
            EmailValidationIcon.widthAnchor.constraint(equalToConstant: 22 * appConstant.widthRatio),
            
            PasswordTextFieldView.topAnchor.constraint(equalTo: EmailTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PasswordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            PasswordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            PasswordTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            PasswordTextFieldlbl.topAnchor.constraint(equalTo: PasswordTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            PasswordTextFieldlbl.leadingAnchor.constraint(equalTo: PasswordTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PasswordTextFieldlbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            PasswordTF.topAnchor.constraint(equalTo: PasswordTextFieldlbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            PasswordTF.leadingAnchor.constraint(equalTo: PasswordTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PasswordTF.trailingAnchor.constraint(equalTo: passwordIcon.leadingAnchor, constant: -10 * appConstant.widthRatio),
            PasswordTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            passwordIcon.centerYAnchor.constraint(equalTo: passwordIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            passwordIcon.topAnchor.constraint(equalTo: PasswordTextFieldView.topAnchor, constant: 29 * appConstant.heightRatio),
            passwordIcon.trailingAnchor.constraint(equalTo: PasswordTextFieldView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            passwordIcon.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
            passwordIcon.widthAnchor.constraint(equalToConstant: 22 * appConstant.widthRatio),
            
            signinBtn.topAnchor.constraint(equalTo: PasswordTextFieldView.bottomAnchor, constant: 39 * appConstant.heightRatio),
            signinBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            signinBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            signinBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            forgotpasswordBtn.topAnchor.constraint(equalTo: signinBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            forgotpasswordBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 135 * appConstant.widthRatio),
            forgotpasswordBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -133 * appConstant.widthRatio),
            forgotpasswordBtn.heightAnchor.constraint(equalToConstant: 14 * appConstant.heightRatio),
            
            MediaAccountslbl.topAnchor.constraint(equalTo: forgotpasswordBtn.bottomAnchor, constant: 24 * appConstant.heightRatio),
            MediaAccountslbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 28 * appConstant.widthRatio),
            MediaAccountslbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -30 * appConstant.widthRatio),
            MediaAccountslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            socialView.topAnchor.constraint(equalTo: MediaAccountslbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            socialView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            socialView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            socialView.heightAnchor.constraint(equalToConstant: 52 * appConstant.heightRatio),
            socialView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -120 * appConstant.heightRatio),

            
            FacebookBtn.topAnchor.constraint(equalTo: socialView.topAnchor, constant: 2 * appConstant.heightRatio),
         //   FacebookBtn.leadingAnchor.constraint(equalTo: socialView.leadingAnchor,constant: 70 * appConstant.widthRatio),
            FacebookBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            FacebookBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
//            FacebookBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio),

            
            GoogleBtn.centerXAnchor.constraint(equalTo: socialView.centerXAnchor, constant: 0 * appConstant.heightRatio),

            GoogleBtn.centerYAnchor.constraint(equalTo: socialView.centerYAnchor, constant: 0 * appConstant.heightRatio),
         //   GoogleBtn.topAnchor.constraint(equalTo: socialView.topAnchor, constant: 2 * appConstant.heightRatio),
            GoogleBtn.leadingAnchor.constraint(equalTo: FacebookBtn.trailingAnchor,constant: 25 * appConstant.widthRatio),
            GoogleBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            GoogleBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            

            
            TwitterBtn.centerYAnchor.constraint(equalTo: GoogleBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
       //     TwitterBtn.topAnchor.constraint(equalTo: socialView.topAnchor, constant: 20 * appConstant.heightRatio),
            TwitterBtn.leadingAnchor.constraint(equalTo: GoogleBtn.trailingAnchor,constant: 25 * appConstant.widthRatio),
            TwitterBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            TwitterBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
//            TwitterBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            
            
            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio)
        
        ])
    }
    
    @objc func signupbtn_press(){

      //  self.navigationController?.pushViewController(DoctorCategoryController(), animated: true)
    }
    
    @objc func signinbtn_press(){
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "All fields requird", title: "Error!")
        }else{
            let parameters: [String: AnyObject] = [
              "email" : EmailTF.text as AnyObject,
              "password" : PasswordTF.text as AnyObject,
              "fcm_token" : AppUserDefault.shared.fcmToken as AnyObject
          ]
            ActivityIndicator.shared.showSpinner(onView: self.view)
        //    loadingView.show(on: view)
                //  Try this after your parameters, with your URL
            // AF.request(url, method: .post, headers: headers).responseJSON
            manager.signin(params: parameters) { usertype, msg, hasError in
                ActivityIndicator.shared.removeSpinner()
            //    RSLoadingView.hide(from: self.view)
                if hasError{
                    alertWithMsg(vc: self, msg: msg, title: "Error!")
                }else{
                    
                    if self.isfromdoctorSignup == "DoctorSignup"
                    {
                    if usertype == "Doctor" && usertype == self.type1
                    {
                        AppUserDefault.shared.userdoctorpassword = self.PasswordTF.text
                        AppUserDefault.shared.userdoctoremail = self.EmailTF.text
                        let vc = DoctorCustomTabbarController()
                        vc.selectedIndex = 2
                        let rootNC = UINavigationController(rootViewController: vc)
                        rootNC.navigationBar.isHidden = true
                        UIApplication.shared.windows.first?.rootViewController = rootNC
                        UIApplication.shared.windows.first?.makeKeyAndVisible()

                    }
                    else if usertype == "Patient" && usertype == self.type1
                    {
                        AppUserDefault.shared.userpatientemail = self.EmailTF.text
                        AppUserDefault.shared.userpassword = self.PasswordTF.text
                        if AppUserDefault.shared.isFirstTimeHistory ?? false{
                            let vc = CustomTabBarController()
                            let rootNC = UINavigationController(rootViewController: vc)
                            rootNC.navigationBar.isHidden = true
                            UIApplication.shared.windows.first?.rootViewController = rootNC
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }else{
                            let vc = GetStartedController()
                            vc.name = self.NameTF.text ?? ""
                            AppUserDefault.shared.isFirstTimeHistory = true
                            let rootNC = UINavigationController(rootViewController: vc)
                            rootNC.navigationBar.isHidden = true
                            UIApplication.shared.windows.first?.rootViewController = rootNC
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }
                           
                    }
                    alertWithMsg(vc: self, msg: "Pick Up the right User type", title: "Alert!")
                }
                else
                {
                    if usertype == "Doctor"
                    {
                        AppUserDefault.shared.userdoctorpassword = self.PasswordTF.text
                        AppUserDefault.shared.userdoctoremail = self.EmailTF.text
                        let vc = DoctorCustomTabbarController()
                        vc.selectedIndex = 2
                        let rootNavigationController = UINavigationController(rootViewController: vc)
                        rootNavigationController.navigationBar.isHidden = true
                        let leftViewController = SideMenuViewController()
                        // 3. Create instance of LGSideMenuController with above controllers as root and left.
                        let sideMenuController = LGSideMenuController(rootViewController: rootNavigationController,
                                                                      leftViewController: leftViewController)
                        // 4. Set presentation style by your taste if you don't like the default one.
                        sideMenuController.leftViewPresentationStyle = .slideAbove
                        sideMenuController.isLeftViewSwipeGestureEnabled = false

                        // 5. Set width for the left view if you don't like the default one.
                        sideMenuController.leftViewWidth = 300 * appConstant.widthRatio
                        // 6. Make it `rootViewController` for your window.
                        //      self.window = UIWindow(frame: UIScreen.main.bounds)
                        self.view?.window?.rootViewController = sideMenuController
                        self.view?.window?.makeKeyAndVisible()

                    }
                    else if usertype == "Patient"
                    {
                        AppUserDefault.shared.userpatientemail = self.EmailTF.text
                        AppUserDefault.shared.userpassword = self.PasswordTF.text
                        if AppUserDefault.shared.isFirstTimeHistory ?? false{
                            let vc = CustomTabBarController()
                            let rootNC = UINavigationController(rootViewController: vc)
                            rootNC.navigationBar.isHidden = true
                            UIApplication.shared.windows.first?.rootViewController = rootNC
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }else{
                            let vc = GetStartedController()
                            vc.name = self.NameTF.text ?? ""
                            AppUserDefault.shared.isFirstTimeHistory = true
                            let rootNC = UINavigationController(rootViewController: vc)
                            rootNC.navigationBar.isHidden = true
                            UIApplication.shared.windows.first?.rootViewController = rootNC
                            UIApplication.shared.windows.first?.makeKeyAndVisible()
                        }
                           
                    }
                }
                    
            }
        }
    }
        
         
}
    
    @objc func facebookbtn_press(sender: UIButton){
        self.loginButtonClicked()
    }
    
    @objc func googlebtn_press(sender: UIButton){
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
           guard error == nil else { return }

           // If sign in succeeded, display the app's main content View.
            guard error == nil else { return }
               guard let user = user else { return }
            
            print(user.profile)
            self.email = user.profile?.email ?? ""

            self.name = user.profile?.name ?? ""
//               let givenName = user.profile?.givenName
//               let familyName = user.profile?.familyName
            self.socialid = user.userID ?? ""
            self.image = user.profile?.imageURL(withDimension: 320)
            self.Social_login()
         }
        
    }
    
    
    
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile","email"], from: self) { result, error in
            // Process result or error
            print("The Facebook Result\(String(describing: result))")
            
            Profile.loadCurrentProfile { profile, error in
                if error != nil{
                    print(error)
                    return
                }
                
                print(profile)
                self.name = profile?.name ?? ""
                self.email = profile?.email ?? ""
                self.socialid  = profile?.userID ?? ""
                self.image = (profile?.imageURL ?? URL(string: "dskjbesjk"))
//                self.Social_login()
            }
            
            
        }
        
    }
    
    
    
    func Social_login(){
        
        let parameters: [String: AnyObject] = [
          "name" : name as AnyObject,
          "social_id" : socialid as AnyObject,
          "email" : email as AnyObject,
          "image" : image as AnyObject
      ]
        ActivityIndicator.shared.showSpinner(onView: self.view)
        socialmanager.setsociallogin(params: parameters) { msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
                
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
               
                let vc = CustomTabBarController()
                let rootNC = UINavigationController(rootViewController: vc)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
//                self.navigationController?.pushViewController(CustomTabBarController(), animated: true)
            }
        }
        
    }
    
    @objc func passhiddenbtn_press(){

        imgtoggle = !imgtoggle
           if imgtoggle {
               passwordIcon.setImage(UIImage(named: "EyeIcon"), for: .normal)
               PasswordTF.isSecureTextEntry = false

           } else {
               passwordIcon.setImage(UIImage(systemName: "eye.slash"), for: .normal)
               PasswordTF.isSecureTextEntry = true
           }
        
    }

    @objc func forgotbtn_press(){
        self.navigationController?.pushViewController(ForgotPasswordController(), animated: true)
    }
    
    func initializeHideKeyboard(){
    //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
    target: self,
    action: #selector(dismissMyKeyboard))
    //Add this tap gesture recognizer to the parent view
    containerView.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissMyKeyboard(){
    //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
    //In short- Dismiss the active keyboard.
    view.endEditing(true)
    }
    
    
}

//textfield delegates
extension SigninController:UITextFieldDelegate{
    
    @objc
    func textFieldDidChange(textField: UITextField) {
//       if textField == NameTF
//        {
//           if textField.text!.count > 3{
//               NameValidationIcon.isHidden = false
//           }
//           else
//           {
//               NameValidationIcon.isHidden = true
//           }
//       }
         if textField == EmailTF
        {
            if Helper.validateEmail(EmailTF.text!) {
                
                EmailValidationIcon.isHidden = false
            }
            else
            {
                EmailValidationIcon.isHidden = true
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == EmailTF{
            PasswordTF.becomeFirstResponder()
        }else{
            view.endEditing(true)
        }
       return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.reloadInputViews()
        return true
    }
}



extension SigninController
{
    func validate() -> (String?, Bool) {
     //   let name = NameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = EmailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)

//        if name!.count  <= 2 {
//            return("Name is required.", false)
//        }
        
        if email?.count == 0 {
            return("Email or Phone is required.", false)
        }
        if !Helper.validateEmail(EmailTF.text!) {
            return("Please enter correct email.", false)
        }
        if password?.count == 0 {
            return("Password is required.", false)
        }
//        if !Helper.validatePassword(passwordTF.text!) {
//            return("Please enter correct Password", false)
//        }
        return(nil,true)
    }
    
}

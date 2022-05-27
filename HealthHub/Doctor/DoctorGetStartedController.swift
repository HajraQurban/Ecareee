//
//  DoctorGetStartedController.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import UIKit

class DoctorGetStartedController: UIViewController {

    lazy var Getstartedlogo : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Onboarding4")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    

    lazy var backcurleimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backcurleimg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
//        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    

    lazy var heading : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = bold(size: 24)
        lbl.text = "Get a prescription"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .right
        lbl.font = regular(size: 15)
        lbl.text = "Connect with your MD and be prepared before you meet. "
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var getstartedBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Register", for: .normal)
        btn.addTarget(self, action: #selector(getstartedbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var signinBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitle("Sign In", for: .normal)
//        btn.layer.borderWidth = 1  * appConstant.heightRatio
//        btn.layer.borderColor =  UIColor(named:Colors.ButtonBG)?.cgColor
        btn.addTarget(self, action: #selector(signupbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    var gotouser = "Doctor"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupofUI()
    }
    
    func setupofUI(){
        let margin = view.layoutMarginsGuide
        view.addSubview(Getstartedlogo)
        view.addSubview(backcurleimg)
        view.addSubview(heading)
        view.addSubview(descLbl)

        view.addSubview(getstartedBtn)
        view.addSubview(signinBtn)
        
        
        NSLayoutConstraint.activate([
            
            
            
            Getstartedlogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Getstartedlogo.topAnchor.constraint(equalTo: margin.topAnchor,constant: 21 * appConstant.heightRatio),
            Getstartedlogo.heightAnchor.constraint(equalToConstant: 258 * appConstant.heightRatio),
            Getstartedlogo.widthAnchor.constraint(equalToConstant: 249 * appConstant.heightRatio),
            
            
            backcurleimg.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -10 * appConstant.widthRatio),
            backcurleimg.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10 * appConstant.widthRatio),
            backcurleimg.heightAnchor.constraint(equalToConstant: 350 * appConstant.heightRatio),
            backcurleimg.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 20 * appConstant.heightRatio),
            
            
            heading.topAnchor.constraint(equalTo: backcurleimg.topAnchor, constant: 20 * appConstant.heightRatio),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42 * appConstant.widthRatio),
            heading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42 * appConstant.widthRatio),
            heading.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            descLbl.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 2 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42 * appConstant.widthRatio),
            descLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42 * appConstant.widthRatio),
            
//            descLbl.bottomAnchor.constraint(equalTo: nextBtn.topAnchor,constant: -12 * appConstant.heightRatio),
            getstartedBtn.topAnchor.constraint(equalTo: descLbl.bottomAnchor, constant: 40 * appConstant.heightRatio),
            getstartedBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            getstartedBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -19 * appConstant.widthRatio),
            getstartedBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            signinBtn.topAnchor.constraint(equalTo: getstartedBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            signinBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            signinBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            signinBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            ])
        
    }
    
    @objc func getstartedbtn_press(){
        
        self.navigationController?.pushViewController(DoctorSignUpController(), animated: true)

    }
    
    @objc func signupbtn_press(){
     //   self.navigationController?.pushViewController(SigninController(), animated: true)
        let vc = SigninController()
        vc.modalPresentationStyle = .fullScreen
        vc.loginasDoctor = "A Commitment To Community."
        vc.type = "Doctor"
        vc.type1 = gotouser
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

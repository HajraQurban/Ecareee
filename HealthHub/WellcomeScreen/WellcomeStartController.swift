//
//  WellcomeStartController.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import UIKit

class WellcomeStartController: UIViewController {
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var hellotitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Hello!"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Welcomelogo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var heading : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Are you a Doctor or a Patient?"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var DoctorBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("I'm a Doctor", for: .normal)
        btn.addTarget(self, action: #selector(doctorbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var PatientBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitle("I'm a Patient", for: .normal)
        btn.layer.borderWidth = 1  * appConstant.heightRatio
        btn.layer.borderColor =  UIColor(named:Colors.PrimaryAppColor1)?.cgColor
        btn.addTarget(self, action: #selector(patientbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    
    func setupUI()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(containerView)
        view.addSubview(hellotitlelbl)
        view.addSubview(logoImage)
        view.addSubview(heading)
        view.addSubview(DoctorBtn)
        view.addSubview(PatientBtn)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            
            hellotitlelbl.topAnchor.constraint(equalTo: margin.topAnchor, constant: 70 * appConstant.heightRatio),
            hellotitlelbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            hellotitlelbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            
            
            heading.topAnchor.constraint(equalTo: hellotitlelbl.bottomAnchor, constant: -4 * appConstant.heightRatio),
            heading.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            heading.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            
            
            logoImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: heading.bottomAnchor,constant: 20 * appConstant.heightRatio),
            logoImage.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            logoImage.widthAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            
            DoctorBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20  * appConstant.heightRatio),
            DoctorBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20  * appConstant.heightRatio),
            DoctorBtn.bottomAnchor.constraint(equalTo: PatientBtn.topAnchor, constant: -20 * appConstant.heightRatio),
            DoctorBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            
            //   PatientBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0 * appConstant.heightRatio),
            PatientBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20  * appConstant.heightRatio),
            PatientBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20  * appConstant.heightRatio),
            PatientBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant:  -70 * appConstant.heightRatio),
            PatientBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            
            
        ])
    }
    
    
    @objc func doctorbtn_press(){
        
        let vc  = DoctorOnBoardingController()
        vc.gotouser = "doctor"
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc func patientbtn_press(){
        
        let vc  = OnboardingController()
        vc.gotouser = "patient"
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
}

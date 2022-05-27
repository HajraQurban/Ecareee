//
//  DoctorBackgroundHistoryView1.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import Foundation
import UIKit

protocol Doctorhistory4Delegate{
    func slider4BtnPress()
}

var Doctorhistory4Data : Doctorhistory4Delegate?

protocol DoctorGotonext
{
    func setnext()
}

class DoctorBackgroundHistoryView4: UIView {

    lazy var headtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 30)
        lbl.text = "Background Check"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var numberingtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.ButtonColor)
        lbl.textAlignment = .center
        lbl.font = regular(size: 15)
        lbl.text = "1 of 10"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "HistLogo4")
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var popView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 30 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var poptitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 30)
        lbl.text = "What is the name of the hospital?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    lazy var PasswordTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
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
        lbl.text = "Hospital name"
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
        btn.setImage(UIImage(named: "Hist4"), for: .normal)
       // btn.addTarget(self, action: #selector(passhiddenbtn_press), for: .touchUpInside)
        return btn
    }()
    

    
    lazy var PasswordTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Shield lab"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppColor)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
     //   view.layer.borderWidth = 1
       // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font = bold(size: 15)
        lbl.text = "Next"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var backbtnIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(nextbtn_press), for: .touchUpInside)
        return btn
    }()
    

    
    var delegate : DoctorGotonext?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        headerLbl.text = "Health  history"
//        view.backgroundColor = .white
//        setup()
//    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        setup()
        
        numberingtitleLbl.isHidden = true
        
  
        
    }
        
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    
    func setup()
    {
        let margin = self.layoutMarginsGuide
        self.addSubview(headtitleLbl)
        self.addSubview(numberingtitleLbl)
        self.addSubview(logoImage)
        
        self.addSubview(popView)
        popView.addSubview(poptitleLbl)
        popView.addSubview(PasswordTextFieldView)
        popView.addSubview(PasswordTextFieldlbl)
        popView.addSubview(PasswordTF)
        popView.addSubview(passwordIcon)
        popView.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
        
        
        
        
        
        NSLayoutConstraint.activate([
        
            
            headtitleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 18 * appConstant.heightRatio),
            headtitleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 39 * appConstant.heightRatio),
            headtitleLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -39 * appConstant.heightRatio),
            headtitleLbl.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            
            numberingtitleLbl.topAnchor.constraint(equalTo: headtitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            numberingtitleLbl.centerXAnchor.constraint(equalTo: headtitleLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
//            numberingtitleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 161 * appConstant.heightRatio),
            numberingtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            logoImage.topAnchor.constraint(equalTo: numberingtitleLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
          //  logoImage.centerXAnchor.constraint(equalTo: numberingtitleLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 59 * appConstant.heightRatio),
            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -59 * appConstant.heightRatio),
            logoImage.heightAnchor.constraint(equalToConstant: 210 * appConstant.heightRatio),
         //   logoImage.widthAnchor.constraint(equalToConstant: 175 * appConstant.heightRatio),
            
            
            popView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 22 * appConstant.heightRatio),
            popView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20 * appConstant.heightRatio),
            popView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20 * appConstant.heightRatio),
            popView.heightAnchor.constraint(equalToConstant: 259 * appConstant.heightRatio),
            
            
            poptitleLbl.topAnchor.constraint(equalTo: popView.topAnchor, constant: 41 * appConstant.heightRatio),
            poptitleLbl.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 17 * appConstant.heightRatio),
            poptitleLbl.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -23 * appConstant.heightRatio),
            poptitleLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            
            PasswordTextFieldView.topAnchor.constraint(equalTo: poptitleLbl.bottomAnchor, constant: 48 * appConstant.heightRatio),
            PasswordTextFieldView.leadingAnchor.constraint(equalTo: popView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            PasswordTextFieldView.trailingAnchor.constraint(equalTo: popView.trailingAnchor,constant: -21 * appConstant.widthRatio),
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
        
            
            //
            
            buttonView.bottomAnchor.constraint(equalTo: popView.bottomAnchor, constant: -10 * appConstant.heightRatio),
            buttonView.leadingAnchor.constraint(equalTo: popView.leadingAnchor,constant: 80 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: popView.trailingAnchor,constant: -80 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            nextBtn.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            buttonLbl.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            buttonLbl.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor,constant: 0 * appConstant.widthRatio),
          //  buttonLbl.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 10 * appConstant.widthRatio),
//            buttonLbl.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: -10 * appConstant.heightRatio),
            
            
            backbtnIcon.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backbtnIcon.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: -23 * appConstant.widthRatio),
            backbtnIcon.heightAnchor.constraint(equalToConstant: 17 * appConstant.heightRatio),
            backbtnIcon.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
        
        
        ])
    }
    
    @objc func nextbtn_press(sender: UIButton)
    {
        Doctorhistory4Data?.slider4BtnPress()
    }
    


}

extension DoctorBackgroundHistoryView4: Doctorhistory4Delegate{
    func slider4BtnPress() {
        self.delegate?.setnext()
    }
    
    
}

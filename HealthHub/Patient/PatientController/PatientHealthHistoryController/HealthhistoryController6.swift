//
//  HealthhistoryController6.swift
//  HealthHub
//
//  Created by OBS on 03/01/2022.
//

import UIKit

protocol history6Delegate{
    func slider6BtnPress()
}

var history6Data : history6Delegate?

class HealthhistoryController6: UIView {
    
    lazy var headtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"SFProDisplay-Bold", size: 30.0 * appConstant.heightRatio)
        lbl.text = "Your health \nprofile"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var numberingtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"SFProDisplay", size: 15.0 * appConstant.heightRatio)
        lbl.text = "6 of 10"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "5")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var popView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
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
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"SFProDisplay-Bold", size: 18.0 * appConstant.heightRatio)
        lbl.text = "Have you been diagnosed with any heart condition?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    lazy var yesBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.shadowOpacity = 0
        btn.layer.cornerRadius = 8 * appConstant.heightRatio
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = semiBold(size: 15)
        btn.setTitle("Yes", for: .normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(yesbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var noBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.shadowOpacity = 0
        btn.layer.cornerRadius = 8 * appConstant.heightRatio
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("No", for: .normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(nobtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    
    lazy var dontknowBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.shadowOpacity = 0
        btn.layer.cornerRadius = 8 * appConstant.heightRatio
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = semiBold(size: 15)
        //        btn.layer.borderColor = UIColor(named: Colors.ButtonBG)?.cgColor
        //        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.setTitle("I don’t know", for: .normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(idontnobtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    
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
        //        yesBtn.backgroundColor = UIColor.lightGray
        //        noBtn.backgroundColor = UIColor.lightGray
        //        dontknowBtn.backgroundColor = UIColor.lightGray
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    func setup()
    {
        //        let margin = view.layoutMarginsGuide
        //        childView.addSubview(headtitleLbl)
        self.addSubview(numberingtitleLbl)
        self.addSubview(logoImage)
        
        self.addSubview(popView)
        popView.addSubview(poptitleLbl)
        
        popView.addSubview(yesBtn)
        popView.addSubview(noBtn)
        popView.addSubview(dontknowBtn)
        
        
        
        
        
        NSLayoutConstraint.activate([
            
            
            //            headtitleLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 18 * appConstant.heightRatio),
            //            headtitleLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 108 * appConstant.heightRatio),
            //            headtitleLbl.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -108 * appConstant.heightRatio),
            //            headtitleLbl.heightAnchor.constraint(equalToConstant: 80 * appConstant.heightRatio),
            
            
            numberingtitleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 36 * appConstant.heightRatio),
            numberingtitleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0 * appConstant.heightRatio),
            numberingtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            logoImage.topAnchor.constraint(equalTo: numberingtitleLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            logoImage.centerXAnchor.constraint(equalTo: numberingtitleLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            logoImage.heightAnchor.constraint(equalToConstant: 210 * appConstant.heightRatio),
            logoImage.widthAnchor.constraint(equalToConstant: 175 * appConstant.heightRatio),
            
            
            popView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 44 * appConstant.heightRatio),
            popView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20 * appConstant.heightRatio),
            popView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20 * appConstant.heightRatio),
            popView.heightAnchor.constraint(equalToConstant: 259 * appConstant.heightRatio),
            
            
            poptitleLbl.topAnchor.constraint(equalTo: popView.topAnchor, constant: 30 * appConstant.heightRatio),
            poptitleLbl.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 92 * appConstant.heightRatio),
            poptitleLbl.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -92 * appConstant.heightRatio),
            poptitleLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            
            
            yesBtn.topAnchor.constraint(equalTo: poptitleLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
            yesBtn.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 94 * appConstant.heightRatio),
            yesBtn.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -94 * appConstant.heightRatio),
            yesBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            noBtn.topAnchor.constraint(equalTo: yesBtn.bottomAnchor, constant: 15 * appConstant.heightRatio),
            noBtn.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 94 * appConstant.heightRatio),
            noBtn.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -94 * appConstant.heightRatio),
            noBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            dontknowBtn.topAnchor.constraint(equalTo: noBtn.bottomAnchor, constant: 15 * appConstant.heightRatio),
            dontknowBtn.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 94 * appConstant.heightRatio),
            dontknowBtn.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -94 * appConstant.heightRatio),
            dontknowBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            
            
            
            
        ])
    }
    
    @objc func yesbtn_press(sender: UIButton)
    {
        heart = "Yes"
        AppUserDefault.shared.heart = heart
        history6Data?.slider6BtnPress()
        
    }
    
    
    @objc func nobtn_press(sender: UIButton)
    {
        heart = "No"
        AppUserDefault.shared.heart = heart
        history6Data?.slider6BtnPress()
        
    }
    
    @objc func idontnobtn_press(sender: UIButton)
    {
        heart = "I don’t know"
        AppUserDefault.shared.heart = heart
        history6Data?.slider6BtnPress()
        
    }
    
}




//class HealthhistoryController6: UIView {
//
//    lazy var headtitleLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.clipsToBounds = true
//        lbl.textColor = UIColor(named: Colors.AppColor)
//        lbl.textAlignment = .center
//        lbl.font = bold(size: 30)
//        lbl.text = "Health background"
//        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
//        lbl.isHidden = true
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//
//    lazy var numberingtitleLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.clipsToBounds = true
//        lbl.textColor = .black
//        lbl.textAlignment = .center
//        lbl.font = bold(size: 15)
//        lbl.text = "6 of 10"
//        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//
//
//    lazy var logoImage : UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(named: "5")
//        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.contentMode = .scaleAspectFit
//        iv.clipsToBounds = true
//        return iv
//    }()
//
//
//    lazy var popView : UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius  = 0 * appConstant.heightRatio
//        view.layer.shadowColor = UIColor.clear.cgColor
//        view.layer.shadowOpacity = 0.25
//        view.layer.shadowOffset = CGSize(width: 0, height: 4)
//        view.layer.shadowRadius = 0 * appConstant.heightRatio
//        view.clipsToBounds = false
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    lazy var poptitleLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.clipsToBounds = true
//        lbl.textColor =  UIColor.black
//        lbl.textAlignment = .center
//        lbl.font = semiBold(size: 36)
//        lbl.text = "Have you been diagnosed with any heart condition?"
//        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//
//
//
//    lazy var yesBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
//        btn.layer.shadowOpacity = 0
//        btn.layer.cornerRadius = 20 * appConstant.heightRatio
//        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.titleLabel?.font = semiBold(size: 15)
//        btn.setTitle("Yes", for: .normal)
//        btn.sizeToFit()
//        btn.addTarget(self, action: #selector(yesbtn_press), for: .touchUpInside)
//
//        return btn
//    }()
//
//    lazy var noBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
//        btn.layer.shadowOpacity = 0
//        btn.layer.cornerRadius = 18 * appConstant.heightRatio
//        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.titleLabel?.font = bold(size: 15)
//        btn.setTitle("No", for: .normal)
//        btn.sizeToFit()
//        btn.addTarget(self, action: #selector(nobtn_press), for: .touchUpInside)
//
//        return btn
//    }()
//
//
//    lazy var dontknowBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
//        btn.layer.shadowOpacity = 0
//        btn.layer.cornerRadius = 18 * appConstant.heightRatio
//        btn.setTitleColor(UIColor(named: Colors.ButtonBG), for: .normal)
//        btn.titleLabel?.font = semiBold(size: 15)
//        btn.layer.borderColor = UIColor(named: Colors.ButtonBG)?.cgColor
//        btn.layer.borderWidth = 1 * appConstant.heightRatio
//        btn.setTitle("I don’t know", for: .normal)
//        btn.sizeToFit()
//        btn.addTarget(self, action: #selector(idontnobtn_press), for: .touchUpInside)
//
//        return btn
//    }()
//
//
//
//
//    //    override func viewDidLoad() {
//    //        super.viewDidLoad()
//    //
//    //        headerLbl.text = "Health  history"
//    //        view.backgroundColor = .white
//    //        setup()
//    //    }
//
//    override public init(frame: CGRect) {
//        super.init(frame: frame)
//        self.clipsToBounds = true
//        setup()
//
//
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//
//    }
//
//
//
//    func setup()
//    {
//        let margin = self.layoutMarginsGuide
//        self.addSubview(headtitleLbl)
//        self.addSubview(numberingtitleLbl)
//        self.addSubview(logoImage)
//
//        self.addSubview(popView)
//        popView.addSubview(poptitleLbl)
//
//        popView.addSubview(yesBtn)
//        popView.addSubview(noBtn)
//        popView.addSubview(dontknowBtn)
//
//
//
//
//
//        NSLayoutConstraint.activate([
//
//            numberingtitleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 36 * appConstant.heightRatio),
//            numberingtitleLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0 * appConstant.heightRatio),
//            numberingtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
//
//            poptitleLbl.topAnchor.constraint(equalTo: numberingtitleLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
//            poptitleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 * appConstant.heightRatio),
//            poptitleLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 * appConstant.heightRatio),
//            poptitleLbl.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
//
//
//            logoImage.topAnchor.constraint(equalTo: poptitleLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
//            //  logoImage.centerXAnchor.constraint(equalTo: numberingtitleLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
//            logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0 * appConstant.heightRatio),
//            logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0 * appConstant.heightRatio),
//            logoImage.heightAnchor.constraint(equalToConstant: 250 * appConstant.heightRatio),
//            //   logoImage.widthAnchor.constraint(equalToConstant: 175 * appConstant.heightRatio),
//
//
//            popView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10 * appConstant.heightRatio),
//            popView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0 * appConstant.heightRatio),
//            popView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0 * appConstant.heightRatio),
//            popView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0 * appConstant.heightRatio),
//
//
////            poptitleLbl.topAnchor.constraint(equalTo: popView.topAnchor, constant: 30 * appConstant.heightRatio),
////            poptitleLbl.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 92 * appConstant.heightRatio),
////            poptitleLbl.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -92 * appConstant.heightRatio),
////            poptitleLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
////
//
//
//            yesBtn.topAnchor.constraint(equalTo: popView.topAnchor, constant: 8 * appConstant.heightRatio),
//            yesBtn.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 20 * appConstant.heightRatio),
//            yesBtn.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -20 * appConstant.heightRatio),
//            yesBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
//
//            noBtn.topAnchor.constraint(equalTo: yesBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
//            noBtn.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 20 * appConstant.heightRatio),
//            noBtn.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -20 * appConstant.heightRatio),
//            noBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
//
//            dontknowBtn.topAnchor.constraint(equalTo: noBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
//            dontknowBtn.leadingAnchor.constraint(equalTo: popView.leadingAnchor, constant: 20 * appConstant.heightRatio),
//            dontknowBtn.trailingAnchor.constraint(equalTo: popView.trailingAnchor, constant: -20 * appConstant.heightRatio),
//            dontknowBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
//
//
//        ])
//    }
//
//    @objc func yesbtn_press(sender: UIButton)
//    {
//        heart = "Yes"
//        AppUserDefault.shared.heart = heart
//        history6Data?.slider6BtnPress()
//
//    }
//
//
//    @objc func nobtn_press(sender: UIButton)
//    {
//        heart = "No"
//        AppUserDefault.shared.heart = heart
//        history6Data?.slider6BtnPress()
//
//    }
//
//    @objc func idontnobtn_press(sender: UIButton)
//    {
//        heart = "I don’t know"
//        AppUserDefault.shared.heart = heart
//        history6Data?.slider6BtnPress()
//
//    }
//
//
//}

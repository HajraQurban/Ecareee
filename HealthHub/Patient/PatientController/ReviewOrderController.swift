//
//  ReviewOrderController.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class ReviewOrderController: UIViewController {
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.tintColor = .white
      //  btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var FirstIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Num5")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var SymptoptitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 16)
        lbl.textColor = UIColor.black
        lbl.text = "Review Order"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextColor)
        view.clipsToBounds = false
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var SecondIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum4")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var methodtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 16)
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.text = "Payment"
        lbl.textAlignment = .center
        lbl.isHidden = true
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var SecondlineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.clipsToBounds = false
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ThirdIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum4")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var ordersummarytitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Order Summary"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var mainView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var drImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "drImg")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = false
        iv.layer.cornerRadius = 10 * appConstant.heightRatio
        return iv
    }()
    
    lazy var nameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Dr. Hamza"
        lbl.numberOfLines = 1
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var designationLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.LightText)
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 13.0 * appConstant.heightRatio)
        lbl.text = "Neurologist |  Metro Hospital"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var dateLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "20 January 2020"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var timeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "11.30"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var bottomLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var videoiconView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named:Colors.AppColor)
        view.layer.cornerRadius  = 9 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)!.cgColor
        view.layer.shadowRadius = 40 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 16)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var videoIconBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "videoIcon"), for: .normal)
//        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var videocallLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Video Call"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var paymentinfotitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Payment Info"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var paymenttypeView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var methodimg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "CC1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var methodnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Credit Card Payment"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var agreeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.setImage(UIImage(named: "Checkbox"), for: .normal)
      //  btn.setTitle("Get Started", for: .normal)
//        btn.addTarget(self, action: #selector(agreebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var agreelightlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "I agree with"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var agreedarklbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .left
        lbl.font =  bold(size: 15)
        lbl.text = " Terms & Conditions"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var placeorderBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Place Order", for: .normal)
//        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
      
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        setup()
    }
    

    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(FirstIcon)
        headerView.addSubview(SymptoptitleLbl1)
        headerView.addSubview(lineView)
        headerView.addSubview(SecondIcon)
        headerView.addSubview(methodtitleLbl1)
        headerView.addSubview(SecondlineView)
        headerView.addSubview(ThirdIcon)
        view.addSubview(ordersummarytitleLbl1)
        view.addSubview(mainView)
        mainView.addSubview(drImage)
        mainView.addSubview(drImage)
        mainView.addSubview(nameLbl)
        mainView.addSubview(designationLbl)
        mainView.addSubview(dateLbl)
        mainView.addSubview(timeLbl)
        mainView.addSubview(bottomLine)
        mainView.addSubview(videoiconView)
        videoiconView.addSubview(videoIconBtn)
        mainView.addSubview(videocallLbl)
        view.addSubview(paymentinfotitleLbl1)
        view.addSubview(paymenttypeView)
        paymenttypeView.addSubview(methodimg)
        paymenttypeView.addSubview(methodnameLbl)
        view.addSubview(agreeBtn)
        view.addSubview(agreelightlbl)
        view.addSubview(agreedarklbl)
        view.addSubview(placeorderBtn)
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -48 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            backBtn.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 55 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            FirstIcon.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            FirstIcon.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15 * appConstant.heightRatio),
            FirstIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            FirstIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            SymptoptitleLbl1.centerYAnchor.constraint(equalTo: FirstIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SymptoptitleLbl1.leadingAnchor.constraint(equalTo: FirstIcon.trailingAnchor, constant: 5 * appConstant.heightRatio),
            SymptoptitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            lineView.centerYAnchor.constraint(equalTo: FirstIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            lineView.leadingAnchor.constraint(equalTo: SymptoptitleLbl1.trailingAnchor, constant: 10 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            lineView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),

            
            SecondIcon.centerYAnchor.constraint(equalTo: lineView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SecondIcon.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 10 * appConstant.heightRatio),
            SecondIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            SecondIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            methodtitleLbl1.centerYAnchor.constraint(equalTo: SecondIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            methodtitleLbl1.leadingAnchor.constraint(equalTo: SecondIcon.trailingAnchor, constant: 5 * appConstant.heightRatio),
            methodtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            SecondlineView.centerYAnchor.constraint(equalTo: methodtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SecondlineView.leadingAnchor.constraint(equalTo: methodtitleLbl1.trailingAnchor, constant: 10 * appConstant.heightRatio),
            SecondlineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            SecondlineView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            ThirdIcon.centerYAnchor.constraint(equalTo: SecondlineView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            ThirdIcon.leadingAnchor.constraint(equalTo: SecondlineView.trailingAnchor, constant: 10 * appConstant.heightRatio),
            ThirdIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            ThirdIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            ordersummarytitleLbl1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            ordersummarytitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ordersummarytitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            mainView.topAnchor.constraint(equalTo: ordersummarytitleLbl1.bottomAnchor,constant: 20 * appConstant.heightRatio),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            mainView.heightAnchor.constraint(equalToConstant: 160 * appConstant.heightRatio),

            drImage.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 6 * appConstant.heightRatio),
            drImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 6 * appConstant.widthRatio),
            drImage.widthAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
//            drImage.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5 * appConstant.heightRatio),
//            drImage.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
                                              
            nameLbl.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: drImage.trailingAnchor,constant: 18 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
            designationLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            designationLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            designationLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -4 * appConstant.widthRatio),
           
            dateLbl.bottomAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 0 * appConstant.heightRatio),
            dateLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            timeLbl.centerYAnchor.constraint(equalTo: dateLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            timeLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
            
            bottomLine.topAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 8 * appConstant.heightRatio),
            bottomLine.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottomLine.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            bottomLine.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            videoiconView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            videoiconView.topAnchor.constraint(equalTo: bottomLine.bottomAnchor,constant: 12 * appConstant.heightRatio),
            videoiconView.widthAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            videoiconView.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            videoiconView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5 * appConstant.heightRatio),

            
            videoIconBtn.topAnchor.constraint(equalTo: videoiconView.topAnchor),
            videoIconBtn.bottomAnchor.constraint(equalTo: videoiconView.bottomAnchor),
            videoIconBtn.leadingAnchor.constraint(equalTo: videoiconView.leadingAnchor),
            videoIconBtn.trailingAnchor.constraint(equalTo: videoiconView.trailingAnchor),
            
            videocallLbl.centerYAnchor.constraint(equalTo: videoIconBtn.centerYAnchor,constant: 0 * appConstant.heightRatio),
            videocallLbl.leadingAnchor.constraint(equalTo: videoiconView.trailingAnchor,constant: 16 * appConstant.widthRatio),

            paymentinfotitleLbl1.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 24 * appConstant.heightRatio),
            paymentinfotitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            paymentinfotitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            paymenttypeView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.heightRatio),
            paymenttypeView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.heightRatio),
            paymenttypeView.topAnchor.constraint(equalTo: paymentinfotitleLbl1.bottomAnchor,constant: 12 * appConstant.heightRatio),
            paymenttypeView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            methodimg.centerYAnchor.constraint(equalTo: paymenttypeView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            methodimg.leadingAnchor.constraint(equalTo: paymenttypeView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            methodimg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            methodimg.widthAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            methodnameLbl.centerYAnchor.constraint(equalTo: methodimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            methodnameLbl.leadingAnchor.constraint(equalTo: methodimg.trailingAnchor, constant: 20 * appConstant.widthRatio),
            methodnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //  docnameLbl.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            
            agreeBtn.bottomAnchor.constraint(equalTo: placeorderBtn.topAnchor, constant: -20 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            agreeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 69 * appConstant.widthRatio),
            agreeBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            agreeBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            agreelightlbl.centerYAnchor.constraint(equalTo: agreeBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            agreelightlbl.leadingAnchor.constraint(equalTo: agreeBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            agreelightlbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            agreedarklbl.centerYAnchor.constraint(equalTo: agreelightlbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            agreedarklbl.leadingAnchor.constraint(equalTo: agreelightlbl.trailingAnchor, constant: 1 * appConstant.widthRatio),
            agreedarklbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            placeorderBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            placeorderBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            placeorderBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            placeorderBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20 * appConstant.heightRatio ),
            
        ])

        
    }
    
    @objc func backbtn_press()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
}

//
//  InvoicedetailController.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class InvoicedetailController: BaseController {

    lazy var ContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var personalView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
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
        lbl.font = bold(size: 24)
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
    
    lazy var dot3Btn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.isHidden = true
        btn.setImage(UIImage(named: "3dots"), for: .normal)
//        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var topLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottomLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var consultationView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named:Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var consaltationmethodLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Consultation method"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var videoiconView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named:Colors.TextfieldBG)
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
        btn.tintColor = .white
//        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var videocallLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Video Call Consultation"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var videobtnView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppColor)
        view.clipsToBounds = true
        view.isHidden = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
       // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var videobtnLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.backgroundColor = UIColor.clear
        lbl.font = regular(size: 13)
        lbl.text = "2 hrs"
        lbl.numberOfLines = 0
        lbl.isHidden = false
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var videobtnIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var bottom2Line : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottom3Line : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var AppointmentdetailView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var consaltationLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Appointment Detail"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ComplaintLbl : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Complaint"
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ComplaintResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Fatigue and Dry Cough"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descriptionLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Time"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descriptionResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "11:30 am"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var datedescriptionLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Date"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var datedescriptionResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "20 january 2020"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PaymentdetailView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named:Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var patiantDetailLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.backgroundColor = UIColor.clear
        lbl.font = bold(size: 18)
        lbl.text = "Payment Details"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pchargestitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Charges"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pchargesResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "70$"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var paymethodtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Payment Method"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var paycreditResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Credit Card payment"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var pGenderLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Gender"
        lbl.isHidden = true
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pGenderResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Male"
        lbl.isHidden = true
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var callbtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(callBtn_press), for: .touchUpInside)
        return btn
    }()
    
    var appointment = appointdata()
    var isCall =  true
    var isFromNotification = false
  //  let loadingView = RSLoadingView()
    var line2Constraint : NSLayoutConstraint!
    let BackendController = BackendClass.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
      
        backBtn.tintColor = .white
        self.headerLbl.text = "Invoice Detail"
//        self.nameLbl.text  = appointment.doctor?.name ?? ""
//        self.designationLbl.text = appointment.doctor?.hospital_name ?? ""
//        self.dateLbl.text = appointment.slot?.date ?? ""
//        self.timeLbl.text = appointment.slot?.start_time ?? ""
//        self.pNameResultLbl.text = appointment.patient?.name ?? ""
//        self.pEmailResultLbl.text = appointment.patient?.email ?? ""
//        self.pGenderResultLbl.text = appointment.patient?.gender ?? ""
//        self.ComplaintResultLbl.text = appointment.compName ?? ""
//        self.descriptionResultLbl.text = appointment.compDesc ?? ""
//
//        if appointment.doctor?.url == nil
//        {
//            drImage.image = UIImage(named: "Profile_img")
//        }
//        else
//        {
//        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
//        let url = URL(string: base + ( appointment.doctor?.url ?? ""))
//            drImage.kf.setImage(with: url)
//        }
        
        setup()
    }
    
    func setup(){
        childView.addSubview(scrollView)
        scrollView.addSubview(ContainerView)
        ContainerView.addSubview(mainView)
        mainView.addSubview(personalView)
        personalView.addSubview(dot3Btn)
        personalView.addSubview(drImage)
        personalView.addSubview(nameLbl)
        personalView.addSubview(designationLbl)
        personalView.addSubview(dateLbl)
        personalView.addSubview(timeLbl)
        mainView.addSubview(topLine)
        mainView.addSubview(consultationView)
        consultationView.addSubview(consaltationmethodLbl)
        consultationView.addSubview(videoiconView)
        videoiconView.addSubview(videoIconBtn)
        consultationView.addSubview(videocallLbl)
        consultationView.addSubview(videobtnView)
        consultationView.addSubview(videobtnLbl)
        videobtnView.addSubview(videobtnIcon)
        videobtnView.addSubview(callbtn)
        mainView.addSubview(bottomLine)
        mainView.addSubview(AppointmentdetailView)
        AppointmentdetailView.addSubview(consaltationLbl)
        AppointmentdetailView.addSubview(ComplaintLbl)
        AppointmentdetailView.addSubview(ComplaintResultLbl)
        AppointmentdetailView.addSubview(descriptionLbl)
        AppointmentdetailView.addSubview(descriptionResultLbl)
        AppointmentdetailView.addSubview(datedescriptionLbl)
        AppointmentdetailView.addSubview(datedescriptionResultLbl)
        mainView.addSubview(bottom2Line)
        mainView.addSubview(PaymentdetailView)
        PaymentdetailView.addSubview(patiantDetailLbl)
        PaymentdetailView.addSubview(pchargestitleLbl)
        PaymentdetailView.addSubview(pchargesResultLbl)
        PaymentdetailView.addSubview(paymethodtitleLbl)
        PaymentdetailView.addSubview(paycreditResultLbl)
        PaymentdetailView.addSubview(pGenderLbl)
        PaymentdetailView.addSubview(pGenderResultLbl)
        
        if isCall{
            line2Constraint = bottomLine.topAnchor.constraint(equalTo: videobtnView.bottomAnchor,constant: 20 * appConstant.heightRatio)
            line2Constraint.isActive = true
        }else{
            line2Constraint = bottomLine.topAnchor.constraint(equalTo: topLine.topAnchor,constant: 0 * appConstant.heightRatio)
            videobtnView.isHidden = true
            videoiconView.isHidden = true
            videocallLbl.isHidden = true
            line2Constraint.isActive = true
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: childView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: 375.0 * appConstant.widthRatio),
            
            ContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            ContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            ContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            ContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            ContainerView.widthAnchor.constraint(equalToConstant: 375.0 * appConstant.widthRatio),
            
            mainView.topAnchor.constraint(equalTo: ContainerView.topAnchor,constant: 50 * appConstant.heightRatio),
            mainView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor,constant: -80 * appConstant.heightRatio),
            mainView.leadingAnchor.constraint(equalTo: ContainerView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            mainView.trailingAnchor.constraint(equalTo: ContainerView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            
            personalView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 2 * appConstant.heightRatio),
//            personalView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor,constant: -80 * appConstant.heightRatio),
            personalView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            personalView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            personalView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),

           
            
            drImage.topAnchor.constraint(equalTo: personalView.topAnchor,constant: 6 * appConstant.heightRatio),
            drImage.leadingAnchor.constraint(equalTo: personalView.leadingAnchor,constant: 6 * appConstant.widthRatio),
            drImage.widthAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            drImage.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
                                              
            nameLbl.topAnchor.constraint(equalTo: personalView.topAnchor,constant: 20 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: drImage.trailingAnchor,constant: 18 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
            dot3Btn.centerYAnchor.constraint(equalTo: nameLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            dot3Btn.trailingAnchor.constraint(equalTo: personalView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            dot3Btn.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            dot3Btn.heightAnchor.constraint(equalToConstant: 4 * appConstant.heightRatio),
            
            designationLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            designationLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            designationLbl.trailingAnchor.constraint(equalTo: personalView.trailingAnchor,constant: -4 * appConstant.widthRatio),
           
            dateLbl.bottomAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 0 * appConstant.heightRatio),
            dateLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            timeLbl.centerYAnchor.constraint(equalTo: dateLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            timeLbl.trailingAnchor.constraint(equalTo: personalView.trailingAnchor,constant: -12 * appConstant.widthRatio),
           
            topLine.topAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 16 * appConstant.heightRatio),
            topLine.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            topLine.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            topLine.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            consultationView.topAnchor.constraint(equalTo: personalView.bottomAnchor,constant: 8 * appConstant.heightRatio),
//            consultationView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor,constant: -80 * appConstant.heightRatio),
            consultationView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            consultationView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            consultationView.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),

            consaltationmethodLbl.topAnchor.constraint(equalTo: consultationView.topAnchor,constant: 4 * appConstant.heightRatio),
            consaltationmethodLbl.leadingAnchor.constraint(equalTo: consultationView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            consaltationmethodLbl.trailingAnchor.constraint(equalTo:  consultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            videoiconView.leadingAnchor.constraint(equalTo: consultationView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            videoiconView.topAnchor.constraint(equalTo: consaltationmethodLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            videoiconView.widthAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            videoiconView.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            
            videoIconBtn.topAnchor.constraint(equalTo: videoiconView.topAnchor),
            videoIconBtn.bottomAnchor.constraint(equalTo: videoiconView.bottomAnchor),
            videoIconBtn.leadingAnchor.constraint(equalTo: videoiconView.leadingAnchor),
            videoIconBtn.trailingAnchor.constraint(equalTo: videoiconView.trailingAnchor),
            
            videocallLbl.centerYAnchor.constraint(equalTo: videoIconBtn.centerYAnchor,constant: 0 * appConstant.heightRatio),
            videocallLbl.leadingAnchor.constraint(equalTo: videoiconView.trailingAnchor,constant: 16 * appConstant.widthRatio),
           
            videobtnView.trailingAnchor.constraint(equalTo: consultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            videobtnView.centerYAnchor.constraint(equalTo: videocallLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            videobtnView.widthAnchor.constraint(equalToConstant: 148 * appConstant.heightRatio),
            videobtnView.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            videobtnLbl.centerYAnchor.constraint(equalTo: videobtnView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            videobtnLbl.centerXAnchor.constraint(equalTo: videobtnView.centerXAnchor,constant: 0 * appConstant.widthRatio),
            
            videobtnIcon.centerYAnchor.constraint(equalTo: videobtnView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            videobtnIcon.trailingAnchor.constraint(equalTo: videobtnView.trailingAnchor,constant: -23 * appConstant.widthRatio),
            videobtnIcon.heightAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
            videobtnIcon.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            
            callbtn.topAnchor.constraint(equalTo: videobtnView.topAnchor, constant: 0 * appConstant.heightRatio),
            callbtn.leadingAnchor.constraint(equalTo: videobtnView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            callbtn.trailingAnchor.constraint(equalTo: videobtnView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            callbtn.bottomAnchor.constraint(equalTo: videobtnView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
//            bottomLine.topAnchor.constraint(equalTo: videobtnView.bottomAnchor,constant: 20 * appConstant.heightRatio),
            bottomLine.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottomLine.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            bottomLine.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            
            AppointmentdetailView.topAnchor.constraint(equalTo: consultationView.bottomAnchor,constant: 8 * appConstant.heightRatio),
//            AppointmentdetailView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor,constant: -80 * appConstant.heightRatio),
            AppointmentdetailView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            AppointmentdetailView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            AppointmentdetailView.heightAnchor.constraint(equalToConstant: 180 * appConstant.heightRatio),
        
            consaltationLbl.topAnchor.constraint(equalTo: AppointmentdetailView.topAnchor,constant: 2 * appConstant.heightRatio),
            consaltationLbl.leadingAnchor.constraint(equalTo: AppointmentdetailView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            consaltationLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            ComplaintLbl.topAnchor.constraint(equalTo: consaltationLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            ComplaintLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            ComplaintLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            ComplaintResultLbl.topAnchor.constraint(equalTo: ComplaintLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            ComplaintResultLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            ComplaintResultLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            descriptionLbl.topAnchor.constraint(equalTo: ComplaintResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            descriptionLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            descriptionLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            descriptionResultLbl.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            descriptionResultLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            descriptionResultLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            
            datedescriptionLbl.topAnchor.constraint(equalTo: descriptionResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            datedescriptionLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            datedescriptionLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            datedescriptionResultLbl.topAnchor.constraint(equalTo: datedescriptionLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            datedescriptionResultLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            datedescriptionResultLbl.trailingAnchor.constraint(equalTo:  AppointmentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            bottom2Line.topAnchor.constraint(equalTo: datedescriptionResultLbl.bottomAnchor,constant: 20 * appConstant.heightRatio),
            bottom2Line.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottom2Line.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            bottom2Line.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
           
            
            PaymentdetailView.topAnchor.constraint(equalTo: AppointmentdetailView.bottomAnchor,constant: 8 * appConstant.heightRatio),
//            PaymentdetailView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor,constant: -80 * appConstant.heightRatio),
            PaymentdetailView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            PaymentdetailView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            PaymentdetailView.heightAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
            
            
            patiantDetailLbl.topAnchor.constraint(equalTo: PaymentdetailView.topAnchor,constant: 4 * appConstant.heightRatio),
            patiantDetailLbl.leadingAnchor.constraint(equalTo: PaymentdetailView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            patiantDetailLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pchargestitleLbl.topAnchor.constraint(equalTo: patiantDetailLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            pchargestitleLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pchargestitleLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pchargesResultLbl.topAnchor.constraint(equalTo: pchargestitleLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            pchargesResultLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pchargesResultLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            paymethodtitleLbl.topAnchor.constraint(equalTo: pchargesResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            paymethodtitleLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            paymethodtitleLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            paycreditResultLbl.topAnchor.constraint(equalTo: paymethodtitleLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            paycreditResultLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            paycreditResultLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            paycreditResultLbl.bottomAnchor.constraint(equalTo: PaymentdetailView.bottomAnchor, constant: -20 * appConstant.heightRatio),

            pGenderLbl.topAnchor.constraint(equalTo: paycreditResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            pGenderLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pGenderLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pGenderResultLbl.topAnchor.constraint(equalTo: pGenderLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            pGenderResultLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pGenderResultLbl.trailingAnchor.constraint(equalTo:  PaymentdetailView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            pGenderResultLbl.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
        ])
    }
    
    @objc override func backbtn_press() {
        self.dismiss(animated: true)
    }
    
    @objc func callBtn_press(){
     
    }
    
}

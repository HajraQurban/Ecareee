//
//  UPCommingController.swift
//  HealthHub
//
//  Created by mac on 13/12/2021.
//

import UIKit
//import RSLoadingView

@available(iOS 13.0, *)
class UPCommingController: BaseController {
    
    lazy var ContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = false
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainView : UIView = {
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
    
    
    lazy var personalinfoView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
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
        lbl.textColor = UIColor.white
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
        lbl.textColor = UIColor.white
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
        lbl.textColor = UIColor.white
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
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var bottomLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var videoiconView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
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
        btn.layer.shadowRadius = 0
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
//        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var videocallLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Video Call"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var videobtnView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
       // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var videobtnLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.backgroundColor = UIColor.clear
        lbl.font = bold(size: 13)
        lbl.text = "Start Now"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var videobtnIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var bottom2Line : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = false
//        view.isHidden = true
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
    
    lazy var ConsultationView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
//        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 4
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
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
        lbl.text = "Consultation"
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
        lbl.text = "Description"
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
        lbl.text = "Shortness of breath for the last 4 days"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PatientDetailsView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
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
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.backgroundColor = UIColor.clear
        lbl.font = bold(size: 18)
        lbl.text = "Patient Details"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pNameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Name"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pNameResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Richard Dawn"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pEmailLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Email"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var pEmailResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "richard@gmail.com"
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
    var pasdata = "yes"
    var isCall =  true
    var isFromNotification = false
  //  let loadingView = RSLoadingView()
    var line2Constraint : NSLayoutConstraint!
    let BackendController = BackendClass.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        backBtn.tintColor = .white
        self.headerLbl.text = "Appointment"
        self.nameLbl.text  = appointment.doctor?.name ?? ""
        self.designationLbl.text = appointment.doctor?.hospital_name ?? ""
        self.dateLbl.text = appointment.slot?.date ?? ""
        self.timeLbl.text = appointment.slot?.start_time ?? ""
        self.pNameResultLbl.text = appointment.patient?.name ?? ""
        self.pEmailResultLbl.text = appointment.patient?.email ?? ""
        self.pGenderResultLbl.text = appointment.patient?.gender ?? ""
        self.ComplaintResultLbl.text = appointment.compName ?? ""
        self.descriptionResultLbl.text = appointment.compDesc ?? ""
        
        if appointment.doctor?.url == nil
        {
            drImage.image = UIImage(named: "Profile_img")
        }
        else
        {
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + ( appointment.doctor?.url ?? ""))
            drImage.kf.setImage(with: url)
        }
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = true
    }
    
    func setup(){
        childView.addSubview(scrollView)
        scrollView.addSubview(ContainerView)
        ContainerView.addSubview(mainView)
        mainView.addSubview(personalinfoView)
        personalinfoView.addSubview(dot3Btn)
        personalinfoView.addSubview(drImage)
        personalinfoView.addSubview(nameLbl)
        personalinfoView.addSubview(designationLbl)
        personalinfoView.addSubview(dateLbl)
        personalinfoView.addSubview(timeLbl)
        personalinfoView.addSubview(topLine)
        personalinfoView.addSubview(videoiconView)
        videoiconView.addSubview(videoIconBtn)
        personalinfoView.addSubview(videocallLbl)
        personalinfoView.addSubview(videobtnView)
        videobtnView.addSubview(videobtnLbl)
        videobtnView.addSubview(videobtnIcon)
        videobtnView.addSubview(callbtn)
        mainView.addSubview(bottomLine)
        mainView.addSubview(ConsultationView)
        ConsultationView.addSubview(consaltationLbl)
        ConsultationView.addSubview(ComplaintLbl)
        ConsultationView.addSubview(ComplaintResultLbl)
        ConsultationView.addSubview(descriptionLbl)
        ConsultationView.addSubview(descriptionResultLbl)
        mainView.addSubview(bottom2Line)
//        mainView.addSubview(PatientDetailsView)
        mainView.addSubview(patiantDetailLbl)
        mainView.addSubview(pNameLbl)
        mainView.addSubview(pNameResultLbl)
        mainView.addSubview(pEmailLbl)
        mainView.addSubview(pEmailResultLbl)
        mainView.addSubview(pGenderLbl)
        mainView.addSubview(pGenderResultLbl)
        
        if isCall{
            
            if self.appointment.appoinment_type == "Chat"{
                self.videocallLbl.text = "Chat"
                self.videoIconBtn.setImage(UIImage(named: "ChatIcon"), for: .normal)
                self.videoIconBtn.tintColor = UIColor(named: Colors.AppColor)
                self.videoiconView.backgroundColor = .clear
                
            }else{
                
            }
            line2Constraint = bottomLine.topAnchor.constraint(equalTo: videobtnView.bottomAnchor,constant: 10 * appConstant.heightRatio)
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
            
            
            personalinfoView.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 0 * appConstant.heightRatio),
//            personalinfoView.bottomAnchor.constraint(equalTo: topLine.topAnchor,constant: 2 * appConstant.heightRatio),
            personalinfoView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            personalinfoView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            personalinfoView.heightAnchor.constraint(equalToConstant: 190 * appConstant.heightRatio),

            
            drImage.topAnchor.constraint(equalTo: personalinfoView.topAnchor,constant: 6 * appConstant.heightRatio),
            drImage.leadingAnchor.constraint(equalTo: personalinfoView.leadingAnchor,constant: 6 * appConstant.widthRatio),
            drImage.widthAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            drImage.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
                                              
            nameLbl.topAnchor.constraint(equalTo: personalinfoView.topAnchor,constant: 20 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: drImage.trailingAnchor,constant: 18 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: personalinfoView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
            dot3Btn.centerYAnchor.constraint(equalTo: nameLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            dot3Btn.trailingAnchor.constraint(equalTo: personalinfoView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            dot3Btn.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            dot3Btn.heightAnchor.constraint(equalToConstant: 4 * appConstant.heightRatio),
            
            designationLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            designationLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            designationLbl.trailingAnchor.constraint(equalTo: personalinfoView.trailingAnchor,constant: -4 * appConstant.widthRatio),
           
            dateLbl.bottomAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 0 * appConstant.heightRatio),
            dateLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            timeLbl.centerYAnchor.constraint(equalTo: dateLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            timeLbl.trailingAnchor.constraint(equalTo: personalinfoView.trailingAnchor,constant: -12 * appConstant.widthRatio),
           
            topLine.topAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 16 * appConstant.heightRatio),
            topLine.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            topLine.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            topLine.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            videoiconView.leadingAnchor.constraint(equalTo: personalinfoView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            videoiconView.topAnchor.constraint(equalTo: topLine.bottomAnchor,constant: 20 * appConstant.heightRatio),
            videoiconView.widthAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            videoiconView.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            
            videoIconBtn.topAnchor.constraint(equalTo: videoiconView.topAnchor),
            videoIconBtn.bottomAnchor.constraint(equalTo: videoiconView.bottomAnchor),
            videoIconBtn.leadingAnchor.constraint(equalTo: videoiconView.leadingAnchor),
            videoIconBtn.trailingAnchor.constraint(equalTo: videoiconView.trailingAnchor),
            
            videocallLbl.centerYAnchor.constraint(equalTo: videoIconBtn.centerYAnchor,constant: 0 * appConstant.heightRatio),
            videocallLbl.leadingAnchor.constraint(equalTo: videoiconView.trailingAnchor,constant: 16 * appConstant.widthRatio),
           
            videobtnView.trailingAnchor.constraint(equalTo: personalinfoView.trailingAnchor,constant: -20 * appConstant.widthRatio),
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
            
//            bottomLine.topAnchor.constraint(equalTo: personalinfoView.bottomAnchor,constant: -10 * appConstant.heightRatio),
            bottomLine.leadingAnchor.constraint(equalTo: personalinfoView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottomLine.trailingAnchor.constraint(equalTo: personalinfoView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            bottomLine.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            
            ConsultationView.topAnchor.constraint(equalTo: bottomLine.bottomAnchor,constant: 0 * appConstant.heightRatio),
//            personalinfoView.bottomAnchor.constraint(equalTo: topLine.topAnchor,constant: 2 * appConstant.heightRatio),
            ConsultationView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            ConsultationView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            ConsultationView.heightAnchor.constraint(equalToConstant: 160 * appConstant.heightRatio),

        
            consaltationLbl.topAnchor.constraint(equalTo: ConsultationView.topAnchor,constant: 20 * appConstant.heightRatio),
            consaltationLbl.leadingAnchor.constraint(equalTo: ConsultationView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            consaltationLbl.trailingAnchor.constraint(equalTo:  ConsultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            ComplaintLbl.topAnchor.constraint(equalTo: consaltationLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            ComplaintLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            ComplaintLbl.trailingAnchor.constraint(equalTo:  ConsultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            ComplaintResultLbl.topAnchor.constraint(equalTo: ComplaintLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            ComplaintResultLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            ComplaintResultLbl.trailingAnchor.constraint(equalTo:  ConsultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            descriptionLbl.topAnchor.constraint(equalTo: ComplaintResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            descriptionLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            descriptionLbl.trailingAnchor.constraint(equalTo:  ConsultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            descriptionResultLbl.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            descriptionResultLbl.leadingAnchor.constraint(equalTo: consaltationLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            descriptionResultLbl.trailingAnchor.constraint(equalTo:  ConsultationView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            bottom2Line.topAnchor.constraint(equalTo: descriptionResultLbl.bottomAnchor,constant: 20 * appConstant.heightRatio),
            bottom2Line.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            bottom2Line.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            bottom2Line.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
           
            
//            PatientDetailsView.topAnchor.constraint(equalTo: bottom2Line.bottomAnchor,constant: 0 * appConstant.heightRatio),
////            PatientDetailsView.bottomAnchor.constraint(equalTo: topLine.topAnchor,constant: 2 * appConstant.heightRatio),
//            PatientDetailsView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
//            PatientDetailsView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
//            PatientDetailsView.heightAnchor.constraint(equalToConstant: 180 * appConstant.heightRatio),

            
            
            patiantDetailLbl.topAnchor.constraint(equalTo: bottom2Line.bottomAnchor,constant: 30 * appConstant.heightRatio),
            patiantDetailLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            patiantDetailLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pNameLbl.topAnchor.constraint(equalTo: patiantDetailLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            pNameLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pNameLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pNameResultLbl.topAnchor.constraint(equalTo: pNameLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            pNameResultLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pNameResultLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pEmailLbl.topAnchor.constraint(equalTo: pNameResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            pEmailLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pEmailLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pEmailResultLbl.topAnchor.constraint(equalTo: pEmailLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            pEmailResultLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pEmailResultLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pGenderLbl.topAnchor.constraint(equalTo: pEmailResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            pGenderLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pGenderLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            pGenderResultLbl.topAnchor.constraint(equalTo: pGenderLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            pGenderResultLbl.leadingAnchor.constraint(equalTo: patiantDetailLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            pGenderResultLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            pGenderResultLbl.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
        ])
    }
    
    override func backbtn_press() {
        if isFromNotification{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func callBtn_press(){
        
        
        if self.appointment.appoinment_type == "Chat"{
            let vc = MessgeViewController()
           
            let chat = appointment
            vc.title = chat.doctor?.name
            vc.userID = chat.doctor?.id ?? 0
        //    self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.pushViewController(vc, animated:true)
        }else{
            let idetity =  AppUserDefault.shared.username ?? ""
         //    loadingView.show(on: view)
              BackendController.joinRoom(identity: idetity,name: appointment.roomName ?? "") { accesToken, room_name, hasError in
                 if !hasError{
                     DispatchQueue.main.async {
                      //   RSLoadingView.hide(from: self.view)
                         let vc = VideoCallController()
                         vc.modalPresentationStyle = .fullScreen
                         vc.accessToken  = accesToken
                         vc.room_name  = room_name
                         vc.notificationId = self.appointment.doctor?.id ?? 0
                         vc.appointment = self.appointment
                         self.present(vc, animated: true)
                         
                     }
                     
                 }else{
                     print(room_name)
                 //    RSLoadingView.hide(from: self.view)
                 }
             }
        }
        
       
    }
    

  

}

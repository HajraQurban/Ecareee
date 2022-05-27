//
//  EndCallController.swift
//  HealthHub
//
//  Created by mac on 13/12/2021.
//

import UIKit

class EndCallController: UIViewController {
    
    lazy var headingLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 36)
        lbl.text = "Your call has ended"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var endCallBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isUserInteractionEnabled = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setImage(UIImage(named: "EndCall"), for: .normal)
        btn.imageView?.tintColor = .white
        btn.layer.cornerRadius = 32 * appConstant.heightRatio
        return btn
    }()
    
    lazy var mainView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.LightText)!.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
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
    
    lazy var topLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var SummaryView : UIView = {
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
    
    lazy var summryLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Summary"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var statusLbl : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Status"
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var statusResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = semiBold(size: 15)
        lbl.text = "Ended"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var durationLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Call Duration"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var durationResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = semiBold(size: 15)
        lbl.text = "12.40"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var againjoincallBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setTitle("Rejoin Call", for: .normal)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.addTarget(self, action: #selector(rejoincallbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var submitreviewBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.TextfieldBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named: Colors.PrimaryAppColor1)?.cgColor
        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.shadowRadius = 0
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Give Review", for: .normal)
        btn.addTarget(self, action: #selector(reviewBtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var bookBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setTitle("Home", for: .normal)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.addTarget(self, action: #selector(bookBtn_press), for: .touchUpInside)
        return btn
    }()
    var appointment = appointdata()
    var accessToken : String?
    var room_name : String?
    let BackendController = BackendClass.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        self.nameLbl.text  = appointment.doctor?.name ?? ""
        self.designationLbl.text = appointment.doctor?.hospital_name ?? ""
        self.dateLbl.text = appointment.slot?.date ?? ""
        self.timeLbl.text = appointment.slot?.start_time ?? ""
        
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
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(endCallBtn)
        view.addSubview(headingLbl)
        view.addSubview(mainView)
        mainView.addSubview(personalView)
        personalView.addSubview(drImage)
        personalView.addSubview(drImage)
        personalView.addSubview(nameLbl)
        personalView.addSubview(designationLbl)
        personalView.addSubview(dateLbl)
        personalView.addSubview(timeLbl)
        mainView.addSubview(topLine)
        mainView.addSubview(SummaryView)
        SummaryView.addSubview(summryLbl)
        SummaryView.addSubview(statusLbl)
        SummaryView.addSubview(statusResultLbl)
        SummaryView.addSubview(durationLbl)
        SummaryView.addSubview(durationResultLbl)
        view.addSubview(againjoincallBtn)
        view.addSubview(submitreviewBtn)
        view.addSubview(bookBtn)
        
        NSLayoutConstraint.activate([
        
     
            endCallBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0 * appConstant.widthRatio),
            endCallBtn.topAnchor.constraint(equalTo: margin.topAnchor,constant: 40 * appConstant.heightRatio),
            endCallBtn.widthAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            endCallBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            headingLbl.topAnchor.constraint(equalTo: endCallBtn.bottomAnchor,constant: 20 * appConstant.heightRatio),
            headingLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100 * appConstant.widthRatio),
            headingLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100 * appConstant.widthRatio),
            
            mainView.topAnchor.constraint(equalTo: headingLbl.topAnchor,constant: 100 * appConstant.heightRatio),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            
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
            nameLbl.trailingAnchor.constraint(equalTo: personalView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
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
            
            SummaryView.topAnchor.constraint(equalTo: personalView.bottomAnchor,constant: 8 * appConstant.heightRatio),
//            SummaryView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor,constant: -80 * appConstant.heightRatio),
            SummaryView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            SummaryView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -0 * appConstant.widthRatio),
            SummaryView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            summryLbl.topAnchor.constraint(equalTo: SummaryView.topAnchor,constant: 4 * appConstant.heightRatio),
            summryLbl.leadingAnchor.constraint(equalTo: SummaryView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            summryLbl.trailingAnchor.constraint(equalTo:  SummaryView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            statusLbl.topAnchor.constraint(equalTo: summryLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            statusLbl.leadingAnchor.constraint(equalTo: summryLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            statusResultLbl.centerYAnchor.constraint(equalTo: statusLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            statusResultLbl.trailingAnchor.constraint(equalTo:  SummaryView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
          
            durationLbl.topAnchor.constraint(equalTo: statusResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            durationLbl.leadingAnchor.constraint(equalTo: summryLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            durationResultLbl.centerYAnchor.constraint(equalTo: durationLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            durationResultLbl.trailingAnchor.constraint(equalTo:  SummaryView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            durationLbl.bottomAnchor.constraint(equalTo: SummaryView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
            
            againjoincallBtn.bottomAnchor.constraint(equalTo: submitreviewBtn.topAnchor, constant: -30 * appConstant.heightRatio),
            againjoincallBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60 * appConstant.widthRatio),
            againjoincallBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60 * appConstant.widthRatio),
            againjoincallBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            submitreviewBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            submitreviewBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            submitreviewBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            bookBtn.topAnchor.constraint(equalTo: submitreviewBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            bookBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20 * appConstant.heightRatio),
            bookBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            bookBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            bookBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
        ])
        
    }
    
    @objc func rejoincallbtn_press()
    {
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
    
    @objc func bookBtn_press(){
     
        let vc = CustomTabBarController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    
    }
    
    @objc func reviewBtn_press(){
     
        let vc = AddDoctorreviewController()
        vc.modalPresentationStyle = .fullScreen
        vc.appointment = appointment
        self.present(vc, animated: true)
    
    }
    
    
}

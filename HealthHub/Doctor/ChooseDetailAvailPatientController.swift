//
//  ChooseDetailAvailPatientController.swift
//  HealthHub
//
//  Created by OBS on 27/01/2022.
//

import UIKit
import PDFKit

class ChooseDetailAvailPatientController: BaseController {

    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor(named: Colors.AppBGColor)
        SV.translatesAutoresizingMaskIntoConstraints = false
        SV.isScrollEnabled = true
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var DocIntroView : UIView = {
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
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "NA1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var docnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Anna Nicholas"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SelectBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.isHidden = false
        btn.titleLabel?.font = regular(size: 12)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.setTitle("See more >", for: .normal)
       btn.addTarget(self, action: #selector(selectbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var diseasenamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "Migrane | Asthma | Kidney stone"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var docrateLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 12)
        lbl.text = "4.5"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docreviewsLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 11)
        lbl.text = "230 Reviews"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    lazy var AboutdoctitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 13)
        lbl.text = "About Patient"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var AboutdocdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Patient has sever head ache. She is also suffering from asthma. Needs some assistance regarding never ending migrane and some other issues."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var AttachmenttitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Attachments"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var attachBtn1 : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "attach1"), for: .normal)
        btn.addTarget(self, action: #selector(attachBtn_press), for: .touchUpInside)
      
        return btn
    }()

    
    lazy var attachBtn2 : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.isHidden = true
        btn.setImage(UIImage(named: "attach2"), for: .normal)
      //  btn.addTarget(self, action: #selector(selectbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var contacttitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Contact method"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var contactmethodView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
         view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contactdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Patient has decided to recieve consultation through video call."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var contactactionBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Proceed to video call", for: .normal)
        btn.addTarget(self, action: #selector(proceedcallbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var noattachmenttitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 16)
        lbl.text = "No Attachment Right Now"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
        
    let BackendController = BackendClass.sharedInstance
    var getAppointmnetList = appointdata()
    var isFromNotification = false

    var PatientImageArray = ["",""]
    var Patientnamearray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        backBtn.tintColor = .white
        headerView.isHidden = false
        backBtn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        backBtn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        headerLbl.text = "Patient"
        if  getAppointmnetList.appoinment_type == "Call" {
            contactdescLbl.text = "Patient has decided to recieve consultation through video call."
        }else if  getAppointmnetList.appoinment_type == "Chat" {
            contactactionBtn.setTitle("Proceed to Chat", for: .normal)
            contactdescLbl.text = "Patient has decided to recieve consultation through messages."
        }else{
            contactdescLbl.text = "Patient has decided to recieve consultation through in person meeting."
        }
        
        if  getAppointmnetList.appoinment_type == "Call" {
            
        }else if  getAppointmnetList.appoinment_type == "Chat" {
            contactactionBtn.isHidden = false
            contactactionBtn.setTitle("Proceed to Chat", for: .normal)
            contactdescLbl.text = "Patient has decided to recieve consultation through messages."
        }else{
            contactactionBtn.isHidden = true
        }
        
        if getAppointmnetList.patient?.medical_record == nil || getAppointmnetList.patient?.medical_record == ""
        {
            self.noattachmenttitleLbl.isHidden = false
        }
        else
        {
            self.noattachmenttitleLbl.isHidden = true
        }
                
        setup()
        setupdata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = true
    }
    
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(DocIntroView)
        containerView.addSubview(docimg)
        containerView.addSubview(docnameLbl)
        containerView.addSubview(SelectBtn)
        containerView.addSubview(diseasenamelbl)
        containerView.addSubview(AboutdoctitleLbl)
        containerView.addSubview(AboutdocdescLbl)
        containerView.addSubview(AttachmenttitleLbl)
        containerView.addSubview(attachBtn1)
        containerView.addSubview(noattachmenttitleLbl)
        containerView.addSubview(attachBtn2)
        containerView.addSubview(contacttitleLbl)
        containerView.addSubview(contactmethodView)
        containerView.addSubview(contactdescLbl)
        containerView.addSubview(contactactionBtn)
                
        NSLayoutConstraint.activate([
        
            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: -6 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: -20 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

//
            DocIntroView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocIntroView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocIntroView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20 * appConstant.heightRatio),
            
//            DocIntroView.bottomAnchor.constraint(equalTo: AttachmenttitleLbl.topAnchor, constant: 20 * appConstant.heightRatio),

            //Bottom of Containerview Remember
//            DocIntroView.heightAnchor.constraint(equalToConstant: 241 * appConstant.widthRatio),
            
            docimg.topAnchor.constraint(equalTo: DocIntroView.topAnchor, constant: 12 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: DocIntroView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            docnameLbl.topAnchor.constraint(equalTo: docimg.topAnchor, constant: 0 * appConstant.heightRatio),
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
            docnameLbl.trailingAnchor.constraint(equalTo: SelectBtn.leadingAnchor, constant: -4 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            SelectBtn.centerYAnchor.constraint(equalTo: docnameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SelectBtn.topAnchor.constraint(equalTo: DocIntroView.topAnchor, constant: 30 * appConstant.heightRatio),
            SelectBtn.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -22 * appConstant.widthRatio),
            SelectBtn.heightAnchor.constraint(equalToConstant: 4 * appConstant.heightRatio),
            
            diseasenamelbl.topAnchor.constraint(equalTo: docnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            diseasenamelbl.leadingAnchor.constraint(equalTo: docnameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            diseasenamelbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            diseasenamelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            AboutdoctitleLbl.topAnchor.constraint(equalTo: docimg.bottomAnchor, constant: 10 * appConstant.heightRatio),
            AboutdoctitleLbl.leadingAnchor.constraint(equalTo: DocIntroView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AboutdoctitleLbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            AboutdocdescLbl.topAnchor.constraint(equalTo: AboutdoctitleLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            AboutdocdescLbl.leadingAnchor.constraint(equalTo: DocIntroView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AboutdocdescLbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            AboutdocdescLbl.bottomAnchor.constraint(equalTo: DocIntroView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            AttachmenttitleLbl.topAnchor.constraint(equalTo: DocIntroView.bottomAnchor, constant: 31 * appConstant.heightRatio),
            AttachmenttitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AttachmenttitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            attachBtn1.topAnchor.constraint(equalTo: AttachmenttitleLbl.bottomAnchor, constant: 25 * appConstant.heightRatio),
            attachBtn1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            attachBtn1.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            attachBtn1.widthAnchor.constraint(equalToConstant: 100 * appConstant.widthRatio),
            
            
            noattachmenttitleLbl.centerYAnchor.constraint(equalTo: attachBtn1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            noattachmenttitleLbl.centerXAnchor.constraint(equalTo: attachBtn1.centerXAnchor, constant: 40 * appConstant.heightRatio),

        
            attachBtn2.centerYAnchor.constraint(equalTo: attachBtn1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            attachBtn2.leadingAnchor.constraint(equalTo: attachBtn1.trailingAnchor, constant: 10 * appConstant.widthRatio),
            attachBtn2.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            attachBtn2.widthAnchor.constraint(equalToConstant: 100 * appConstant.widthRatio),
            
            contacttitleLbl.topAnchor.constraint(equalTo: attachBtn1.bottomAnchor, constant: 30 * appConstant.heightRatio),
            contacttitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            contacttitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            contactmethodView.topAnchor.constraint(equalTo: contacttitleLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
            contactmethodView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            contactmethodView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),

            contactmethodView.heightAnchor.constraint(equalToConstant: 82 * appConstant.heightRatio),
            
            
            contactdescLbl.topAnchor.constraint(equalTo: contactmethodView.topAnchor, constant: 17 * appConstant.heightRatio),
            contactdescLbl.leadingAnchor.constraint(equalTo: contactmethodView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            contactdescLbl.trailingAnchor.constraint(equalTo: contactmethodView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            
            contactactionBtn.topAnchor.constraint(equalTo: contactmethodView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            contactactionBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            contactactionBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),

            contactactionBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),

            contactactionBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio ),

            
        ])
        
    }
    
    func setupdata()
    {
        docnameLbl.text = getAppointmnetList.patient?.name
        diseasenamelbl.text = getAppointmnetList.compName
        AboutdocdescLbl.text = getAppointmnetList.compDesc
        let base = URLConstants.BASE_File
        let url = URL(string: base + "\(getAppointmnetList.patient?.medical_record ?? "")")!
        attachBtn1.setImage(drawPDFfromURL(url: url), for: .normal)
        let imgUrl = URL(string: base + "\(getAppointmnetList.patient?.url ?? "")")!
        docimg.kf.setImage(with: imgUrl)
    }
    
    @objc func selectbtn_press(){
        let vc = PatientMedicalHistoryController()
        vc.appointment = self.getAppointmnetList
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc override func backbtn_press(){
        if self.isFromNotification {
            self.dismiss(animated: true)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc func attachBtn_press(){
        let vc = MedicalAttachmentController()
        let base = URLConstants.BASE_File
        let url = URL(string: base + "\(getAppointmnetList.patient?.medical_record ?? "")")!
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func proceedcallbtn_press(){
        if  getAppointmnetList.appoinment_type == "Call" {
            let idetity =  AppUserDefault.shared.username ?? ""
            DispatchQueue.main.async {
                ActivityIndicator.shared.showSpinner(onView: self.view)
            }
            BackendController.joinRoom(identity: idetity,name: getAppointmnetList.roomName ?? "") { accesToken, room_name, hasError in
                DispatchQueue.main.async {
                    ActivityIndicator.shared.removeSpinner()
                }
                 if !hasError{
                     
                     DispatchQueue.main.async {
                      //   RSLoadingView.hide(from: self.view)
                         let vc = DoctorVideoCallController()
                         vc.accessToken  = accesToken
                         vc.room_name  = room_name
                         vc.appointment = self.getAppointmnetList
                         if self.isFromNotification {
                             
                            
                             let navController = UINavigationController(rootViewController: vc)
                             navController.navigationBar.isHidden = true
                             navController.navigationItem.backBarButtonItem?.isEnabled = false
                             navController.modalPresentationStyle = .overFullScreen
                             self.present(navController, animated: false, completion: nil)
                         }else{
                             self.navigationController?.pushViewController(vc, animated: true)
                         }
                         
                     }
                     
                 }else{
                     print(room_name)
                 //    RSLoadingView.hide(from: self.view)
                 }
             }
        }
        else if getAppointmnetList.appoinment_type == "Chat"
        {
            let vc = MessgeViewController()
            vc.userID = getAppointmnetList.patient?.id ?? 0
            vc.title = getAppointmnetList.patient?.name ?? ""
//            let navController = UINavigationController(rootViewController: vc)
//            navController.navigationBar.isHidden = false
//            navController.navigationItem.backBarButtonItem?.isEnabled = false
//            navController.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }

        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)

            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)

            ctx.cgContext.drawPDFPage(page)
        }

        return img
    }
    
}


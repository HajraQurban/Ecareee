//
//  DoctorDashBoardController.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import UIKit
import SSCustomSideMenu
import LGSideMenuController


class DoctorDashBoardController: BaseController {
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor(named: Colors.AppBGColor)
        SV.translatesAutoresizingMaskIntoConstraints = false
        SV.showsVerticalScrollIndicator = false
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        //        view.layer.cornerRadius  = 25 * appConstant.heightRatio
        //        view.layer.shadowColor = UIColor.black.cgColor
        //        view.layer.shadowOpacity = 0.25
        //        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        //        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Moringtitle : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Good Morning Dr. Strange!"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Getstartedlogo : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DashBoardGraph")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isHidden = true
        return iv
    }()
    
    
    
    lazy var TotalvisitsView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 5 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var TotalvisitsTextFieldlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "Total visits"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Totalvisitsdesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = medium(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var PaidvisitsView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 5 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var PaidvisitsTextFieldlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "Paid visits"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Paidvisitsdesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = medium(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var upcomingtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Upcoming Appointment"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var viewallupcommingbtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = semiBold(size: 14)
        btn.setTitle("View all ", for: .normal)
        btn.sizeToFit()
        btn.isHidden = true
        btn.addTarget(self, action: #selector(allupcomming_press), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    lazy var upcomingApointView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        //        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        //        view.layer.shadowColor = UIColor.black.cgColor
        //        view.layer.shadowOpacity = 0.25
        //        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        //        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var upcomingApointTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var toptitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Top category"
        lbl.numberOfLines = 0
        lbl.isHidden = true
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var FindDocCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.isHidden = true
        collectionView.contentMode = .scaleToFill
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return  collectionView
    }()
    
    lazy var AvailbletitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Pending Requests"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var viewallbuttonbtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = semiBold(size: 14)
        btn.setTitle("View all ", for: .normal)
        btn.sizeToFit()
        btn.isHidden = true
        btn.addTarget(self, action: #selector(allbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var newpatientbtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitleColor(UIColor(named: Colors.AppColor), for: .normal)
        btn.titleLabel?.font = regular(size: 11)
        btn.setTitle("New Patients", for: .normal)
        btn.sizeToFit()
        btn.isHidden = true
        //        btn.addTarget(self, action: #selector(nobtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var newpatlineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.clipsToBounds = true
        //        view.layer.cornerRadius = 5 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var AvailablePatientTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.clear
        tv.clipsToBounds = true
        //        tv.separatorStyle = .none
        //        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var noAppointmnetLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 15)
        lbl.text = "No Appointment Right Now"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var nopendingAppointmnetLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 15)
        lbl.text = "No Pending Requests Right Now"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let menuTable = SSMenuTableView()
    
    
    let menuCellConfig = SSMenuCellConfig()
    
    
    //For Patient Data
    var PatientImageArray = ["NA1","NA2"]
    var Patientnamearray : [String] = ["Natasha","Peter parker"]
    
    
    
    var DocTypeImages = ["Toothimg","Eyeimg","lungimg"]
    var DocTypeArray : [String] = ["Dental","Oftalmology","Pulmonology"]
    
    
    
    // the constraint we'll use for myView's height
    var myViewHeightConstraint = NSLayoutConstraint()
    var pendingHeightConstraint = NSLayoutConstraint()
    
    let appointmanager = GetappointmentManager()
    var homeManager = Dr_HomeManager()
    var GetAppointList = GetappointmentModal()
    var homeModel = HomeModel()
    var statusManager =  AppointmentStatusChangeManager()
    
    //For Side Menu
    var window: UIWindow?
    var mainController = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        headerView.isHidden = false
        menuBtn.isHidden = true
        backBtn.isHidden = true
        menuBtn.setImage(UIImage(named: "Sidebtn"), for: .normal)
        menuBtn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        headerLbl.text = "Home"
        SetupCre()
       
        
        upcomingApointTV.delegate = self
        upcomingApointTV.dataSource = self
        upcomingApointTV.register(UpcomingApointmentCell.self, forCellReuseIdentifier: UpcomingApointmentCell.cellidentifier)
        
        AvailablePatientTV.delegate = self
        AvailablePatientTV.dataSource = self
        AvailablePatientTV.register(AvailablePatientRequestTVCell.self, forCellReuseIdentifier: AvailablePatientRequestTVCell.cellidentifier)
        
        //
        FindDocCV.delegate = self
        FindDocCV.dataSource = self
        FindDocCV.register(FindSpecialistCVCell.self, forCellWithReuseIdentifier: FindSpecialistCVCell.identifier)
        
        setHeading()
        
        AppUserDefault.shared.isDoctorLogin = true
        AppUserDefault.shared.isPatientLogin = false
        
//        setupsidemenu()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//                getappointmentlist()
        //        self.upcomingApointTV.reloadData()
        getHomeData()
    }
    
    func SetupCre()
    {
        let margin = view.layoutMarginsGuide

        view.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(Moringtitle)
        containerView.addSubview(Getstartedlogo)
        containerView.addSubview(TotalvisitsView)
        TotalvisitsView.addSubview(TotalvisitsTextFieldlbl)
        TotalvisitsView.addSubview(Totalvisitsdesclbl)
        containerView.addSubview(PaidvisitsView)
        PaidvisitsView.addSubview(PaidvisitsTextFieldlbl)
        PaidvisitsView.addSubview(Paidvisitsdesclbl)
        containerView.addSubview(upcomingtitleLbl)
        containerView.addSubview(viewallupcommingbtn)
        containerView.addSubview(upcomingApointView)
        upcomingApointView.addSubview(noAppointmnetLbl)
        upcomingApointView.addSubview(upcomingApointTV)
        containerView.addSubview(toptitleLbl)
        containerView.addSubview(FindDocCV)
        containerView.addSubview(AvailbletitleLbl)
        containerView.addSubview(viewallbuttonbtn)
        containerView.addSubview(newpatientbtn)
        containerView.addSubview(newpatlineView)
        containerView.addSubview(AvailablePatientTV)
        containerView.addSubview(nopendingAppointmnetLbl)
        
        myViewHeightConstraint = upcomingApointView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio)
        myViewHeightConstraint.isActive = true
        pendingHeightConstraint = AvailablePatientTV.heightAnchor.constraint(equalToConstant: 140 * appConstant.heightRatio)
        pendingHeightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 6 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            //     containerView.heightAnchor.constraint(equalToConstant: 650 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            
            Moringtitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 19 * appConstant.heightRatio),
            
            //  Moringtitle.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            Moringtitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 29 * appConstant.heightRatio),
            Moringtitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -29 * appConstant.heightRatio),
            
            Getstartedlogo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant:  0 * appConstant.heightRatio),
            Getstartedlogo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant:  0 * appConstant.heightRatio),
            Getstartedlogo.topAnchor.constraint(equalTo: Moringtitle.bottomAnchor,constant:  0 * appConstant.heightRatio),
            
            
            TotalvisitsView.topAnchor.constraint(equalTo: Moringtitle.bottomAnchor, constant: 12 * appConstant.heightRatio),
            TotalvisitsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 34 * appConstant.heightRatio),
            TotalvisitsView.heightAnchor.constraint(equalToConstant: 82 * appConstant.heightRatio),
            TotalvisitsView.widthAnchor.constraint(equalToConstant: 148 * appConstant.widthRatio),
            //            TotalvisitsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -20 * appConstant.heightRatio),
            
            
            TotalvisitsTextFieldlbl.topAnchor.constraint(equalTo: TotalvisitsView.topAnchor, constant: 20 * appConstant.heightRatio),
            TotalvisitsTextFieldlbl.leadingAnchor.constraint(equalTo: TotalvisitsView.leadingAnchor, constant: 11 * appConstant.heightRatio),
            TotalvisitsTextFieldlbl.heightAnchor.constraint(equalToConstant: 14 * appConstant.heightRatio),
            
            Totalvisitsdesclbl.topAnchor.constraint(equalTo: TotalvisitsTextFieldlbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            Totalvisitsdesclbl.leadingAnchor.constraint(equalTo: TotalvisitsView.leadingAnchor, constant: 11 * appConstant.heightRatio),
            Totalvisitsdesclbl.heightAnchor.constraint(equalToConstant: 14 * appConstant.heightRatio),
            
            //
            
            PaidvisitsView.centerYAnchor.constraint(equalTo: TotalvisitsView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            PaidvisitsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -34 * appConstant.heightRatio),
            PaidvisitsView.heightAnchor.constraint(equalToConstant: 82 * appConstant.heightRatio),
            PaidvisitsView.widthAnchor.constraint(equalToConstant: 148 * appConstant.widthRatio),
            
            
            PaidvisitsTextFieldlbl.topAnchor.constraint(equalTo: PaidvisitsView.topAnchor, constant: 20 * appConstant.heightRatio),
            PaidvisitsTextFieldlbl.leadingAnchor.constraint(equalTo: PaidvisitsView.leadingAnchor, constant: 11 * appConstant.heightRatio),
            PaidvisitsTextFieldlbl.heightAnchor.constraint(equalToConstant: 14 * appConstant.heightRatio),
            
            
            Paidvisitsdesclbl.topAnchor.constraint(equalTo: PaidvisitsTextFieldlbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            Paidvisitsdesclbl.leadingAnchor.constraint(equalTo: PaidvisitsView.leadingAnchor, constant: 11 * appConstant.heightRatio),
            Paidvisitsdesclbl.heightAnchor.constraint(equalToConstant: 14 * appConstant.heightRatio),
            
            
            
            upcomingtitleLbl.topAnchor.constraint(equalTo: TotalvisitsView.bottomAnchor, constant: 25 * appConstant.heightRatio),
            
            //  upcomingtitleLbl.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            upcomingtitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            upcomingtitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            viewallupcommingbtn.centerYAnchor.constraint(equalTo: upcomingtitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            //  viewallbuttonbtn.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            viewallupcommingbtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            viewallupcommingbtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            upcomingApointView.topAnchor.constraint(equalTo: upcomingtitleLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            upcomingApointView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            upcomingApointView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            
            //            upcomingApointView.heightAnchor.constraint(equalToConstant: 119 * appConstant.heightRatio),
            //
            
            upcomingApointTV.topAnchor.constraint(equalTo: upcomingApointView.topAnchor, constant: 0 * appConstant.heightRatio),
            upcomingApointTV.leadingAnchor.constraint(equalTo: upcomingApointView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            upcomingApointTV.trailingAnchor.constraint(equalTo: upcomingApointView.trailingAnchor, constant: -0 * appConstant.heightRatio),
            upcomingApointTV.bottomAnchor.constraint(equalTo: upcomingApointView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            
            noAppointmnetLbl.centerYAnchor.constraint(equalTo: upcomingApointView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            noAppointmnetLbl.centerXAnchor.constraint(equalTo: upcomingApointView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            
            toptitleLbl.topAnchor.constraint(equalTo: upcomingApointView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            
            //  upcomingtitleLbl.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            toptitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            toptitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //            toptitleLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -0 * appConstant.heightRatio),
            
            
            FindDocCV.topAnchor.constraint(equalTo: toptitleLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            FindDocCV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            FindDocCV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            FindDocCV.heightAnchor.constraint(equalToConstant: 150),
            //            FindDocCV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -0 * appConstant.heightRatio),
            
            
            AvailbletitleLbl.topAnchor.constraint(equalTo: toptitleLbl.topAnchor, constant: 0 * appConstant.heightRatio),
            AvailbletitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AvailbletitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            viewallbuttonbtn.centerYAnchor.constraint(equalTo: AvailbletitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            //  viewallbuttonbtn.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            viewallbuttonbtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            viewallbuttonbtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            newpatientbtn.topAnchor.constraint(equalTo: AvailbletitleLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            newpatientbtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            newpatientbtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //            newpatientbtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -0 * appConstant.heightRatio),
            
            newpatlineView.topAnchor.constraint(equalTo: AvailbletitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            
            //  newpatlineView.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            newpatlineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            newpatlineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            newpatlineView.leadingAnchor.constraint(equalTo: newpatientbtn.leadingAnchor, constant: 0 * appConstant.widthRatio),
            
            AvailablePatientTV.topAnchor.constraint(equalTo: newpatlineView.bottomAnchor, constant: 4 * appConstant.heightRatio),
            AvailablePatientTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14 * appConstant.heightRatio),
            AvailablePatientTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
//            AvailablePatientTV.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            
            AvailablePatientTV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            
            
            nopendingAppointmnetLbl.centerYAnchor.constraint(equalTo: AvailablePatientTV.centerYAnchor, constant: 0 * appConstant.heightRatio),
            nopendingAppointmnetLbl.centerXAnchor.constraint(equalTo: AvailablePatientTV.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            //
            
        ])
        
    }
    
    func getHomeData()
    {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        
        homeManager.homeData { homeData, msg, hasError in
            DispatchQueue.main.async {
                ActivityIndicator.shared.removeSpinner()
            }
            
            if hasError{
                
                //    RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                guard  let home = homeData else {
                    return
                }
                self.homeModel = home
                self.Totalvisitsdesclbl.text = String(home.data?.totalVisit ?? 0)
                self.Paidvisitsdesclbl.text = String(home.data?.paidVisit ?? 0)
                if home.data?.upcomming?.count ?? 0 == 0 {
                    self.upcomingApointTV.isHidden = true
                    self.noAppointmnetLbl.isHidden = false
                    self.viewallupcommingbtn.isHidden = true
                }else{
                    self.viewallupcommingbtn.isHidden = false
                    self.upcomingApointTV.isHidden = false
                    self.noAppointmnetLbl.isHidden = true
                }
                
                if home.data?.pending?.count ?? 0 == 0 {
                    self.viewallbuttonbtn.isHidden = true
                    self.nopendingAppointmnetLbl.isHidden = false
                }else{
                    self.viewallbuttonbtn.isHidden = false
                    self.nopendingAppointmnetLbl.isHidden = true
                }
                self.upcomingApointTV.reloadData()
                self.AvailablePatientTV.reloadData()
            }
        }
        
    }
    
    
    func getappointmentlist()
    {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        
        appointmanager.getappointmentlist { docdata, msg, hasError in
            DispatchQueue.main.async {
                ActivityIndicator.shared.removeSpinner()
            }
            
            if hasError{
                
                //    RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data != nil
                {
                    if docdata!.data?.count ?? 0 != 0{
                        self.GetAppointList =  docdata!
                        self.upcomingApointTV.isHidden = false
                        self.upcomingApointTV.reloadData()
                        self.noAppointmnetLbl.isHidden = true
                        
                    }else{
                        self.upcomingApointTV.isHidden = true
                        self.noAppointmnetLbl.isHidden = false
                    }
                    
                }
                else
                {
                    alertWithMsg(vc: self, msg:"No Appointment Right Now", title: "Alert!")
                    
                }
            }
        }
        
    }
    
    func setupsidemenu()
    {
        mainController = DoctorDashBoardController()
        let rootNavigationController = UINavigationController(rootViewController: mainController)
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
        self.view.window?.rootViewController = sideMenuController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @objc func allupcomming_press(){
        let vc = DoctorCustomTabbarController()
        vc.selectedIndex = 1
        self.tabBarController?.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    
    
    @objc func allbtn_press(){
        let vc = ChooseAvailablePatientController()
        vc.homeModel = self.homeModel
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @objc override func backbtn_press(){
        
        let sideMenuVc = self.view.window?.rootViewController as! LGSideMenuController
        UIView.animate(withDuration: 0.35, delay: 0.10, options: .curveEaseIn, animations: {
            //      sideMenuVc.leftViewPresentationStyle = .scaleFromLittle
            //        sideMenuVc.leftViewPresentationStyle = .
            sideMenuVc.showLeftView()
            sideMenuVc.isLeftViewSwipeGestureDisabled = false
            sideMenuVc.isLeftViewSwipeGestureEnabled = true
            //  sideMenuVc.leftViewWidth = 300.0
        }, completion: nil)
    }
    //            if #available(iOS 13.0, *) {
    //              SignInViewController.isfromHome = true
    //            } else {
    //              // Fallback on earlier versions
    //            }
    //            moveToLogin(self.tabBarController!)
    
    
}


extension DoctorDashBoardController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == AvailablePatientTV
        {
            if homeModel.data?.pending?.count ?? 0 >= 2{
                pendingHeightConstraint.isActive = false
                pendingHeightConstraint = AvailablePatientTV.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio)
                pendingHeightConstraint.isActive = true
                return 2
            }
            else if homeModel.data?.pending?.count ?? 0 <= 1
            {
            pendingHeightConstraint.isActive = false
            pendingHeightConstraint = AvailablePatientTV.heightAnchor.constraint(equalToConstant: 140 * appConstant.heightRatio)
            pendingHeightConstraint.isActive = true
            }
            return homeModel.data?.pending?.count ?? 0
        }
        else{
            if homeModel.data?.upcomming?.count ?? 0 > 1{
                myViewHeightConstraint.isActive = false
                myViewHeightConstraint = upcomingApointView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio)
                myViewHeightConstraint.isActive = true
            }
            return homeModel.data?.upcomming?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == AvailablePatientTV
        {
            let cell = AvailablePatientTV.dequeueReusableCell(withIdentifier: AvailablePatientRequestTVCell.cellidentifier, for: indexPath) as! AvailablePatientRequestTVCell
            let patient = homeModel.data?.pending![indexPath.row]
            cell.patientnameLbl.text = patient?.patient?.name ?? ""
            if patient?.patient?.url ?? "" == nil ||  patient?.patient?.url ?? "" == ""
            {
                cell.patientimg.image = UIImage(named: "Profile_img")
            }
            else
            {
                let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
                let url = URL(string: base + ( patient?.patient?.url ?? ""))
                cell.patientimg.kf.setImage(with: url)
            }
            
            cell.appointmentdatelbl.text = patient?.slot?.date ?? ""
            cell.rejectBtn.tag = indexPath.row
            cell.docavailibiltyBtn.tag = indexPath.row
            cell.rejectBtn.addTarget(self, action: #selector(rejectAppointment), for: .touchUpInside)
            cell.docavailibiltyBtn.addTarget(self, action: #selector(acceptAppointment), for: .touchUpInside)
            return cell
        }
        else
        {
            let cell = upcomingApointTV.dequeueReusableCell(withIdentifier: UpcomingApointmentCell.cellidentifier, for: indexPath) as! UpcomingApointmentCell
            
            let Appointmentadata = homeModel.data?.upcomming![indexPath.row]
            
            cell.topView.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
            
            cell.datetimehospitaltitleLbl.text = "\(Appointmentadata?.slot?.date ?? "")"  + ", " + "\(Appointmentadata?.slot?.start_time ?? " ")"  + ", " + "\(Appointmentadata?.doctor?.hospital_name ?? " ")"
            cell.docnametitleLbl.text = Appointmentadata?.patient?.name
//            cell.docnametitleLbl.text = Appointmentadata?.patient?.category?.name ?? ""
            if Appointmentadata?.appoinment_type == "Call"
            {
                cell.docimg.image = UIImage(named: "CalIcon")
                cell.docimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
            }
            else if Appointmentadata?.appoinment_type == "Chat"
            {
                cell.docimg.image = UIImage(named: "ChatIcon")
                cell.docimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
            }
            else
            {
                cell.docimg.image = UIImage(named: "Calendar")
                cell.docimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == upcomingApointTV{
            let vc = ChooseDetailAvailPatientController()
            vc.modalPresentationStyle = .fullScreen
            vc.getAppointmnetList = (homeModel.data?.upcomming?[indexPath.row])!
            self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == AvailablePatientTV
        {
            return 120 * appConstant.heightRatio
        }
        else
        {
            return 100 * appConstant.heightRatio
        }
    }
    
    @objc func acceptAppointment(_ sender: UIButton){
        let id = homeModel.data?.pending![sender.tag].id
        let params : [String:Any] = ["appoinment_id":id ?? 0,"status":"Approved"]
        ActivityIndicator.shared.showSpinner(onView: self.view)
        statusManager.changeStatus(params: params) { msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Error")
            }else{
                self.getHomeData()
            }
            
        }
        
    }
    
    @objc func rejectAppointment(_ sender: UIButton){
        let id = homeModel.data?.pending![sender.tag].id
        let params : [String:Any] = ["appoinment_id":id ?? 0,"status":"Rejected"]
        ActivityIndicator.shared.showSpinner(onView: self.view)
        statusManager.changeStatus(params: params) { msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Error")
            }else{
                self.getHomeData()
            }
            
        }
    }
    
}


extension DoctorDashBoardController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = FindDocCV.dequeueReusableCell(withReuseIdentifier: FindSpecialistCVCell.identifier, for: indexPath) as! FindSpecialistCVCell
        
        //    let doctorcategory = arrFilterData.data?[indexPath.row]
        cell.TypetitleLbl.text = DocTypeArray[indexPath.row]
        cell.TypeImage.image = UIImage(named: DocTypeImages[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let doctorcategory = getcatlist.data?[indexPath.row]
        //        let vc = SearchDoctorController()
        //        vc.modalPresentationStyle = .fullScreen
        //        vc.cat_id = doctorcategory?.id!
        //        self.navigationController?.pushViewController(vc, animated: true)
        //        self.navigationController?.pushViewController(EditProfileController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.FindDocCV.frame.width/3.0) - 5 , height:135 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  3
    }
    
}

extension DoctorDashBoardController{
    
    func setHeading(){
        let hour = Calendar.current.component(.hour, from: Date())

            switch hour {
                case 6..<7 :
                Moringtitle.text = ("Good Noon \(AppUserDefault.shared.username ?? "")")
                    print(NSLocalizedString("Morning", comment: "Morning"))
                case 7..<12 :
                    Moringtitle.text = ("Good Morning \(AppUserDefault.shared.username ?? "")")
                    print(NSLocalizedString("Noon", comment: "Noon"))
                case 13..<17 :
                    Moringtitle.text = ("Good Afternoon \(AppUserDefault.shared.username ?? "")")
                    print(NSLocalizedString("Afternoon", comment: "Afternoon"))
                case 17..<22 :
                    Moringtitle.text = ("Good Evening \(AppUserDefault.shared.username ?? "")")
                    print(NSLocalizedString("Evening", comment: "Evening"))
                
                default:
                    Moringtitle.text = ("Welcome \(AppUserDefault.shared.username ?? "")")
                    print(NSLocalizedString("Night", comment: "Night"))
            }
    }
    
}


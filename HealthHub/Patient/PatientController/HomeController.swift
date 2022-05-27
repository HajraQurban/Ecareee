//
//  HomeController.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit
import Kingfisher

class HomeController: UIViewController {
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.clipsToBounds = true
        SV.showsVerticalScrollIndicator = false
        SV.translatesAutoresizingMaskIntoConstraints = false
        SV.alwaysBounceVertical = false
        SV.bounces = false
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = false
        view.layer.cornerRadius = 0 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var SideBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "Sidebtn"), for: .normal)
        btn.addTarget(self, action: #selector(sidebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var PerNameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.ButtonBG)
        lbl.textAlignment = .center
        lbl.font = bold(size: 24)
        lbl.text = "Hi, Richard"
        lbl.numberOfLines = 0
        lbl.isHidden = true
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ProfileImg : UIImageView = {
        let btn = UIImageView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.contentMode = .scaleAspectFit
        btn.clipsToBounds = true
        btn.isHidden = true
        btn.layer.cornerRadius = 19 * appConstant.heightRatio
        
        btn.image = UIImage(named: "Profile_img")
        
        //        btn.setImage(UIImage(named: "Profile_img"), for: .normal)
        //        btn.addTarget(self, action: #selector(profilebtn_press), for: .touchUpInside)
        //
        return btn
    }()
    
    lazy var Homelogo : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Homelogobg")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
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
        btn.setTitleColor(UIColor(named: Colors.AppColor), for: .normal)
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
        view.isHidden = false
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
        tv.alwaysBounceVertical = false
        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var topcategorytitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Find Your doctor"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var SearchTextField1View : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var search1Btn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "SearchIcon"), for: .normal)
        //      btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var diseaseTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Pulmonology"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var Cross1Btn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "ClearIcon"), for: .normal)
        btn.addTarget(self, action: #selector(croosbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var SearchdocView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        collectionView.contentMode = .scaleToFill
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return  collectionView
    }()
    
    lazy var bottoumView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.isHidden = false
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var DocTypeImages = ["Toothimg","Eyeimg","lungimg"]
    var DocTypeArray : [String] = ["Dental","Oftalmology","Pulmonology"]
    
    let manager = DocCategoryManagers()
    
    let appointmanager = GetappointmentManager()
    
    var GetAppointList = GetappointmentModal()
    
    //   var DocTypeImages = ["Toothimg","Eyeimg","lungimg","Pregnancyimg","Crutchimg","Toothimg","Plasterimg","Therometerimg","Stethoscopeimg"]
    //   var DocTypeArray : [String] = ["Dental","Oftalmology","Pulmonology","Obstetrician","Orthopedia","Counseling","Dermathology","Pediatrician","GP"]
    
    var getcatlist = GetDocData()
    
    var arrFilterData = GetDocData()
    
    var isSearch : Bool!
    
    // the constraint we'll use for myView's height
    var myViewHeightConstraint = NSLayoutConstraint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isSearch = false
        
        self.navigationController?.navigationBar.isHidden = true
        //        headerView.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ProfileImg.isUserInteractionEnabled = false
        ProfileImg.addGestureRecognizer(tapGestureRecognizer)
        setdata()
        view.backgroundColor = .white
        FindDocCV.delegate = self
        FindDocCV.dataSource = self
        FindDocCV.register(FindSpecialistCVCell.self, forCellWithReuseIdentifier: FindSpecialistCVCell.identifier)
        setupCre()
        
        upcomingApointTV.delegate = self
        upcomingApointTV.dataSource = self
        upcomingApointTV.register(UpcomingApointmentCell.self, forCellReuseIdentifier: UpcomingApointmentCell.cellidentifier)
        
        PerNameLbl.text = ("Hi, \(AppUserDefault.shared.username ?? "")")
    
        upcomingtitleLbl.isHidden = true
        SideBtn.isHidden = true
        
        //        getappointmentlist()
        //        self.upcomingApointTV.reloadData()
        
        //Setting The UserDefault Save Data Into The Global Object.
        AssignDataToBackgroundHistory()
        
        self.arrFilterData.data = self.getcatlist.data
        
        AppUserDefault.shared.isPatientLogin = true
        AppUserDefault.shared.isDoctorLogin = false
        
        
        self.diseaseTF.addTarget(self, action: #selector(searchWorkersAsPerText(_ :)), for: .editingChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getdoctorcategorylist()
        self.FindDocCV.reloadData()
        getappointmentlist()
        self.upcomingApointTV.reloadData()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.scrollview.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollview.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollview.contentInset = contentInset
    }
    
    
    func setupCre()
    {
        let margin = view.layoutMarginsGuide
        
      
        view.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(Homelogo)
//        containerView.addSubview(SideBtn)
//        containerView.addSubview(PerNameLbl)
//        containerView.addSubview(ProfileImg)
        containerView.addSubview(bottoumView)
        bottoumView.addSubview(upcomingApointView)
        upcomingApointView.addSubview(upcomingtitleLbl)
//        upcomingApointView.addSubview(viewallupcommingbtn)
        upcomingApointView.addSubview(upcomingApointTV)
        bottoumView.addSubview(topcategorytitleLbl)
        bottoumView.addSubview(SearchdocView)
        bottoumView.addSubview(SearchTextField1View)
        SearchTextField1View.addSubview(search1Btn)
        SearchTextField1View.addSubview(diseaseTF)
        SearchTextField1View.addSubview(Cross1Btn)
        bottoumView.addSubview(FindDocCV)
        
        myViewHeightConstraint = upcomingApointView.heightAnchor.constraint(equalToConstant: 0 * appConstant.heightRatio)
        myViewHeightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
          
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: view.topAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
//
//            SideBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24 * appConstant.heightRatio),
//            SideBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
//            SideBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
//            SideBtn.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),
//
//
//            PerNameLbl.centerYAnchor.constraint(equalTo: SideBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            PerNameLbl.leadingAnchor.constraint(equalTo: SideBtn.leadingAnchor, constant: 0 * appConstant.heightRatio),
//            PerNameLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
//
//            ProfileImg.centerYAnchor.constraint(equalTo: PerNameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            ProfileImg.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25 * appConstant.heightRatio),
//            ProfileImg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
//            ProfileImg.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            
            
            
            Homelogo.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -10 * appConstant.heightRatio),
            Homelogo.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            Homelogo.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0 * appConstant.heightRatio),
            Homelogo.heightAnchor.constraint(equalToConstant: 250 * appConstant.heightRatio),
            
            bottoumView.topAnchor.constraint(equalTo: Homelogo.bottomAnchor, constant: 5 * appConstant.heightRatio),
            bottoumView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            bottoumView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            bottoumView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40),
//            bottoumView.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            upcomingApointView.topAnchor.constraint(equalTo: bottoumView.topAnchor, constant: 12 * appConstant.heightRatio),
            upcomingApointView.leadingAnchor.constraint(equalTo: bottoumView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            upcomingApointView.trailingAnchor.constraint(equalTo: bottoumView.trailingAnchor, constant: -20 * appConstant.heightRatio),
      
            upcomingtitleLbl.topAnchor.constraint(equalTo: upcomingApointView.topAnchor, constant: 4 * appConstant.heightRatio),
            upcomingtitleLbl.leadingAnchor.constraint(equalTo: upcomingApointView.leadingAnchor, constant: 4 * appConstant.heightRatio),
            upcomingtitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
////            viewallupcommingbtn.centerYAnchor.constraint(equalTo: upcomingtitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            viewallupcommingbtn.topAnchor.constraint(equalTo: upcomingApointView.topAnchor, constant: 5 * appConstant.heightRatio),
//            viewallupcommingbtn.trailingAnchor.constraint(equalTo: upcomingApointView.trailingAnchor, constant: -4 * appConstant.widthRatio),
////            viewallupcommingbtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),


            upcomingApointTV.topAnchor.constraint(equalTo: upcomingtitleLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            upcomingApointTV.leadingAnchor.constraint(equalTo: upcomingApointView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            upcomingApointTV.trailingAnchor.constraint(equalTo: upcomingApointView.trailingAnchor, constant: -0 * appConstant.heightRatio),
            upcomingApointTV.bottomAnchor.constraint(equalTo: upcomingApointView.bottomAnchor, constant: -0 * appConstant.heightRatio),
//
            topcategorytitleLbl.topAnchor.constraint(equalTo: upcomingApointView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            topcategorytitleLbl.leadingAnchor.constraint(equalTo: bottoumView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            topcategorytitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),


            SearchdocView.topAnchor.constraint(equalTo: topcategorytitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            SearchdocView.leadingAnchor.constraint(equalTo: bottoumView.leadingAnchor, constant: 0  * appConstant.heightRatio),
            SearchdocView.trailingAnchor.constraint(equalTo: bottoumView.trailingAnchor, constant: 0  * appConstant.heightRatio),
            SearchdocView.heightAnchor.constraint(equalToConstant: 65 * appConstant.heightRatio),


            SearchTextField1View.centerYAnchor.constraint(equalTo: SearchdocView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SearchTextField1View.leadingAnchor.constraint(equalTo: SearchdocView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            SearchTextField1View.trailingAnchor.constraint(equalTo: SearchdocView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SearchTextField1View.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),

            search1Btn.topAnchor.constraint(equalTo: SearchTextField1View.topAnchor, constant: 14 * appConstant.heightRatio),
            search1Btn.leadingAnchor.constraint(equalTo: SearchTextField1View.leadingAnchor, constant: 10 * appConstant.heightRatio),
            search1Btn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            search1Btn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),

            diseaseTF.topAnchor.constraint(equalTo: SearchTextField1View.topAnchor, constant: 14 * appConstant.heightRatio),
            diseaseTF.leadingAnchor.constraint(equalTo: search1Btn.trailingAnchor, constant: 8 * appConstant.heightRatio),
            diseaseTF.trailingAnchor.constraint(equalTo: SearchTextField1View.trailingAnchor, constant: -80 * appConstant.heightRatio),
            diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            Cross1Btn.centerYAnchor.constraint(equalTo: diseaseTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
            Cross1Btn.topAnchor.constraint(equalTo: SearchTextField1View.topAnchor, constant: 14 * appConstant.heightRatio),
            Cross1Btn.trailingAnchor.constraint(equalTo: SearchTextField1View.trailingAnchor, constant: -18 * appConstant.heightRatio),
            Cross1Btn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            Cross1Btn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),


            FindDocCV.topAnchor.constraint(equalTo: SearchdocView.bottomAnchor, constant: 5 * appConstant.heightRatio),
            FindDocCV.leadingAnchor.constraint(equalTo: bottoumView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            FindDocCV.trailingAnchor.constraint(equalTo: bottoumView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            FindDocCV.heightAnchor.constraint(equalToConstant: 400 * appConstant.heightRatio),
            FindDocCV.bottomAnchor.constraint(equalTo: bottoumView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            
        ])
        
    }
    
    
    func AssignDataToBackgroundHistory()
    {
        smoke  =  AppUserDefault.shared.smoke ?? ""
        diabetes  =  AppUserDefault.shared.diabetes ?? ""
        epilepsy   =  AppUserDefault.shared.epilepsy ?? ""
        allergy   =  AppUserDefault.shared.allergy ?? ""
        diabetes2   =  AppUserDefault.shared.diabetes2 ?? ""
        heart    =  AppUserDefault.shared.heart ?? ""
        kindny   =  AppUserDefault.shared.kindny ?? ""
        arthistics   =  AppUserDefault.shared.arthistics ?? ""
        pulmonary   =  AppUserDefault.shared.pulmonary ?? ""
        eatingdisorder   =  AppUserDefault.shared.eatingdisorder ?? ""
        
    }
    
    func setdata()
    {
        
        if AppUserDefault.shared.url == nil
        {
            ProfileImg.image = UIImage(named: "Profile_img")
        }
        else
        {
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
            let url = URL(string: base + ( AppUserDefault.shared.url ?? ""))
            ProfileImg.kf.setImage(with: url)
        }
        PerNameLbl.text = AppUserDefault.shared.username
        
    }
    
    
    @objc func searchbtn_press(){
        
    }
    
    @objc func allupcomming_press(){
        let vc = CustomTabBarController()
        vc.selectedIndex = 1
        self.tabBarController?.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    @objc func croosbtn_press(){
        DispatchQueue.main.async {
            self.diseaseTF.text = " "
            self.isSearch = false
            self.FindDocCV.reloadData()
        }
    }
    
    @objc func sidebtn_press(){
        //  self.navigationController?.pushViewController(EditProfileController(), animated: true)
        let vc = OnboardingController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    @objc func profilebtn_press(){
        
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //  let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        self.navigationController?.pushViewController(MyProfileController(), animated: true)
        
    }
    
    @objc func searchWorkersAsPerText(_ textfield:UITextField) {
        self.arrFilterData.data?.removeAll()
        isSearch = true
        if textfield.text?.count != 0 {
            
            let alldata = getcatlist.data
            for dicData in alldata! {
                let isMachingWorker : NSString = (dicData.name!) as NSString
                let range = isMachingWorker.lowercased.range(of: textfield.text!, options: NSString.CompareOptions.caseInsensitive, range: nil,   locale: nil)
                arrFilterData.data =  getcatlist.data!.filter{($0.name?.localizedCaseInsensitiveContains( textfield.text ?? ""))!}
                //            let matchword = diseaseTF.text!
                //            if matchword == (dicData.name! as String)
                //            {
                //                arrFilterData.data?.append(dicData)
                //            }
                if range != nil {
                    //  arrFilterData.append(dicData)
                    arrFilterData.data?.append(dicData)
                    FindDocCV.reloadData()
                }
            }
        }
        else
        {
            self.arrFilterData.data = getcatlist.data
            
        }
        //   arrFilterData = getcatlist.data?.filter(predicate)
        //        isSearch = false
        FindDocCV.reloadData()
    }
    
    
    
    
    
    
    func getdoctorcategorylist()
    {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        manager.categorylist { docdata, msg, hasError in
            DispatchQueue.main.async {
            ActivityIndicator.shared.removeSpinner()
            }
            if hasError{
                //    RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data!.count > 0
                {
                    //       RSLoadingView.hide(from: self.view)
                    self.getcatlist =  docdata!
                    self.FindDocCV.reloadData()
                }
                else
                {
                    alertWithMsg(vc: self, msg: msg, title: "Alert!")
                }
            }
        }
        
    }
    
    
    func getappointmentlist()
    {
        //        DispatchQueue.main.async {
        //            self.showSpinner(onView: self.view)
        //        }
        
        appointmanager.getappointmentlist { docdata, msg, hasError in
            
            if hasError{
                
                //    RSLoadingView.hide(from: self.view)
                
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data != nil
                {
                    self.viewallupcommingbtn.isHidden = false
                    //       RSLoadingView.hide(from: self.view)
                    self.GetAppointList =  docdata!
                    self.upcomingApointTV.reloadData()
                }
                else
                {
                    self.viewallupcommingbtn.isHidden = true
                    alertWithMsg(vc: self, msg:"No Appointment Right Now", title: "Alert!")
                    
                }
            }
        }
        
    }
    
    
}


extension HomeController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if isSearch ??  false {
                return arrFilterData.data?.count ?? 0
            }
            else{
                //               print("The Doctor Count From Server\(getcatlist.data?.count ?? "")")
                return getcatlist.data?.count ?? 0
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = FindDocCV.dequeueReusableCell(withReuseIdentifier: FindSpecialistCVCell.identifier, for: indexPath) as! FindSpecialistCVCell
            if isSearch! {
                let doctorcategory = arrFilterData.data?[indexPath.row]
                let base = "http://certiflyapi.massolabs.com/doctoruk/public"//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
                let url = URL(string: base + (doctorcategory?.url ?? ""))
                cell.TypeImage.kf.setImage(with: url)
                cell.TypetitleLbl.text = doctorcategory?.name
                
            }
            else
            {
                let doctorcategory = getcatlist.data?[indexPath.row]
                let base = "http://certiflyapi.massolabs.com/doctoruk/public"//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
                let url = doctorcategory?.url ?? ""
                print("Simple_URL:",url)
                url.trimmingCharacters(in: .whitespacesAndNewlines)
                let url1 = URL(string: base + url)
                print("URL: ",url1)
                cell.TypeImage.kf.setImage(with: url1)
//                if doctorcategory?.url != nil
//                {
//                    cell.TypeImage.image = UIImage(named: "Toothimg")
//                }
                cell.TypetitleLbl.text = doctorcategory?.name
            }
            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let doctorcategory = getcatlist.data?[indexPath.row]
        let vc = SearchDoctorController()
        vc.modalPresentationStyle = .fullScreen
        vc.cat_id = doctorcategory?.id!
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        // self.navigationController?.pushViewController(EditProfileController(), animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (self.FindDocCV.frame.width/3.0) - 5 , height:135 * appConstant.heightRatio)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 3
    }
    
    
}


extension HomeController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GetAppointList.data?.count ?? 0 == 0{
            myViewHeightConstraint.isActive = false
            myViewHeightConstraint = upcomingApointView.heightAnchor.constraint(equalToConstant: 0 * appConstant.heightRatio)
            myViewHeightConstraint.isActive = true
            upcomingtitleLbl.isHidden = true
        }else if GetAppointList.data?.count ?? 0 == 1{
            myViewHeightConstraint.isActive = false
            myViewHeightConstraint = upcomingApointView.heightAnchor.constraint(equalToConstant: 145 * appConstant.heightRatio)
            myViewHeightConstraint.isActive = true
            upcomingtitleLbl.isHidden = false
        }else{
            myViewHeightConstraint.isActive = false
            myViewHeightConstraint = upcomingApointView.heightAnchor.constraint(equalToConstant: 145 * appConstant.heightRatio)
            myViewHeightConstraint.isActive = true
            upcomingtitleLbl.isHidden = false
        }
        return GetAppointList.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = upcomingApointTV.dequeueReusableCell(withIdentifier: UpcomingApointmentCell.cellidentifier, for: indexPath) as! UpcomingApointmentCell
        
        let Appointmentadata = GetAppointList.data?[indexPath.row]
        
        cell.datetimehospitaltitleLbl.text = "\(GetAppointList.data?[indexPath.row].slot?.date ?? "")"  + ", " + "\(GetAppointList.data?[indexPath.row].slot?.start_time ?? " ")"  + ", " + "\(GetAppointList.data?[indexPath.row].doctor?.hospital_name ?? " ")"
        cell.docnametitleLbl.text = Appointmentadata?.doctor?.name
        cell.doctypetitleLbl.text =  Appointmentadata?.doctor?.category?.name
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Appointmentadata = GetAppointList.data?[indexPath.row]
        if Appointmentadata?.appoinment_type == "Call"
        {
            let vc = UPCommingController()
            vc.appointment = Appointmentadata!
            vc.isCall = true
            self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if Appointmentadata?.appoinment_type == "Chat"
        {
//                let vc = CustomTabBarController()
//                vc.selectedIndex = 3
//                let rootNC = UINavigationController(rootViewController: vc)
//                rootNC.navigationBar.isHidden = true
//                UIApplication.shared.windows.first?.rootViewController = rootNC
//                UIApplication.shared.windows.first?.makeKeyAndVisible()
            let vc = UPCommingController()
            vc.appointment = Appointmentadata!
            vc.isCall = true
            self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
//                self.navigationController?.pushViewController(MessageListController(), animated: true)
            
        }
        else
        {
            let vc = UPCommingController()
            vc.appointment = Appointmentadata!
            vc.isCall = false
            self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110 * appConstant.heightRatio
    }
    
}

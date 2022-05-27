//
//  DoctorAppointmentDetailsController.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit

class DoctorAppointmentDetailsController: BaseController {
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.translatesAutoresizingMaskIntoConstraints = false
        
        return SV
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        //        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        //        view.layer.shadowColor = UIColor.black.cgColor
        //        view.layer.shadowOpacity = 0.25
        //        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        //        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var messagebtn : UISegmentedControl = {
        let items = ["UpComing Appointments" , "Past Appointments"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.center = self.view.center
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 12 * appConstant.heightRatio
        segmentedControl.backgroundColor = .white
        segmentedControl.tintColor = .black
        segmentedControl.sizeToFit()
        segmentedControl.clipsToBounds = true
        //        segmentedControl.adjustsFontSizeToFitWidth = true
        // Add function to handle Value Changed events
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    lazy var ResultstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Results"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ResultCountLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.layer.cornerRadius = 12 * appConstant.heightRatio
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "7"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PreResultCountLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.layer.cornerRadius = 12 * appConstant.heightRatio
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "7"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SearchTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.isHidden = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var searchBtn : CustomButton = {
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
        tf.placeholder = "Search"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var CrossBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "ClearIcon"), for: .normal)
        btn.addTarget(self, action: #selector(croosbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "HistLogo2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = true
        return iv
    }()
    
    lazy var AppointSlotTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.clipsToBounds = true
        //        tv.separatorStyle = .none
        //        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isHidden = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var PreAppointSlotTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.clipsToBounds = true
        //        tv.separatorStyle = .none
        //        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isHidden = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Home", for: .normal)
        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var noAppointmnetLbl : UILabel = {
            let lbl = UILabel()
            lbl.clipsToBounds = true
            lbl.textColor = UIColor.black
            lbl.textAlignment = .left
            lbl.font = medium(size: 15)
            lbl.text = "No Upcoming Appointment Right Now"
            lbl.numberOfLines = 0
            lbl.adjustsFontSizeToFitWidth = true
            lbl.sizeToFit()
            lbl.isHidden = true
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
        
        lazy var noPastAppointmnetLbl : UILabel = {
            let lbl = UILabel()
            lbl.clipsToBounds = true
            lbl.textColor = UIColor.black
            lbl.textAlignment = .left
            lbl.font = medium(size: 15)
            lbl.text = "No Past Appointment Right Now"
            lbl.numberOfLines = 0
            lbl.adjustsFontSizeToFitWidth = true
            lbl.sizeToFit()
            lbl.isHidden = true
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
    
    let manager = DoctorAppointmentManager()
    let Pre_manager = GetDoctorPastAppointmentManager()
    var getPreAppointmnetList = DoctorAppointmentModel()
    var getAppointmnetList = DoctorAppointmentModel()
    
    var deleteid = 0
    let delappointManager = DoctorDeleteBookedSlotManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        headerLbl.text = "Appointments details"
        PreResultCountLbl.isHidden = true
        HomeBtn.isHidden = true
        backBtn.isHidden = true
        setUp()
        AppointSlotTV.delegate = self
        AppointSlotTV.dataSource = self
        AppointSlotTV.register(DoctorAppointmentDetailsTVCell.self, forCellReuseIdentifier: DoctorAppointmentDetailsTVCell.cellidentifier)
        
        PreAppointSlotTV.delegate = self
        PreAppointSlotTV.dataSource = self
        PreAppointSlotTV.register(DoctorAppointmentDetailsTVCell.self, forCellReuseIdentifier: DoctorAppointmentDetailsTVCell.cellidentifier)
        
        upcommingUIsetUp()
        DispatchQueue.main.async {
            self.getdoctoravailslotlist()
        }
        
    }
    
    func setUp()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(messagebtn)
        
        NSLayoutConstraint.activate([
            
            
            messagebtn.topAnchor.constraint(equalTo: childView.topAnchor, constant: 40 * appConstant.heightRatio),
            messagebtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            messagebtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            messagebtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
        ])
    }
    
    
    func upcommingUIsetUp()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(ResultstitleLbl)
        containerView.addSubview(ResultCountLbl)
        containerView.addSubview(PreResultCountLbl)
        containerView.addSubview(SearchTextFieldView)
        SearchTextFieldView.addSubview(searchBtn)
        SearchTextFieldView.addSubview(diseaseTF)
        SearchTextFieldView.addSubview(CrossBtn)
        containerView.addSubview(AppointSlotTV)
        containerView.addSubview(noAppointmnetLbl)
        containerView.addSubview(logoImage)
        containerView.addSubview(HomeBtn)
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: messagebtn.bottomAnchor,constant: 20 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            ResultstitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
            ResultstitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            ResultstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            ResultCountLbl.centerYAnchor.constraint(equalTo: ResultstitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            ResultCountLbl.leadingAnchor.constraint(equalTo: ResultstitleLbl.leadingAnchor, constant: 70 * appConstant.heightRatio),
            ResultCountLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            ResultCountLbl.widthAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            SearchTextFieldView.centerYAnchor.constraint(equalTo: ResultCountLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SearchTextFieldView.leadingAnchor.constraint(equalTo: ResultCountLbl.trailingAnchor, constant: 15 * appConstant.heightRatio),
            SearchTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SearchTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            searchBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            searchBtn.leadingAnchor.constraint(equalTo: SearchTextFieldView.leadingAnchor, constant: 10 * appConstant.heightRatio),
            searchBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            searchBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            diseaseTF.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            diseaseTF.leadingAnchor.constraint(equalTo: searchBtn.trailingAnchor, constant: 8 * appConstant.heightRatio),
            diseaseTF.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -80 * appConstant.heightRatio),
            diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            CrossBtn.centerYAnchor.constraint(equalTo: diseaseTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
            CrossBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            CrossBtn.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -18 * appConstant.heightRatio),
            CrossBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            CrossBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            logoImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: SearchTextFieldView.bottomAnchor,constant: 20 * appConstant.heightRatio),
            logoImage.heightAnchor.constraint(equalToConstant: 283 * appConstant.heightRatio),
            logoImage.widthAnchor.constraint(equalToConstant: 313 * appConstant.heightRatio),
            
            AppointSlotTV.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 0 * appConstant.heightRatio),
            AppointSlotTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            AppointSlotTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            AppointSlotTV.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            HomeBtn.topAnchor.constraint(equalTo: AppointSlotTV.bottomAnchor, constant: 29 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40 * appConstant.heightRatio ),
            
            noAppointmnetLbl.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20 * appConstant.heightRatio),
            noAppointmnetLbl.centerXAnchor.constraint(equalTo: AppointSlotTV.centerXAnchor, constant: 0 * appConstant.heightRatio),
        ])
    }
    
    func PrevoiusApointUIsetUp()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(PreResultCountLbl)
        containerView.addSubview(SearchTextFieldView)
        SearchTextFieldView.addSubview(searchBtn)
        SearchTextFieldView.addSubview(diseaseTF)
        SearchTextFieldView.addSubview(CrossBtn)
        containerView.addSubview(PreAppointSlotTV)
        containerView.addSubview(noPastAppointmnetLbl)
        containerView.addSubview(logoImage)
        containerView.addSubview(HomeBtn)
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: messagebtn.bottomAnchor,constant: 20 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            ResultstitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
            ResultstitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
            ResultstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            PreResultCountLbl.centerYAnchor.constraint(equalTo: ResultstitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            PreResultCountLbl.leadingAnchor.constraint(equalTo: ResultstitleLbl.leadingAnchor, constant: 70 * appConstant.heightRatio),
            PreResultCountLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            PreResultCountLbl.widthAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            SearchTextFieldView.centerYAnchor.constraint(equalTo: PreResultCountLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SearchTextFieldView.leadingAnchor.constraint(equalTo: PreResultCountLbl.trailingAnchor, constant: 15 * appConstant.heightRatio),
            SearchTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SearchTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            searchBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            searchBtn.leadingAnchor.constraint(equalTo: SearchTextFieldView.leadingAnchor, constant: 10 * appConstant.heightRatio),
            searchBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            searchBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            diseaseTF.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            diseaseTF.leadingAnchor.constraint(equalTo: searchBtn.trailingAnchor, constant: 8 * appConstant.heightRatio),
            diseaseTF.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -80 * appConstant.heightRatio),
            diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            CrossBtn.centerYAnchor.constraint(equalTo: diseaseTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
            CrossBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            CrossBtn.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -18 * appConstant.heightRatio),
            CrossBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            CrossBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            logoImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: SearchTextFieldView.bottomAnchor,constant: 20 * appConstant.heightRatio),
            logoImage.heightAnchor.constraint(equalToConstant: 283 * appConstant.heightRatio),
            logoImage.widthAnchor.constraint(equalToConstant: 313 * appConstant.heightRatio),
            
            PreAppointSlotTV.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 0 * appConstant.heightRatio),
            PreAppointSlotTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            PreAppointSlotTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            PreAppointSlotTV.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            HomeBtn.topAnchor.constraint(equalTo: PreAppointSlotTV.bottomAnchor, constant: 29 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40 * appConstant.heightRatio ),
            
            noPastAppointmnetLbl.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20 * appConstant.heightRatio),
            noPastAppointmnetLbl.centerXAnchor.constraint(equalTo: PreAppointSlotTV.centerXAnchor, constant: 0 * appConstant.heightRatio),
        ])
    }
    
    func getdoctoravailslotlist()
        {
            self.noPastAppointmnetLbl.isHidden = true
            self.logoImage.isHidden = true
            DispatchQueue.main.async {
                ActivityIndicator.shared.showSpinner(onView: self.view)
            }
            manager.doctorappointment{ docdata, msg, hasError in
                DispatchQueue.main.async {
                    ActivityIndicator.shared.removeSpinner()
                }
                if hasError{
                    alertWithMsg(vc: self, msg: msg, title: "Alert!")
                }else{
                    if docdata!.data!.count > 0
                    {
                        self.AppointSlotTV.isHidden = false
                        self.getAppointmnetList =  docdata!
                        self.AppointSlotTV.reloadData()
                        self.scrollview.isScrollEnabled = false
                        self.noAppointmnetLbl.isHidden = true
                        self.logoImage.isHidden = true
                    }
                    else
                    {
                        self.logoImage.isHidden = false
                        self.noAppointmnetLbl.isHidden = false
                        self.scrollview.isScrollEnabled = false
                    }
                }
            }
        }
        
        func getdoctorpastappointmentlist()
        {
            self.noAppointmnetLbl.isHidden = true
            self.logoImage.isHidden = true
            DispatchQueue.main.async {
                ActivityIndicator.shared.showSpinner(onView: self.view)
            }
            Pre_manager.getdoctorpastappointmentlist{ docdata, msg, hasError in
                DispatchQueue.main.async {
                    ActivityIndicator.shared.removeSpinner()
                }
                if hasError{
                    alertWithMsg(vc: self, msg: msg, title: "Alert!")
                }else{
                    if docdata!.data!.count > 0
                    {
                        self.PreAppointSlotTV.isHidden = false
                        self.getPreAppointmnetList =  docdata!
                        self.PreAppointSlotTV.reloadData()
                        self.scrollview.isScrollEnabled = false
                        self.noPastAppointmnetLbl.isHidden = true
                        self.logoImage.isHidden = true
                    }
                    else
                    {
                        self.logoImage.isHidden = false
                        self.noPastAppointmnetLbl.isHidden = false
                        self.scrollview.isScrollEnabled = false
                    }
                }
            }
        }
    
    @objc func homebtn_press(){
        
        self.navigationController?.pushViewController(DoctorDashBoardController(), animated: true)
        
    }
    
    @objc func croosbtn_press(){
        diseaseTF.text = " "
    }
    
    @objc override func backbtn_press(){
        self.dismiss(animated: true)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 0:
            upcommingUIsetUp()
            AppointSlotTV.isHidden = false
            PreAppointSlotTV.isHidden = true
            PreResultCountLbl.isHidden = true
            ResultCountLbl.isHidden = false
            getdoctoravailslotlist()
        case 1:
            PrevoiusApointUIsetUp()
            getdoctorpastappointmentlist()
            AppointSlotTV.isHidden = true
            ResultCountLbl.isHidden = true
            PreResultCountLbl.isHidden = false
            PreAppointSlotTV.isHidden = false
            
        default:
            PrevoiusApointUIsetUp()
            getdoctorpastappointmentlist()
            PreAppointSlotTV.isHidden = false
            AppointSlotTV.isHidden = true
        }
        
    }
    
    func deleteAppointmnet()
    {
        delappointManager.deleteslot(id: deleteid) { docdata,msg, hasError in
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Alert!")
            }else{
                if docdata != nil
                {
                    alertWithMsg(vc: self, msg: docdata, title: "Alert!")
                    self.getdoctoravailslotlist()
                    self.AppointSlotTV.reloadData()
                    
                }
                else
                {
                    alertWithMsg(vc: self, msg: msg, title: "Alert")
                }
            }
        }
    }
    
}


extension DoctorAppointmentDetailsController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == AppointSlotTV
        {
            ResultCountLbl.text = String(getAppointmnetList.data?.count ?? 0)
            return getAppointmnetList.data?.count ?? 0
        }
        else if tableView == PreAppointSlotTV
        {
            PreResultCountLbl.text = String(getPreAppointmnetList.data?.count ?? 0)
            return getPreAppointmnetList.data?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == AppointSlotTV
        {
            let cell = AppointSlotTV.dequeueReusableCell(withIdentifier: DoctorAppointmentDetailsTVCell.cellidentifier, for: indexPath) as! DoctorAppointmentDetailsTVCell
            let appoint = getAppointmnetList.data?[indexPath.row]
            cell.Patientname.text = appoint?.patient?.name
            cell.Complaindesc.text = appoint?.description
            cell.Complainname.text = appoint?.complaint_name
            cell.appointmentdatelbl.text = appoint?.slot?.date
            
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
            let url = URL(string: base + (appoint?.patient?.url ?? ""))
            cell.docimg.kf.setImage(with: url)
            cell.deleteBtn.isHidden = true
            
            cell.deleteBtn.tag = indexPath.row
            cell.deleteBtn.addTarget(self, action: #selector(deleteappointment), for: .touchUpInside)
            return cell
        }
        else if tableView == PreAppointSlotTV
        {
            let cell = PreAppointSlotTV.dequeueReusableCell(withIdentifier: DoctorAppointmentDetailsTVCell.cellidentifier, for: indexPath) as! DoctorAppointmentDetailsTVCell
            let appoint = getPreAppointmnetList.data?[indexPath.row]
            cell.Patientname.text = appoint?.patient?.name
            cell.Complaindesc.text = appoint?.description
            cell.Complainname.text = appoint?.complaint_name
            cell.appointmentdatelbl.text = appoint?.slot?.date
            cell.deleteBtn.isHidden = true
            
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
            let url = URL(string: base + (appoint?.patient?.url ?? ""))
            cell.docimg.kf.setImage(with: url)
            
            cell.deleteBtn.tag = indexPath.row
            cell.deleteBtn.addTarget(self, action: #selector(deleteappointment), for: .touchUpInside)
            return cell
        }
        else
        {
            let cell = PreAppointSlotTV.dequeueReusableCell(withIdentifier: DoctorAppointmentDetailsTVCell.cellidentifier, for: indexPath) as! DoctorAppointmentDetailsTVCell
            let appoint = getPreAppointmnetList.data?[indexPath.row]
            
            cell.Patientname.text = appoint?.patient?.name
            cell.Complaindesc.text = appoint?.description
            cell.Complainname.text = appoint?.complaint_name
            cell.appointmentdatelbl.text = appoint?.slot?.date
            
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
            let url = URL(string: base + (appoint?.patient?.url ?? ""))
            cell.docimg.kf.setImage(with: url)
            
            cell.deleteBtn.tag = indexPath.row
            cell.deleteBtn.addTarget(self, action: #selector(deleteappointment), for: .touchUpInside)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        deleteid = getAppointmnetList.data?[indexPath.row].id ?? 0
    }
    
    
    @objc func deleteappointment(_ sender : UIButton)
    {
        // Create the alert controller
        let alertController = UIAlertController(title: "Alert", message: "Are You Sure You Want To Delete The Slot?", preferredStyle: .alert)
        // Create the actions
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.deleteid = self.getAppointmnetList.data?[sender.tag].id ?? 0
            if self.deleteid == 0
            {
                alertWithMsg(vc: self, msg: "Pick The Slot First", title: "Alert!")
            }
            else
            {
                DispatchQueue.main.async {
                    self.deleteAppointmnet()
                }
            }
        }
        let noAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) {
            UIAlertAction in
        }
        // Add the actions
        alertController.addAction(noAction)
        alertController.addAction(okAction)
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == AppointSlotTV
        {
            return 190 * appConstant.heightRatio
        }
        else if tableView == PreAppointSlotTV
        {
            return 210 * appConstant.heightRatio
        }
        return 0
    }
    
}

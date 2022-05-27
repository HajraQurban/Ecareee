//
//  AppointmentController.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import UIKit

class AppointmentController: UIViewController {
    
    lazy var preBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 9 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.contentMode = .scaleToFill
        //   btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.clipsToBounds = true
        //  btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var MymessagestitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 24)
        lbl.text = "My Appointments"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
    
    lazy var segmentsView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var DataTableview : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor(named: Colors.AppBGColor)
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    lazy var upcomingApointTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor(named: Colors.AppBGColor)
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var nullLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = semiBold(size: 15)
        lbl.text = "No Past Appointment Right Now"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden  = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var docImages : [UIImage] = [#imageLiteral(resourceName: "Doc1")]
    var docnameArray : [String] = ["HealthHUB Support","Dr. Anna Nicholas","Dr. Thomas Milton"]
    
    var docnamearrayofdatatv : [String] = ["Dr. Ahmer Khan","Dr. Anna Nicholas","Dr. Boris Milton"]
    
    
    
    
    let appointmanager = GetappointmentManager()
    
    var GetAppointList = GetappointmentModal()
    
    //
    let pastappointmanager = GetPastappointmentManager()
    
    var GetPastAppointList = GetappointmentModal()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //    headerView.isHidden = true
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        upcomingApointTV.delegate = self
        upcomingApointTV.dataSource = self
        upcomingApointTV.register(UpcomingApointmentCell.self, forCellReuseIdentifier: UpcomingApointmentCell.cellidentifier)
        setupcre()
        DataTableview.delegate = self
        DataTableview.dataSource = self
        DataTableview.register(UpcomingApointmentCell.self, forCellReuseIdentifier: UpcomingApointmentCell.cellidentifier)
        getappointmentlist()
        GetAppointmentsetup()
       
    }
    
    
    func setupcre()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(preBtn)
        view.addSubview(MymessagestitleLbl)
        view.addSubview(messagebtn)
        //  view.addSubview(segmentsView)
        //  view.addSubview(notificationTV)
        
        NSLayoutConstraint.activate([
            
            preBtn.topAnchor.constraint(equalTo: margin.topAnchor, constant: 12 * appConstant.heightRatio),
            preBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            preBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            preBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            MymessagestitleLbl.centerYAnchor.constraint(equalTo: preBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            MymessagestitleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.widthRatio),
            MymessagestitleLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            messagebtn.topAnchor.constraint(equalTo: preBtn.bottomAnchor, constant: 12 * appConstant.heightRatio),
            messagebtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            messagebtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),

            messagebtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            
        ])
        
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex {
        case 1:
            //   self.view.backgroundColor = UIColor.green
            Messagesetup()
            getpastappointmentlist()
            upcomingApointTV.isHidden = true
            
        case 2:
            self.view.backgroundColor = UIColor.blue
            
        default:
            // self.view.backgroundColor = UIColor.purple
            upcomingApointTV.isHidden = false
            GetAppointmentsetup()
            getappointmentlist()
            
        }
        
    }
    
    func GetAppointmentsetup()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(upcomingApointTV)
        view.addSubview(nullLbl)
        
        NSLayoutConstraint.activate([
            
            upcomingApointTV.topAnchor.constraint(equalTo:  self.messagebtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            upcomingApointTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10  * appConstant.widthRatio),
            upcomingApointTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10 * appConstant.widthRatio),
            upcomingApointTV.bottomAnchor.constraint(equalTo:  margin.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
            //            upcomingApointTV.heightAnchor.constraint(equalToConstant: 350 * appConstant.heightRatio),
            nullLbl.centerXAnchor.constraint(equalTo: upcomingApointTV.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: upcomingApointTV.centerYAnchor),
        ])
        
    }
    
    func Messagesetup()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(DataTableview)
        view.addSubview(nullLbl)
        
        
        NSLayoutConstraint.activate([
            
            DataTableview.topAnchor.constraint(equalTo:  self.messagebtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DataTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10  * appConstant.widthRatio),
            DataTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10 * appConstant.widthRatio),
            DataTableview.bottomAnchor.constraint(equalTo:  margin.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
            nullLbl.centerXAnchor.constraint(equalTo: DataTableview.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: DataTableview.centerYAnchor),
            
        ])
        
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
                    self.nullLbl.text =   "No Upcoming Appointment Right Now"
                    //       RSLoadingView.hide(from: self.view)
                    self.GetAppointList =  docdata!
                    if self.GetAppointList.data?.count == 0 {
                        self.nullLbl.isHidden = false
                    }else{
                        self.nullLbl.isHidden = true
                    }
                    
                    self.upcomingApointTV.reloadData()
                }
                else
                {
                    self.nullLbl.text =   "No Upcoming Appointment Right Now"
                    self.nullLbl.isHidden = false
//                    alertWithMsg(vc: self, msg:"No Appointment Right Now", title: "Alert!")
                    
                }
            }
        }
        
    }
    
    func getpastappointmentlist()
    {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        
        pastappointmanager.getpastappointmentlist { docdata, msg, hasError in
            DispatchQueue.main.async {
                ActivityIndicator.shared.removeSpinner()
            }
            
            if hasError{
                
                //    RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data != nil
                {
                    
                    //       RSLoadingView.hide(from: self.view)
                    self.GetPastAppointList =  docdata!
                    if self.GetPastAppointList.data?.count == 0 {
                        self.nullLbl.isHidden = false
                    }else{
                        self.nullLbl.isHidden = true
                    }
                    self.DataTableview.reloadData()
                    
                }
                else
                {
                    self.nullLbl.text =   "No Past Appointment Right Now"
                    self.nullLbl.isHidden = false
//                    alertWithMsg(vc: self, msg:"No Past Appointment Right Now", title: "Alert!")
                    
                }
            }
        }
        
    }
    
    
}


extension AppointmentController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == upcomingApointTV
        {
            return GetAppointList.data?.count ?? 0
        }
        else
        {
            return GetPastAppointList.data?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == upcomingApointTV
        {
            let cell = upcomingApointTV.dequeueReusableCell(withIdentifier: UpcomingApointmentCell.cellidentifier, for: indexPath) as! UpcomingApointmentCell
            
            let Appointmentadata = GetAppointList.data?[indexPath.row]
            
            cell.datetimehospitaltitleLbl.text = "\(GetAppointList.data?[indexPath.row].slot?.date ?? "")"  + ", " + "\(GetAppointList.data?[indexPath.row].slot?.start_time ?? " ")"  + ", " + "\(GetAppointList.data?[indexPath.row].doctor?.hospital_name ?? " ")"
            cell.docnametitleLbl.text = Appointmentadata?.doctor?.name
            cell.doctypetitleLbl.text = Appointmentadata?.doctor?.category?.name
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
        else
        {
            let cell = DataTableview.dequeueReusableCell(withIdentifier: UpcomingApointmentCell.cellidentifier, for: indexPath) as! UpcomingApointmentCell
            
            let Appointmentadata = GetPastAppointList.data?[indexPath.row]
            
            cell.datetimehospitaltitleLbl.text = "\(GetPastAppointList.data?[indexPath.row].slot?.date ?? "")"  + ", " + "\(GetPastAppointList.data?[indexPath.row].slot?.start_time ?? " ")"  + ", " + "\(GetPastAppointList.data?[indexPath.row].doctor?.hospital_name ?? " ")"
            cell.docnametitleLbl.text = Appointmentadata?.doctor?.name
            cell.doctypetitleLbl.text = Appointmentadata?.doctor?.category?.name
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
        
        if tableView == upcomingApointTV
        {
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
        else
        {
            let Appointmentadata = GetPastAppointList.data?[indexPath.row]
            let vc = UPCommingController()
            vc.appointment = Appointmentadata!
            vc.pasdata = "yes"
            vc.isCall = false
            self.navigationController?.pushViewController(vc, animated: true)
            print("Nothing")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == upcomingApointTV
        {
            return 110 * appConstant.heightRatio
        }
        else
        {
            return 110 * appConstant.heightRatio
        }
    }
    
}

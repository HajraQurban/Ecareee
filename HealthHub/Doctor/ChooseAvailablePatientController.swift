//
//  ChooseAvailablePatientController.swift
//  HealthHub
//
//  Created by OBS on 27/01/2022.
//

import UIKit

class ChooseAvailablePatientController: BaseController {
    
    lazy var AvailbletitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Pending Patients"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var AllPatientTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
//        tv.layer.borderWidth = 1
//        tv.layer.borderColor = UIColor.black.cgColor
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    //For Patient Data
    var PatientImageArray = ["NA1","NA2"]
    var Patientnamearray : [String] = ["Natasha","Peter parker"]
    
//    let manager = DoctorAppointmentManager()
    var homeModel = HomeModel()
    var statusManager =  AppointmentStatusChangeManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.isHidden = false
        backBtn.setImage(UIImage(named: "backbarIcon"), for: .normal)
//        backBtn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        headerLbl.text = "Choose Patient"
        setUpCre()
        AllPatientTV.delegate = self
        AllPatientTV.dataSource = self
        AllPatientTV.register(AvailablePatientRequestTVCell.self, forCellReuseIdentifier: AvailablePatientRequestTVCell.cellidentifier)
//        getdoctoravailslotlist()
        
    }
    
    func setUpCre()
    {
        let margin = view.layoutMarginsGuide
        
        view.addSubview(AvailbletitleLbl)
        view.addSubview(AllPatientTV)
        
        NSLayoutConstraint.activate([
        
            AvailbletitleLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 80 * appConstant.heightRatio),
        
          //  AvailbletitleLbl.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            AvailbletitleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.heightRatio),
            AvailbletitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            AllPatientTV.topAnchor.constraint(equalTo: AvailbletitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            AllPatientTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AllPatientTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            AllPatientTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.heightRatio),
            
            
        
        ])
        
    }
    
    
    @objc override func backbtn_press()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
//    func getdoctoravailslotlist()
//    {
//        DispatchQueue.main.async {
//            ActivityIndicator.shared.showSpinner(onView: self.view)
//        }
//        manager.doctorappointment{ docdata, msg, hasError in
//            DispatchQueue.main.async {
//            ActivityIndicator.shared.removeSpinner()
//            }
//            if hasError{
//                alertWithMsg(vc: self, msg: msg, title: "Alert!")
//            }else{
//                if docdata!.data!.count > 0
//                {
//                    self.getAppointmnetList =  docdata!
//                    self.AllPatientTV.reloadData()
//                }
//                else
//                {
//                    alertWithMsg(vc: self, msg: "No Appointment Available", title: "Alert!")
//                }
//            }
//        }
//    }
    
}

extension ChooseAvailablePatientController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let spec = getdocspecialities.review else{
//            return 0
//        }
        return homeModel.data?.pending?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = AllPatientTV.dequeueReusableCell(withIdentifier: AvailablePatientRequestTVCell.cellidentifier, for: indexPath) as! AvailablePatientRequestTVCell
        
            let appoint = homeModel.data?.pending?[indexPath.row]
                cell.patientnameLbl.text = appoint?.patient?.name ?? ""
                if appoint?.patient?.url ?? "" == nil ||  appoint?.patient?.url ?? "" == ""
                {
                    cell.patientimg.image = UIImage(named: "Profile_img")
                }
                else
                {
                    let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
                    let url = URL(string: base + ( appoint?.patient?.url ?? ""))
                    cell.patientimg.kf.setImage(with: url)
                }
                cell.appointmentdatelbl.text = appoint?.slot?.date ?? ""
                cell.rejectBtn.tag = indexPath.row
                cell.docavailibiltyBtn.tag = indexPath.row
                cell.rejectBtn.addTarget(self, action: #selector(rejectAppointment), for: .touchUpInside)
                cell.docavailibiltyBtn.addTarget(self, action: #selector(acceptAppointment), for: .touchUpInside)
            return cell
                
      
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 120 * appConstant.heightRatio
       
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
                self.homeModel.data?.pending?.remove(at: sender.tag)
                if self.homeModel.data?.pending?.count == 0 {
                    self.navigationController?.popViewController(animated: true)
                }
                self.AllPatientTV.reloadData()
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
                self.homeModel.data?.pending?.remove(at: sender.tag)
                if self.homeModel.data?.pending?.count == 0 {
                    self.navigationController?.popViewController(animated: true)
                }
                self.AllPatientTV.reloadData()
            
            }
            
        }
    }
    
    
}


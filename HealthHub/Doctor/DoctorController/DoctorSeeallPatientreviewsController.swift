//
//  DoctorSeeallPatientreviewsController.swift
//  HealthHub
//
//  Created by Mac on 11/03/2022.
//

import UIKit

class DoctorSeeallPatientreviewsController: BaseController {
    
    
    lazy var pstientreviewstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Patients Review"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    lazy var PatientReviewTV : UITableView = {
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
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var noReviewLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 20)
        lbl.text = "No Review's Right Now"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var getdocspecialities = DoctorProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if getdocspecialities.review?.count ?? 0 > 0
        {
        self.noReviewLbl.isHidden = true
        self.PatientReviewTV.isHidden = false
        }
        else
        {
        self.PatientReviewTV.isHidden = true
        self.noReviewLbl.isHidden = false
        }
        PatientReviewTV.delegate = self
        PatientReviewTV.dataSource = self
        PatientReviewTV.register(PatientReviewsTVCell.self, forCellReuseIdentifier: PatientReviewsTVCell.cellidentifier)
        headerLbl.text = "All Patient Reviews"
        setup()
    }
    
    func setup()
    {
        view.addSubview(pstientreviewstitleLbl)
        view.addSubview(PatientReviewTV)
        view.addSubview(noReviewLbl)
        view.addSubview(HomeBtn)
        
        
        NSLayoutConstraint.activate([
            
            pstientreviewstitleLbl.topAnchor.constraint(equalTo: childView.topAnchor, constant: 40 * appConstant.heightRatio),
            pstientreviewstitleLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            pstientreviewstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            PatientReviewTV.topAnchor.constraint(equalTo: pstientreviewstitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PatientReviewTV.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PatientReviewTV.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
//            PatientReviewTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.heightRatio),
            
            noReviewLbl.centerYAnchor.constraint(equalTo: PatientReviewTV.centerYAnchor, constant: -80 * appConstant.heightRatio),
            noReviewLbl.centerXAnchor.constraint(equalTo: PatientReviewTV.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            HomeBtn.topAnchor.constraint(equalTo: PatientReviewTV.bottomAnchor, constant: 20 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            HomeBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -30 * appConstant.heightRatio ),

        ])
    }
    
    override func backbtn_press(){
        self.dismiss(animated: true)
    }
    
    @objc func homebtn_press(){
        self.dismiss(animated: true)
    }
    
}


extension DoctorSeeallPatientreviewsController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let spec = getdocspecialities.review else{
            return 0
        }
        return spec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = PatientReviewTV.dequeueReusableCell(withIdentifier: PatientReviewsTVCell.cellidentifier, for: indexPath) as! PatientReviewsTVCell
            
            let doctorspecialreviewlist = getdocspecialities.review?[indexPath.row]
            let doctorspecialuserinfolist = getdocspecialities.review?[indexPath.row]

        cell.patnameLbl.text = doctorspecialreviewlist?.user?.name ?? ""

        let base = URLConstants.BASE_File //"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + (doctorspecialuserinfolist?.user?.url ?? ""))
            cell.DocImg.kf.setImage(with: url)

        if doctorspecialuserinfolist?.user?.url == nil
            {
                cell.DocImg.image = UIImage(named: "Profile_img")
            }

            cell.patreviewdescLbl.text  = doctorspecialreviewlist?.description
            cell.rattingView.rating = Double(doctorspecialreviewlist?.stars ?? "0.0") ?? 0.0
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 130 * appConstant.heightRatio
    }
    
    

}

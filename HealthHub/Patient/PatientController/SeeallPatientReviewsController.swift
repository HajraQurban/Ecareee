//
//  SeeallPatientReviewsController.swift
//  HealthHub
//
//  Created by OBS on 06/01/2022.
//

import UIKit

class SeeallPatientReviewsController: BaseController {

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
    
    var getdocspecialities = DoctoragainstSpecialityData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.tintColor = .white
        PatientReviewTV.delegate = self
        PatientReviewTV.dataSource = self
        PatientReviewTV.register(PatientReviewsTVCell.self, forCellReuseIdentifier: PatientReviewsTVCell.cellidentifier)
        headerLbl.text = "All Patient Reviews"
        setup()
    }
    
    func setup()
    {
        view.addSubview(PatientReviewTV)
        
        
        NSLayoutConstraint.activate([
        
            
            PatientReviewTV.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50 * appConstant.heightRatio),
            PatientReviewTV.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PatientReviewTV.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            PatientReviewTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.heightRatio),

        ])
    }
    
}


extension SeeallPatientReviewsController: UITableViewDelegate,UITableViewDataSource
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
            
            cell.patnameLbl.text = doctorspecialuserinfolist?.user?.name
                        
            let base = URLConstants.BASE_File //http://certiflyapi.massolabs.com/Doctor.uk/public/"
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
       
        return 170 * appConstant.heightRatio
       
    }
    
    
}

//
//  DoctorReviewsListController.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit

class DoctorReviewsListController: BaseController {
    
    
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
    
    
    
    
    lazy var ResultstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
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
        lbl.text = "2"
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
        return iv
    }()
    
    lazy var ReviewSlotTV : UITableView = {
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
    
    let patientname = ["Mary jane"," Joe snow"]
    
    let manager = DoctorReviewManager()
    var getReviewSlotList = DoctorReviewsModel()
    
    var deleteid = 0
    let delreviewManager = DoctorDeleteBookedSlotManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        HomeBtn.isHidden = true
        self.noReviewLbl.isHidden = true
        headerLbl.text = "Review list"
        setUp()
        ReviewSlotTV.delegate = self
        ReviewSlotTV.dataSource = self
        ReviewSlotTV.register(ReviewListTVCell.self, forCellReuseIdentifier: ReviewListTVCell.cellidentifier)
        getdoctoravailslotlist()
        
    }
    
    
    func setUp()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(scrollview)
        scrollview.addSubview(containerView)
        
        containerView.addSubview(ResultstitleLbl)
        containerView.addSubview(ResultCountLbl)
        containerView.addSubview(SearchTextFieldView)
        SearchTextFieldView.addSubview(searchBtn)
        SearchTextFieldView.addSubview(diseaseTF)
        SearchTextFieldView.addSubview(CrossBtn)
        containerView.addSubview(logoImage)
        containerView.addSubview(ReviewSlotTV)
        containerView.addSubview(noReviewLbl)
        containerView.addSubview(HomeBtn)
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 10 * appConstant.heightRatio),
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
            
            
            ReviewSlotTV.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 10 * appConstant.heightRatio),
            ReviewSlotTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            ReviewSlotTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            ReviewSlotTV.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            
            noReviewLbl.centerYAnchor.constraint(equalTo: ReviewSlotTV.centerYAnchor, constant: -80 * appConstant.heightRatio),
            noReviewLbl.centerXAnchor.constraint(equalTo: ReviewSlotTV.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            HomeBtn.topAnchor.constraint(equalTo: ReviewSlotTV.bottomAnchor, constant: 29 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40 * appConstant.heightRatio ),
            
            
        ])
    }
    
    func getdoctoravailslotlist()
    {
        //        ActivityIndicator.shared.showSpinner(onView: self.view)
        manager.doctorreview{ docdata, msg, hasError in
            //            ActivityIndicator.shared.removeSpinner()
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Alert!")
            }else{
                if docdata!.data!.count > 0
                {
                    self.getReviewSlotList =  docdata!
                    self.ReviewSlotTV.reloadData()
                    self.noReviewLbl.isHidden = true
                    self.scrollview.isScrollEnabled = true
                }
                else
                {
                    self.noReviewLbl.isHidden = false
                    self.scrollview.isScrollEnabled = false
                }
            }
        }
    }
    
    @objc func croosbtn_press(){
        diseaseTF.text = " "
    }
    
    @objc func homebtn_press(){
        
        self.navigationController?.pushViewController(DoctorDashBoardController(), animated: true)
        
    }
    
    @objc override func backbtn_press(){
        self.dismiss(animated: true)
    }
    
    func deleteReview()
    {
        delreviewManager.deleteslot(id: deleteid) { docdata,msg, hasError in
            if hasError{
                //     RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Alert!")
            }else{
                if docdata != nil
                {
                    alertWithMsg(vc: self, msg: "Slot Deleted Successfully", title: "Alert!")
                    self.getdoctoravailslotlist()
                    self.ReviewSlotTV.reloadData()
                    
                }
                else
                {
                    //                RSLoadingView.hide(from: self.view)
                    alertWithMsg(vc: self, msg: msg, title: "Alert")
                }
            }
        }
    }
    
}


extension DoctorReviewsListController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ResultCountLbl.text = String(getReviewSlotList.data?.count ?? 0)
        return getReviewSlotList.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReviewSlotTV.dequeueReusableCell(withIdentifier: ReviewListTVCell.cellidentifier, for: indexPath) as! ReviewListTVCell
        
        //        cell.Patientname.text = patientname[indexPath.row]
        cell.Patientname.text = getReviewSlotList.data?[indexPath.row].user?.name
        cell.appointmentdatelbl.text = getReviewSlotList.data?[indexPath.row].user?.date_of_birth
        cell.Reviewdesc.text = getReviewSlotList.data?[indexPath.row].description
        //        cell.deleteBtn.addTarget(self, action: #selector(deletesbooklot), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func deletesbooklot()
    {
        // Create the alert controller
        let alertController = UIAlertController(title: "Alert", message: "Are You Sure You Want To Delete The Slot?", preferredStyle: .alert)
        // Create the actions
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            UIAlertAction in
            if self.deleteid == 0
            {
                alertWithMsg(vc: self, msg: "Pick The Slot First", title: "Alert!")
            }
            else
            {
                self.deleteReview()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deleteid = getReviewSlotList.data?[indexPath.row].id ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170 * appConstant.heightRatio
    }
    
    
}


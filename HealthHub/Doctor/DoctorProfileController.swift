//
//  DoctorProfileController.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit
import LGSideMenuController

class DoctorProfileController: BaseController {

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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ProfileImg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        iv.layer.cornerRadius = 36.5 * appConstant.heightRatio
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var NameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 21)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var NameeditBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 9 * appConstant.heightRatio
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOpacity = 0.5
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "EditIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(Nameedit_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var PatientreviewBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 9 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.25
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.5
        btn.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: "Reviews"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(SeeallPatientbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var locationIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "locationicon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var locationLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 13)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ClipboardIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ClipboardIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var ClipboardLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "0"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Clipboarddesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = bold(size: 13)
        lbl.text = "Completed"
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var TimeIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "TimeIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var TimeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "0"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Timedesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = bold(size: 13)
        lbl.text = "Appointments"
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var CreditcardIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "CreditCardIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var CreditCardLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "$ 0"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var CreditCarddesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = bold(size: 13)
        lbl.text = "Earning"
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PersonalinfoView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
         view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 9 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Credentials of Person Profile Info
    
    lazy var PersonProfileLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Personal Info"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ChangeprofileBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.layer.shadowOpacity = 0
        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 12 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonBG)?.cgColor
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor(named: Colors.ButtonBG), for: .normal)
        btn.setTitle("Change", for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(chnageperbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var PhoneNumLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Phone Number"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PhoneLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var EmailtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Email"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmailLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var GendertitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Gender"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var GenderLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DOBtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Date of Birth"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DOBLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ProfessionalinfoView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
         view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 9 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ProfessionalInfotitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Professional history"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ChangemedicalBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.layer.shadowOpacity = 0
        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 12 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonBG)?.cgColor
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor(named: Colors.ButtonBG), for: .normal)
        btn.setTitle("Change", for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    lazy var AboutDoctortitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 13)
        lbl.text = "About Doctor"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var illenesscolBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.TextfieldBG)
        btn.layer.shadowOpacity = 0
      //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 8 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonColor)?.cgColor
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor(named: Colors.ButtonColor), for: .normal)
        btn.setTitle(" ", for: .normal)
        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    
    lazy var AboutDoctorDesclbl: UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = semiBold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var HospitalnametitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Hospital Name"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var HospitalnamedescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var WorkingexptitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Work Experience"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var WorkingexpdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var EducationtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Education"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EducationdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 15)
        lbl.text = " "
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var workcontainerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.layer.cornerRadius = 8 * appConstant.heightRatio
        view.layer.borderColor = UIColor(named: Colors.PrimaryAppColor1)?.cgColor
        view.layer.borderWidth = 1 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ConsultationinfoView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
         view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 9 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ConsultationInfotitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Consultation charges"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ConsultationtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 13)
        lbl.text = "Consultation fee"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ChangeConsultationBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.layer.shadowOpacity = 0
        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 12 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonBG)?.cgColor
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor(named: Colors.ButtonBG), for: .normal)
        btn.setTitle("Change", for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(chnageperbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var ChangeconsultationBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.TextfieldBG)
        btn.layer.shadowOpacity = 0
      //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 8 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.AppColor)?.cgColor
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.setTitle("25$ per hour", for: .normal)
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Logout", for: .normal)
        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
      
        return btn
    }()
//
//    lazy var logoutBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = UIColor(named: Colors.Textcolormedialbl)
//        btn.layer.cornerRadius = 18 * appConstant.heightRatio
//        btn.titleLabel?.font = bold(size: 15)
//      //  btn.setImage(UIImage(named: "logoutIcon"), for: UIControl.State.normal)
//        btn.setTitle("Logout", for: .normal)
//        btn.clipsToBounds = true
//
//
//     //   btn.contentHorizontalAlignment = .left
//        // Configure Symbol
//        let config = UIImage.SymbolConfiguration(pointSize: 19.0, weight: .semibold, scale: .large)
//        let image = UIImage(systemName: "logoutIcon", withConfiguration: config)
//        btn.setImage(image, for: .normal)
//
//        // Put the Image on the right hand side of the button
//               // Credit to liau-jian-jie for this part
//        btn.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//        btn.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//        btn.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
//
//        // Customise spacing to match system Back button
//        btn.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -18.0, bottom: 0.0, right: 0.0)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -12.0, bottom: 0.0, right: 0.0)
//        btn.addTarget(self, action: #selector(logoutbtn_press), for: .touchUpInside)
//
//        return btn
//    }()

//    let loadingView = RSLoadingView()
    let manager = DoctorProfileManager()
    
    var getsubcatlist = DoctorProfileModel()
    
//    var getsubcatlist = ["Heart specialist","Surgeon","2+ more"]
    
    var needsFirstScroll = true
    
    var imageofdata = editdata1()
    
    var signoutManager = SignoutManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backBtn.isHidden = true
//        AboutDoctorDesclbl.delegate = self
//        AboutDoctorDesclbl.dataSource = self
//        AboutDoctorDesclbl.register(DocTypeCVCell.self, forCellWithReuseIdentifier: DocTypeCVCell.identifier)
        setup()
//        getdoctorprofiledata()
        headerLbl.text = "My Profile"
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.getdoctorprofiledata()
        }
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(ProfileImg)
        containerView.addSubview(PatientreviewBtn)
        containerView.addSubview(NameLbl)
        containerView.addSubview(NameeditBtn)
        containerView.addSubview(locationIcon)
        containerView.addSubview(locationLbl)
        containerView.addSubview(ClipboardIcon)
        containerView.addSubview(ClipboardLbl)
        containerView.addSubview(Clipboarddesclbl)
        
        containerView.addSubview(TimeIcon)
        containerView.addSubview(TimeLbl)
        containerView.addSubview(Timedesclbl)
        
        containerView.addSubview(CreditcardIcon)
        containerView.addSubview(CreditCardLbl)
        containerView.addSubview(CreditCarddesclbl)
       
        containerView.addSubview(PersonalinfoView)
        PersonalinfoView.addSubview(PersonProfileLbl)
        PersonalinfoView.addSubview(ChangeprofileBtn)
        PersonalinfoView.addSubview(PhoneNumLbl)
        PersonalinfoView.addSubview(PhoneLbl)
        PersonalinfoView.addSubview(EmailtitleLbl)
        PersonalinfoView.addSubview(EmailLbl)
        PersonalinfoView.addSubview(GendertitleLbl)
        PersonalinfoView.addSubview(GenderLbl)
        PersonalinfoView.addSubview(DOBtitleLbl)
        PersonalinfoView.addSubview(DOBLbl)
        
        containerView.addSubview(ProfessionalinfoView)
        ProfessionalinfoView.addSubview(ProfessionalInfotitleLbl)
        ProfessionalinfoView.addSubview(ChangemedicalBtn)
        ProfessionalinfoView.addSubview(AboutDoctortitleLbl)
        ProfessionalinfoView.addSubview(AboutDoctorDesclbl)
        ProfessionalinfoView.addSubview(HospitalnametitleLbl)
        ProfessionalinfoView.addSubview(HospitalnamedescLbl)
        ProfessionalinfoView.addSubview(WorkingexptitleLbl)
        ProfessionalinfoView.addSubview(WorkingexpdescLbl)
        ProfessionalinfoView.addSubview(EducationtitleLbl)
        ProfessionalinfoView.addSubview(EducationdescLbl)
        ProfessionalinfoView.addSubview(workcontainerView)
        workcontainerView.addSubview(ClipboardIcon)
        workcontainerView.addSubview(ClipboardLbl)
        workcontainerView.addSubview(Clipboarddesclbl)
        
        workcontainerView.addSubview(TimeIcon)
        workcontainerView.addSubview(TimeLbl)
        workcontainerView.addSubview(Timedesclbl)
        
        workcontainerView.addSubview(CreditcardIcon)
        workcontainerView.addSubview(CreditCardLbl)
        workcontainerView.addSubview(CreditCarddesclbl)
        
        containerView.addSubview(ConsultationinfoView)
        ConsultationinfoView.addSubview(ConsultationInfotitleLbl)
        ConsultationinfoView.addSubview(ConsultationtitleLbl)
        ConsultationinfoView.addSubview(ChangeConsultationBtn)
        ConsultationinfoView.addSubview(ChangeconsultationBtn)
        
        containerView.addSubview(HomeBtn)
       
        
        
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 20 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            ProfileImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
            ProfileImg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            ProfileImg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            ProfileImg.widthAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            
            
            PatientreviewBtn.centerYAnchor.constraint(equalTo: NameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            PatientreviewBtn.topAnchor.constraint(equalTo: ProfileImg.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PatientreviewBtn.trailingAnchor.constraint(equalTo: NameLbl.leadingAnchor, constant: -23 * appConstant.widthRatio),
            PatientreviewBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            PatientreviewBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            
            NameLbl.centerXAnchor.constraint(equalTo: ProfileImg.centerXAnchor, constant: 0 * appConstant.heightRatio),
            NameLbl.topAnchor.constraint(equalTo: ProfileImg.bottomAnchor, constant: 20 * appConstant.heightRatio),
            NameLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 121 * appConstant.widthRatio),
            NameLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            NameeditBtn.centerXAnchor.constraint(equalTo: PatientreviewBtn.centerXAnchor, constant: 0 * appConstant.heightRatio),
            NameeditBtn.topAnchor.constraint(equalTo: PatientreviewBtn.bottomAnchor, constant: 8 * appConstant.heightRatio),
//            NameeditBtn.leadingAnchor.constraint(equalTo: NameLbl.trailingAnchor, constant: 23 * appConstant.widthRatio),
            NameeditBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            NameeditBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),

            locationIcon.centerYAnchor.constraint(equalTo: locationLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            locationIcon.topAnchor.constraint(equalTo: NameLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            locationIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 143 * appConstant.widthRatio),
            locationIcon.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            locationIcon.widthAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
            
            locationLbl.topAnchor.constraint(equalTo: NameLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            locationLbl.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 8 * appConstant.widthRatio),
            locationLbl.centerXAnchor.constraint(equalTo: NameLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            locationLbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),

            
            PersonalinfoView.topAnchor.constraint(equalTo: NameeditBtn.bottomAnchor, constant: 18 * appConstant.heightRatio),
            PersonalinfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PersonalinfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            PersonalinfoView.heightAnchor.constraint(equalToConstant: 282 * appConstant.heightRatio),
            
            PersonProfileLbl.topAnchor.constraint(equalTo: PersonalinfoView.topAnchor, constant: 23 * appConstant.heightRatio),
            PersonProfileLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PersonProfileLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),

            ChangeprofileBtn.topAnchor.constraint(equalTo: PersonalinfoView.topAnchor, constant: 19 * appConstant.heightRatio),
            ChangeprofileBtn.trailingAnchor.constraint(equalTo: PersonalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ChangeprofileBtn.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            ChangeprofileBtn.widthAnchor.constraint(equalToConstant: 89 * appConstant.heightRatio),

            PhoneNumLbl.topAnchor.constraint(equalTo: PersonProfileLbl.bottomAnchor, constant: 14 * appConstant.heightRatio),
            PhoneNumLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PhoneNumLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            PhoneLbl.topAnchor.constraint(equalTo: PhoneNumLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            PhoneLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PhoneLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            EmailtitleLbl.topAnchor.constraint(equalTo: PhoneLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            EmailtitleLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmailtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            EmailLbl.topAnchor.constraint(equalTo: EmailtitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            EmailLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmailLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            GendertitleLbl.topAnchor.constraint(equalTo: EmailLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            GendertitleLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            GendertitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            GenderLbl.topAnchor.constraint(equalTo: GendertitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            GenderLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            GenderLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DOBtitleLbl.topAnchor.constraint(equalTo: GenderLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            DOBtitleLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            DOBLbl.topAnchor.constraint(equalTo: DOBtitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            DOBLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            ProfessionalinfoView.topAnchor.constraint(equalTo: PersonalinfoView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            ProfessionalinfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ProfessionalinfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
//            ProfessionalinfoView.heightAnchor.constraint(equalToConstant: 285 * appConstant.heightRatio),
//            ProfessionalinfoView.bottomAnchor.constraint(equalTo: ConsultationinfoView.topAnchor, constant: 12 * appConstant.heightRatio ),
            
            ProfessionalInfotitleLbl.topAnchor.constraint(equalTo: ProfessionalinfoView.topAnchor, constant: 23 * appConstant.heightRatio),
            ProfessionalInfotitleLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ProfessionalInfotitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),

            ChangemedicalBtn.topAnchor.constraint(equalTo: ProfessionalinfoView.topAnchor, constant: 19 * appConstant.heightRatio),
            ChangemedicalBtn.trailingAnchor.constraint(equalTo: ProfessionalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ChangemedicalBtn.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            ChangemedicalBtn.widthAnchor.constraint(equalToConstant: 89 * appConstant.heightRatio),
            
            
            AboutDoctortitleLbl.topAnchor.constraint(equalTo: ChangemedicalBtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            AboutDoctortitleLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AboutDoctortitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            AboutDoctorDesclbl.topAnchor.constraint(equalTo: AboutDoctortitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            AboutDoctorDesclbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AboutDoctorDesclbl.trailingAnchor.constraint(equalTo: ProfessionalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
//            AboutDoctorDesclbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            HospitalnametitleLbl.topAnchor.constraint(equalTo: AboutDoctorDesclbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            HospitalnametitleLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HospitalnametitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            HospitalnamedescLbl.topAnchor.constraint(equalTo: HospitalnametitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            HospitalnamedescLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HospitalnamedescLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
           
            WorkingexptitleLbl.topAnchor.constraint(equalTo: HospitalnamedescLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            WorkingexptitleLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            WorkingexptitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            WorkingexpdescLbl.topAnchor.constraint(equalTo: WorkingexptitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            WorkingexpdescLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            WorkingexpdescLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            //
            EducationtitleLbl.topAnchor.constraint(equalTo: WorkingexpdescLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            EducationtitleLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EducationtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            EducationdescLbl.topAnchor.constraint(equalTo: EducationtitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            EducationdescLbl.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EducationdescLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
//            EducationdescLbl.bottomAnchor.constraint(equalTo: ProfessionalinfoView.bottomAnchor, constant: -5 * appConstant.heightRatio),
            
            
            workcontainerView.topAnchor.constraint(equalTo: EducationdescLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            workcontainerView.leadingAnchor.constraint(equalTo: ProfessionalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            workcontainerView.trailingAnchor.constraint(equalTo: ProfessionalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            workcontainerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            workcontainerView.bottomAnchor.constraint(equalTo: ProfessionalinfoView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
            
            //            ClipboardIcon.centerYAnchor.constraint(equalTo: locationLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            //            ClipboardIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 6 * appConstant.heightRatio),
            //    ClipboardIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 63 * appConstant.heightRatio),
            ClipboardIcon.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            ClipboardIcon.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            ClipboardLbl.centerXAnchor.constraint(equalTo: ClipboardIcon.centerXAnchor, constant: 0 * appConstant.heightRatio),
            ClipboardLbl.topAnchor.constraint(equalTo: ClipboardIcon.bottomAnchor, constant: 11 * appConstant.heightRatio),
            //     ClipboardLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 71 * appConstant.heightRatio),
            ClipboardLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            Clipboarddesclbl.centerXAnchor.constraint(equalTo: ClipboardLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            Clipboarddesclbl.topAnchor.constraint(equalTo: ClipboardLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            //   Clipboarddesclbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 46 * appConstant.heightRatio),
            Clipboarddesclbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //    Clipboarddesclbl.widthAnchor.constraint(equalToConstant: 60 * appConstant.widthRatio),
            
            
            TimeIcon.centerYAnchor.constraint(equalTo: ClipboardIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            TimeIcon.centerXAnchor.constraint(equalTo: workcontainerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            
            TimeIcon.topAnchor.constraint(equalTo: workcontainerView.topAnchor, constant: 6 * appConstant.heightRatio),
            TimeIcon.leadingAnchor.constraint(equalTo: ClipboardIcon.trailingAnchor, constant: 65 * appConstant.heightRatio),
            TimeIcon.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            TimeIcon.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            TimeLbl.centerXAnchor.constraint(equalTo: TimeIcon.centerXAnchor, constant: 0 * appConstant.heightRatio),
            TimeLbl.centerYAnchor.constraint(equalTo: ClipboardLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            TimeLbl.topAnchor.constraint(equalTo: TimeIcon.bottomAnchor, constant: 11 * appConstant.heightRatio),
//            TimeLbl.leadingAnchor.constraint(equalTo: workcontainerView.leadingAnchor, constant: 71 * appConstant.heightRatio),
            TimeLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            Timedesclbl.centerYAnchor.constraint(equalTo: Clipboarddesclbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            Timedesclbl.centerXAnchor.constraint(equalTo: TimeLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            Timedesclbl.topAnchor.constraint(equalTo: TimeLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            //  Timedesclbl.leadingAnchor.constraint(equalTo: Clipboarddesclbl.trailingAnchor, constant: 46 * appConstant.heightRatio),
            Timedesclbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //     Timedesclbl.widthAnchor.constraint(equalToConstant: 60 * appConstant.widthRatio),
            
            
            CreditcardIcon.centerYAnchor.constraint(equalTo: TimeIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            //            CreditcardIcon.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 6 * appConstant.heightRatio),
            CreditcardIcon.leadingAnchor.constraint(equalTo: TimeIcon.trailingAnchor, constant: 65 * appConstant.heightRatio),
            CreditcardIcon.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            CreditcardIcon.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            
            CreditCardLbl.centerYAnchor.constraint(equalTo: TimeLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            CreditCardLbl.centerXAnchor.constraint(equalTo: CreditcardIcon.centerXAnchor, constant: 0 * appConstant.heightRatio),
            CreditCardLbl.topAnchor.constraint(equalTo: CreditcardIcon.bottomAnchor, constant: 11 * appConstant.heightRatio),
//            CreditCardLbl.leadingAnchor.constraint(equalTo: workcontainerView.leadingAnchor, constant: 71 * appConstant.heightRatio),
            CreditCardLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            CreditCarddesclbl.centerYAnchor.constraint(equalTo: Timedesclbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            CreditCarddesclbl.centerXAnchor.constraint(equalTo: CreditCardLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            CreditCarddesclbl.topAnchor.constraint(equalTo: CreditCardLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            //    CreditCarddesclbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -46 * appConstant.heightRatio),
            CreditCarddesclbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //    CreditCarddesclbl.widthAnchor.constraint(equalToConstant: 60 * appConstant.widthRatio),
            
            
            
            ConsultationinfoView.topAnchor.constraint(equalTo: ProfessionalinfoView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            ConsultationinfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ConsultationinfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ConsultationinfoView.heightAnchor.constraint(equalToConstant: 131 * appConstant.heightRatio),
            
            
            ConsultationInfotitleLbl.topAnchor.constraint(equalTo: ConsultationinfoView.topAnchor, constant: 23 * appConstant.heightRatio),
            ConsultationInfotitleLbl.leadingAnchor.constraint(equalTo: ConsultationinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ConsultationInfotitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),

            ChangeConsultationBtn.topAnchor.constraint(equalTo: ConsultationinfoView.topAnchor, constant: 19 * appConstant.heightRatio),
            ChangeConsultationBtn.trailingAnchor.constraint(equalTo: ConsultationinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ChangeConsultationBtn.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            ChangeConsultationBtn.widthAnchor.constraint(equalToConstant: 89 * appConstant.heightRatio),
            
            ConsultationtitleLbl.topAnchor.constraint(equalTo: ChangeConsultationBtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            ConsultationtitleLbl.leadingAnchor.constraint(equalTo: ConsultationinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ConsultationtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            //
            ChangeconsultationBtn.topAnchor.constraint(equalTo: ConsultationtitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            ChangeconsultationBtn.leadingAnchor.constraint(equalTo: ConsultationinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ChangeconsultationBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            
          //  HomeBtn.centerXAnchor.constraint(equalTo: MedicalinfoView.centerXAnchor, constant: 0 * appConstant.heightRatio),

            HomeBtn.topAnchor.constraint(equalTo: ConsultationinfoView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),

            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),

            HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30 * appConstant.heightRatio ),
            
            

        ])
        
    }
    
    
    func getdoctorprofiledata()
    {
        
      //  loadingView.show(on: view)
        DispatchQueue.main.async {
        ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        manager.doctorprofilelist { data, msg, hasError in
            DispatchQueue.main.async {
            ActivityIndicator.shared.removeSpinner()
            }
            if hasError{
            //    RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                
                if data?.status == "200"
                {
           //     RSLoadingView.hide(from: self.view)
                self.getsubcatlist =  data!
                self.setdata()
                }
                else
                {
           //     RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: "No data", title: "Alert")
                }
            }
        }
        
        
    }
    
    func setdata()
    {
        NameLbl.text = getsubcatlist.data?.name
        PhoneLbl.text = getsubcatlist.data?.contact
        EmailLbl.text = getsubcatlist.data?.email
        AppUserDefault.shared.username = getsubcatlist.data?.name
        AppUserDefault.shared.useremail = getsubcatlist.data?.email
        AppUserDefault.shared.userdoctoremail = getsubcatlist.data?.email
        GenderLbl.text = getsubcatlist.data?.gender
        DOBLbl.text = getsubcatlist.data?.date_of_birth
        WorkingexpdescLbl.text = getsubcatlist.data?.work_experience
        ChangeconsultationBtn.setTitle("$ " + (getsubcatlist.data?.fees ?? "0"), for: .normal)
        EducationdescLbl.text = getsubcatlist.data?.education
      //  illnesstitleLbl.text = getsubcatlist.data?.
//        medicalrecorddescLbl.text = getsubcatlist.data?.medical_record
//        EmergencycondescLbl.text = getsubcatlist.data?.emergencey_contact
        locationLbl.text = getsubcatlist.data?.address
        AboutDoctorDesclbl.text =  getsubcatlist.data?.description
        HospitalnamedescLbl.text = getsubcatlist.data?.hospital_name
        CreditCardLbl.text = "$ \(getsubcatlist.earning ?? 0)"
        TimeLbl.text = "\(getsubcatlist.appointments ?? 0)"
        ClipboardLbl.text = "\(getsubcatlist.completed ?? 0)"
        AppUserDefault.shared.username = getsubcatlist.data?.name
        
        AppUserDefault.shared.url = getsubcatlist.data?.url
       
        if getsubcatlist.data?.url == nil
        {
            ProfileImg.image = UIImage(named: "Profile_img")
        }
        else
        {
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + ( getsubcatlist.data?.url ?? ""))
            ProfileImg.kf.setImage(with: url)
        }
      //  illenesscolBtn.setTitle(getsubcatlist.illness![0].name, for: .normal)
        
    }
    
    @objc func SeeallPatientbtn_press(){
        let vc = DoctorSeeallPatientreviewsController()
        vc.modalPresentationStyle = .fullScreen
        vc.getdocspecialities = getsubcatlist
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func Nameedit_press(){
        let vc = DoctorEditProfileController()
        vc.modalPresentationStyle = .fullScreen
        vc.getsubcatlist = getsubcatlist
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func chnagebtn_press(){
        let vc = DoctorEditProfileController()
        vc.modalPresentationStyle = .fullScreen
        vc.getsubcatlist = getsubcatlist
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @objc func chnageperbtn_press(){
        let vc = DoctorEditProfileController()
        vc.modalPresentationStyle = .fullScreen
        vc.getsubcatlist = getsubcatlist
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func User_Sigout()
    {
        signoutManager.Signoutuser{msg,hasError in
            if hasError{
               alertWithMsg(vc: self, msg: msg, title: "Alert!")
            }
            else
            {
                print("Logout")
//                alertWithMsg(vc: self, msg: msg, title: "Alert!")
            }
        }
    }
    
    @objc func homebtn_press(){
        
        let refreshAlert = UIAlertController(title: "Logout", message: "Are you sure you want to logout?", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            Helper.clearUser()
            self.User_Sigout()
            let vc = WellcomeStartController()
            let rootNC = UINavigationController(rootViewController: vc)
            rootNC.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = rootNC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
           
        
    }
    
    
    @objc override func backbtn_press(){
        self.dismiss(animated: true)
    }
    
    
    @objc func logoutbtn_press(){
        
        AppUserDefault.shared.isLogin = false
        AppUserDefault.shared.isAppointment = false
        let vc = OnboardingController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()

    }
    
}


//extension DoctorProfileController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return getsubcatlist.count
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = AboutDoctorDesclbl.dequeueReusableCell(withReuseIdentifier: DocTypeCVCell.identifier, for: indexPath) as! DocTypeCVCell
//        cell.datetitleLbl.text = getsubcatlist[indexPath.row]
//    //    cell.backgroundColor = .filterUnSelect
//        return cell
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView,
//                       layout collectionViewLayout: UICollectionViewLayout,
//                       sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//        let size: CGSize = getsubcatlist[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.0 * appConstant.widthRatio)])
//        return CGSize(width:(size.width + 20 * appConstant.heightRatio) , height: 30 * appConstant.heightRatio)
//
//
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 8 * appConstant.widthRatio
//
//    }
//
//
//}

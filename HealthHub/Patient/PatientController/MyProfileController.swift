//
//  MyProfileController.swift
//  HealthHub
//
//  Created by OBS on 13/12/2021.
//

import UIKit
//import RSLoadingView
import Kingfisher
import LGSideMenuController

class MyProfileController: BaseController {
    
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor(named: Colors.AppBGColor)
        SV.showsVerticalScrollIndicator = false
        SV.translatesAutoresizingMaskIntoConstraints = false
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
//        iv.image = UIImage(named: "Profile_img")
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
//        lbl.text = "Richard Dawn"
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
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
//        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "EditIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.clipsToBounds = false
        btn.addTarget(self, action: #selector(Nameedit_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var invoiceBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
//        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
//        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.5
//        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "Invoiceicon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.clipsToBounds = false
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
        lbl.numberOfLines = 3
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
        lbl.text = "Blood Work"
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
        lbl.text = "Spending"
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
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Credentials of Person Profile Info
    
    lazy var PersonProfileLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
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
    
    lazy var MedicalinfoView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var MedicalInfotitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Medical Info"
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
    
    
    lazy var illnesstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Illness"
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
        btn.setTitle("  ", for: .normal)
        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
        
        return btn
    }()
    lazy var DocTypeCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentMode = .scaleToFill
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return  collectionView
    }()
    
    
    lazy var medicalrecordtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Medical Record"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var medicalrecorddescLbl : UILabel = {
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
    
    
    lazy var EmergencycontitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Emergency Contact"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmergencycondescLbl : UILabel = {
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
    
    
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Home", for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
        
        return btn
    }()
    //
    lazy var logoutBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        //  btn.setImage(UIImage(named: "logoutIcon"), for: UIControl.State.normal)
        btn.setTitle("Logout", for: .normal)
//        btn.clipsToBounds = true
        
        
        //   btn.contentHorizontalAlignment = .left
        // Configure Symbol
        let config = UIImage.SymbolConfiguration(pointSize: 19.0, weight: .semibold, scale: .large)
        let image = UIImage(systemName: "logoutIcon", withConfiguration: config)
        btn.setImage(image, for: .normal)
        
        // Put the Image on the right hand side of the button
        // Credit to liau-jian-jie for this part
        btn.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btn.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        
        // Customise spacing to match system Back button
        btn.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -18.0, bottom: 0.0, right: 0.0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -12.0, bottom: 0.0, right: 0.0)
        btn.addTarget(self, action: #selector(logoutbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var MedicalHistoryView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var MedicalHistorytitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Medical History"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var MedicalHistorydesctitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Do you want to change medical history?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var MedicalHistoryeditBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 9 * appConstant.heightRatio
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.15
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        btn.layer.shadowRadius = 3 * appConstant.heightRatio
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "EditIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(historyedit_press), for: .touchUpInside)
        
        return btn
    }()
    
    //    let loadingView = RSLoadingView()
    let manager = UserProfileManager()
    
    var getsubcatlist = UserProfileModel()
    
    var needsFirstScroll = true
    
    var imageofdata = editdata1()
    
    var signoutManager = SignoutManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        DocTypeCV.delegate = self
        DocTypeCV.dataSource = self
        DocTypeCV.register(DocTypeCVCell.self, forCellWithReuseIdentifier: DocTypeCVCell.identifier)
        setup()
        
        headerLbl.text = "My Profile"
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.getuserprofiledata()
        }
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(ProfileImg)
        containerView.addSubview(invoiceBtn)
        containerView.addSubview(NameLbl)
        containerView.addSubview(NameeditBtn)
        containerView.addSubview(locationIcon)
        containerView.addSubview(locationLbl)
      
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
        
        containerView.addSubview(MedicalinfoView)
        MedicalinfoView.addSubview(MedicalInfotitleLbl)
        MedicalinfoView.addSubview(ChangemedicalBtn)
        MedicalinfoView.addSubview(illnesstitleLbl)
        MedicalinfoView.addSubview(DocTypeCV)
        MedicalinfoView.addSubview(medicalrecordtitleLbl)
        MedicalinfoView.addSubview(medicalrecorddescLbl)
        MedicalinfoView.addSubview(EmergencycontitleLbl)
        MedicalinfoView.addSubview(EmergencycondescLbl)
        MedicalinfoView.addSubview(workcontainerView)
        workcontainerView.addSubview(ClipboardIcon)
        workcontainerView.addSubview(ClipboardLbl)
        workcontainerView.addSubview(Clipboarddesclbl)
        
        workcontainerView.addSubview(TimeIcon)
        workcontainerView.addSubview(TimeLbl)
        workcontainerView.addSubview(Timedesclbl)
        
        workcontainerView.addSubview(CreditcardIcon)
        workcontainerView.addSubview(CreditCardLbl)
        workcontainerView.addSubview(CreditCarddesclbl)
        
        containerView.addSubview(MedicalHistoryView)
        MedicalHistoryView.addSubview(lineView)
        MedicalHistoryView.addSubview(MedicalHistorytitleLbl)
        MedicalHistoryView.addSubview(MedicalHistorydesctitleLbl)
        MedicalHistoryView.addSubview(MedicalHistoryeditBtn)
        
        containerView.addSubview(HomeBtn)
        containerView.addSubview(logoutBtn)
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            ProfileImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
            ProfileImg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            //            ProfileImg.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 151 * appConstant.widthRatio),
            //            ProfileImg.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -151 * appConstant.widthRatio),
            ProfileImg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            ProfileImg.widthAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            
            
            invoiceBtn.centerYAnchor.constraint(equalTo: NameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            invoiceBtn.topAnchor.constraint(equalTo: ProfileImg.bottomAnchor, constant: 20 * appConstant.heightRatio),
            invoiceBtn.trailingAnchor.constraint(equalTo: NameLbl.leadingAnchor, constant: -23 * appConstant.widthRatio),
            invoiceBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            invoiceBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            
            NameLbl.centerXAnchor.constraint(equalTo: ProfileImg.centerXAnchor, constant: 0 * appConstant.heightRatio),
            NameLbl.topAnchor.constraint(equalTo: ProfileImg.bottomAnchor, constant: 20 * appConstant.heightRatio),
            NameLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 121 * appConstant.widthRatio),
            NameLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            NameeditBtn.centerXAnchor.constraint(equalTo: invoiceBtn.centerXAnchor, constant: 0 * appConstant.heightRatio),
            NameeditBtn.topAnchor.constraint(equalTo: invoiceBtn.bottomAnchor, constant: 8 * appConstant.heightRatio),
//            NameeditBtn.leadingAnchor.constraint(equalTo: NameLbl.trailingAnchor, constant: 23 * appConstant.widthRatio),
            NameeditBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            NameeditBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            locationLbl.topAnchor.constraint(equalTo: NameLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            locationLbl.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 8 * appConstant.widthRatio),
            locationLbl.centerXAnchor.constraint(equalTo: NameLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            locationLbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            //            locationLbl.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            locationIcon.centerYAnchor.constraint(equalTo: locationLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            locationIcon.topAnchor.constraint(equalTo: NameLbl.bottomAnchor, constant: 6 * appConstant.heightRatio),
            locationIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 143 * appConstant.widthRatio),
            locationIcon.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            locationIcon.widthAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
            
            
            PersonalinfoView.topAnchor.constraint(equalTo: NameeditBtn.bottomAnchor, constant: 12 * appConstant.heightRatio),
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
            
            
            MedicalinfoView.topAnchor.constraint(equalTo: PersonalinfoView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            MedicalinfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            MedicalinfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
//            MedicalinfoView.heightAnchor.constraint(equalToConstant: 231 * appConstant.heightRatio),
            
            //MedicalinfoView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio ),
            
            MedicalInfotitleLbl.topAnchor.constraint(equalTo: MedicalinfoView.topAnchor, constant: 23 * appConstant.heightRatio),
            MedicalInfotitleLbl.leadingAnchor.constraint(equalTo: MedicalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            MedicalInfotitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            ChangemedicalBtn.topAnchor.constraint(equalTo: MedicalinfoView.topAnchor, constant: 19 * appConstant.heightRatio),
            ChangemedicalBtn.trailingAnchor.constraint(equalTo: MedicalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ChangemedicalBtn.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            ChangemedicalBtn.widthAnchor.constraint(equalToConstant: 89 * appConstant.heightRatio),
            
            
            illnesstitleLbl.topAnchor.constraint(equalTo: ChangemedicalBtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            illnesstitleLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            illnesstitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            DocTypeCV.topAnchor.constraint(equalTo: illnesstitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            DocTypeCV.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocTypeCV.trailingAnchor.constraint(equalTo: PersonalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocTypeCV.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            medicalrecordtitleLbl.topAnchor.constraint(equalTo: DocTypeCV.bottomAnchor, constant: 10 * appConstant.heightRatio),
            medicalrecordtitleLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            medicalrecordtitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            medicalrecorddescLbl.topAnchor.constraint(equalTo: medicalrecordtitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            medicalrecorddescLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            medicalrecorddescLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            EmergencycontitleLbl.topAnchor.constraint(equalTo: medicalrecorddescLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            EmergencycontitleLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmergencycontitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            EmergencycondescLbl.topAnchor.constraint(equalTo: EmergencycontitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            EmergencycondescLbl.leadingAnchor.constraint(equalTo: PersonalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmergencycondescLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            workcontainerView.topAnchor.constraint(equalTo: EmergencycondescLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            workcontainerView.leadingAnchor.constraint(equalTo: MedicalinfoView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            workcontainerView.trailingAnchor.constraint(equalTo: MedicalinfoView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            workcontainerView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            workcontainerView.bottomAnchor.constraint(equalTo: MedicalinfoView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
            
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

            
            MedicalHistoryView.topAnchor.constraint(equalTo: MedicalinfoView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            MedicalHistoryView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            MedicalHistoryView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            MedicalHistoryView.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            
            lineView.topAnchor.constraint(equalTo: EmergencycondescLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            lineView.leadingAnchor.constraint(equalTo: MedicalinfoView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            lineView.trailingAnchor.constraint(equalTo: MedicalinfoView.trailingAnchor, constant: 0 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            
            
            MedicalHistorytitleLbl.topAnchor.constraint(equalTo: MedicalHistoryView.topAnchor, constant: 10 * appConstant.heightRatio),
            MedicalHistorytitleLbl.leadingAnchor.constraint(equalTo: MedicalHistoryView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            MedicalHistorytitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            MedicalHistorydesctitleLbl.topAnchor.constraint(equalTo: MedicalHistorytitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            MedicalHistorydesctitleLbl.leadingAnchor.constraint(equalTo: MedicalHistorytitleLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            MedicalHistorydesctitleLbl.trailingAnchor.constraint(equalTo: MedicalHistoryeditBtn.leadingAnchor, constant: -30 * appConstant.widthRatio),
            MedicalHistorydesctitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            MedicalHistoryeditBtn.centerYAnchor.constraint(equalTo: MedicalHistorydesctitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            MedicalHistoryeditBtn.trailingAnchor.constraint(equalTo: MedicalHistoryView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            MedicalHistoryeditBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            MedicalHistoryeditBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            //  HomeBtn.centerXAnchor.constraint(equalTo: MedicalinfoView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            HomeBtn.topAnchor.constraint(equalTo: MedicalHistoryView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            // HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio ),
            
            
            logoutBtn.topAnchor.constraint(equalTo: HomeBtn.topAnchor, constant: 0 * appConstant.heightRatio),
            logoutBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            logoutBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            logoutBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            //            HomeBtn.widthAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            logoutBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24 * appConstant.heightRatio ),
            
            
            
        ])
        
    }
    
    @objc func Nameedit_press(){
        let vc = EditProfileController()
        vc.modalPresentationStyle = .fullScreen
        vc.getsubcatlist = getsubcatlist
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    
    
    @objc func chnagebtn_press(){
        let vc = EditProfileController()
        vc.modalPresentationStyle = .fullScreen
        vc.getsubcatlist = getsubcatlist
        vc.iscrolltobottom = "bottom"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @objc func historyedit_press(){
           let vc = MainHealthHistoryController()
           vc.modalPresentationStyle = .fullScreen
           vc.isfromProfile = true
           self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
       }
    
    @objc func chnageperbtn_press(){
        let vc = EditProfileController()
        vc.modalPresentationStyle = .fullScreen
        vc.getsubcatlist = getsubcatlist
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func homebtn_press(){
        let vc = CustomTabBarController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        //         self.navigationController?.pushViewController(HomeController(), animated: true)
        
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
    
    
    @objc func logoutbtn_press(){
        
        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to logout?", preferredStyle: .alert)

           // Create the actions
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
               UIAlertAction in
            
            Helper.clearUser()
            let vc = WellcomeStartController()
            self.User_Sigout()
            let rootNC = UINavigationController(rootViewController: vc)
            rootNC.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = rootNC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
               NSLog("OK Pressed")
           }
        let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default) {
               UIAlertAction in
    
//            self.postsymptop()
           
//               NSLog("Cancel Pressed")
           }

           // Add the actions
           alertController.addAction(okAction)
           alertController.addAction(cancelAction)

           // Present the controller
        self.present(alertController, animated: true, completion: nil)
                
    }
    
    @objc func SeeallPatientbtn_press(){
        let vc = AllInvoiceController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func getuserprofiledata()
    {
        
        //  loadingView.show(on: view)
        DispatchQueue.main.async {
            ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        manager.userprofilelist { data, msg, hasError in
            DispatchQueue.main.async {
                ActivityIndicator.shared.removeSpinner()
            }
            if hasError{
                //    RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if data!.status == "200"
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
        TimeLbl.text = "\(getsubcatlist.appointments ?? 0)"
        ClipboardLbl.text = "\(getsubcatlist.blodwork ?? 0)"
        CreditCardLbl.text = "$ \(getsubcatlist.spending ?? 0)"
        AppUserDefault.shared.userpatientemail = getsubcatlist.data?.email
        GenderLbl.text = getsubcatlist.data?.gender
        DOBLbl.text = getsubcatlist.data?.date_of_birth
        //  illnesstitleLbl.text = getsubcatlist.data?.
        medicalrecorddescLbl.text = getsubcatlist.data?.medical_record
        EmergencycondescLbl.text = getsubcatlist.data?.emergencey_contact
        locationLbl.text = getsubcatlist.data?.address
        
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
        DocTypeCV.reloadData()
        //  illenesscolBtn.setTitle(getsubcatlist.illness![0].name, for: .normal)
        
    }
    
}


extension MyProfileController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return getsubcatlist.illness?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = DocTypeCV.dequeueReusableCell(withReuseIdentifier: DocTypeCVCell.identifier, for: indexPath) as! DocTypeCVCell
        
        
        cell.illnesstitlelbl.text = getsubcatlist.illness![indexPath.row].name
        //    cell.backgroundColor = .filterUnSelect
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let size: CGSize = getsubcatlist.illness![indexPath.row].name!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.0 * appConstant.widthRatio)])
        return CGSize(width:(size.width + 20 * appConstant.heightRatio) , height: 30 * appConstant.heightRatio)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8 * appConstant.widthRatio
        
    }
    
    
}

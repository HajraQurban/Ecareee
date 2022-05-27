//
//  EditProfileController.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//

import UIKit
import FlagPhoneNumber
//import RSLoadingView
import MobileCoreServices
import Kingfisher


var pdfDataForDisease = Data()

var filenameof = ""

var editimageName1 = UIImage()
var editimagenameof = ""



class EditProfileController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.translatesAutoresizingMaskIntoConstraints = false
        
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius  = 0 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 0 * appConstant.heightRatio
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 9 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var editProfiletitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 24)
        lbl.text = "Edit Profile"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    lazy var PerimgView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(named: Colors.PrimaryAppColor1)?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 49 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Perimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "MaskIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var PerimgBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 15 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.contentMode = .scaleToFill
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.setImage(UIImage(named: "MaskEdit"), for: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(PerimgBtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var PersonProfiletitleLbl : UILabel = {
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
    
    
    lazy var nameTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Name"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var nameTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: Jon Snow"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var PhonenumTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var phonenumTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Phone Number"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PhoneNumbTF : FPNTextField = {
        let tf = FPNTextField()
        tf.placeholder = "000 - 000 - 0000"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.keyboardType = .numberPad
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var EmailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Email"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmailTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: yourname@email.com"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var Gendertitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Gender"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var radiofBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
        btn.addTarget(self, action: #selector(radiofbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var femaleBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(radiofbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    
    var radioF = "Male"
    
    
    lazy var fradiotitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Female"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var radiomBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "checkedIcon"), for: .normal)
        btn.addTarget(self, action: #selector(radiombtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var maleBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(radiombtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var mradiotitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Male"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DOBTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DOBtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Date of Birth"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DOBTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "dd/mm/yyyy"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var DOBBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setImage(UIImage(named: "CalenderIcon"), for: .normal)
        btn.addTarget(self, action: #selector(dobbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var medicalinfotitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Medical Info"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DieseaseTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var diseaseBtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Illness, known health problems"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var diseaseBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        //    btn.layer.cornerRadius = 18 * appConstant.heightRatio
        //  btn.titleLabel?.font = UIFont(name:"SFProDisplay-Bold", size: 15.0 * appConstant.heightRatio)
        //  btn.setTitle("Save", for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(createdateIllnesspicker), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    lazy var diseaseTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: Asthma"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var diseasedownBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
//        btn.isHidden  = true
        btn.setImage(UIImage(named: "Plusicon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(createdateIllnesspicker), for: .touchUpInside)
        return btn
    }()
    
    lazy var diseasenamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = .systemBlue
        lbl.layer.cornerRadius = 4 * appConstant.heightRatio
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "Asthma"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SymptomCV: UICollectionView = {
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
    
    lazy var MedicalreportTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Medicalreptitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Upload your Medical Record"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var MedicalrepdiseaseTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Pdf or Doc files allowed"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.isUserInteractionEnabled = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var MedicalrepBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "PaperclipIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(getpdffile_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var EmergencycontTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var EmergencycontTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Emergency Contact"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmergencycontTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "000 - 000 - 0000"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.keyboardType = .decimalPad
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    lazy var addressTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addressTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Address"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var addressTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: House#, Street#, City Name"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(savebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    var countryCode = ""
    
    
    var imageofdata = editdata1()
    
    //    let loadingView = RSLoadingView()
    let manager = EditProfileManager()
    
    var symptopnames = ["Fatigue","Dry cough","nausea","cough"]
    
    var getsymtopmslist = [String]()
    var getillnesslist = GetAllillness()
    var getsymtopmsidlist = [String]()
    
    var illnessManager = GetillnesslistManagers()
    var imgtoggle:Bool = true
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    
    //Create a DatePicker
    let datePicker: UIDatePicker = UIDatePicker()
    var getsubcatlist = UserProfileModel()
    
    var iscrolltobottom = ""
    
    var needsFirstScroll = true
    
    var imagePicker = UIImagePickerController() // instantiates an image picker controller.
    let calendar = Calendar(identifier: .gregorian)

    let currentDate = Date()
    var components = DateComponents()
    var diseasePicker = UIPickerView()
    var illnessList : [String] = [""]
    var toolBar = UIToolbar()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        diseaseTF.inputView = diseasePicker
        diseaseTF.inputAccessoryView = createtoolbar1()
        diseasePicker.delegate = self
        diseasePicker.dataSource = self
       
        SymptomCV.delegate = self
        SymptomCV.dataSource = self
        SymptomCV.register(SymptopCVCell.self, forCellWithReuseIdentifier: SymptopCVCell.identifier)
        
        PhoneNumbTF.delegate = self
        self.countryCode = PhoneNumbTF.selectedCountry?.phoneCode ?? "+92"
        PhoneNumbTF.flagButton.isUserInteractionEnabled = true
        //   PhoneNumbTF.setCountries(including: [.FR, .ES, .IT, .BE, .LU, .DE])
        //   PhoneNumbTF.setCountries(excluding: [.AD, .AE, .AF])
        //  PhoneNumbTF.pickerView.showCountryPhoneCode = false // true by default
        listController.showCountryPhoneCode = false // true by default
        view.backgroundColor = UIColor(named: Colors.EditCBG)
        createdatepicker()
        //   diseaseTF.inputAccessoryView = getsymptop()
        editdatasetting()
        getdoctorcategorylist()
        setup()
        //  self.scrollview.scrollToBottom(animated: true)
        
        
        // self.scrollview.scrollToBottom()
        //  scrollview.setContentOffset(CGPoint(x: 0, y: scrollview.contentSize.height), animated: true)
        
        
    }
    
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(backBtn)
        view.addSubview(editProfiletitleLbl)
        view.addSubview(scrollview)
        scrollview.addSubview(containerView)
        
        containerView.addSubview(PerimgView)
        PerimgView.addSubview(Perimg)
        containerView.addSubview(PerimgBtn)
        
        containerView.addSubview(PersonProfiletitleLbl)
        
        containerView.addSubview(nameTextFieldView)
        containerView.addSubview(nameTftitlelbl)
        containerView.addSubview(nameTF)
        
        containerView.addSubview(PhonenumTextFieldView)
        containerView.addSubview(phonenumTftitlelbl)
        containerView.addSubview(PhoneNumbTF)
        containerView.addSubview(EmailTextFieldView)
        containerView.addSubview(emailTftitlelbl)
        containerView.addSubview(EmailTF)
        
        containerView.addSubview(Gendertitlelbl)
        //
        containerView.addSubview(radiofBtn)
        containerView.addSubview(fradiotitlelbl)
        containerView.addSubview(radiomBtn)
        containerView.addSubview(mradiotitlelbl)
        containerView.addSubview(maleBtn)
        containerView.addSubview(femaleBtn)
        containerView.addSubview(DOBTextFieldView)
        containerView.addSubview(DOBtitlelbl)
        
        containerView.addSubview(DOBBtn)
        containerView.addSubview(DOBTF)
        
        containerView.addSubview(addressTextFieldView)
        containerView.addSubview(addressTftitlelbl)
        containerView.addSubview(addressTF)
        
        containerView.addSubview(medicalinfotitleLbl)
        containerView.addSubview(DieseaseTextFieldView)
        containerView.addSubview(diseaseBtitlelbl)
        
        
        containerView.addSubview(diseasedownBtn)
        containerView.addSubview(diseaseTF)
        containerView.addSubview(diseaseBtn)
        containerView.addSubview(SymptomCV)
        containerView.addSubview(MedicalreportTextFieldView)
        containerView.addSubview(Medicalreptitlelbl)
        containerView.addSubview(MedicalrepdiseaseTF)
        containerView.addSubview(MedicalrepBtn)
        
        containerView.addSubview(EmergencycontTextFieldView)
        containerView.addSubview(EmergencycontTftitlelbl)
        containerView.addSubview(EmergencycontTF)
        
        
        containerView.addSubview(HomeBtn)
        
        NSLayoutConstraint.activate([
            
            
            backBtn.topAnchor.constraint(equalTo: margin.topAnchor, constant: 12 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.widthRatio),
            
            editProfiletitleLbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            editProfiletitleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.widthRatio),
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: backBtn.bottomAnchor,constant: 12 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            PerimgView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
            PerimgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 139 * appConstant.widthRatio),
            //   PerimgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -139 * appConstant.widthRatio),
            PerimgView.heightAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            PerimgView.widthAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            
            
            Perimg.topAnchor.constraint(equalTo: PerimgView.topAnchor, constant: 0 * appConstant.heightRatio),
            Perimg.leadingAnchor.constraint(equalTo: PerimgView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.trailingAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.bottomAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            
            PerimgBtn.centerYAnchor.constraint(equalTo: PerimgView.centerYAnchor, constant: 28 * appConstant.heightRatio),
            PerimgBtn.centerXAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: -7 * appConstant.widthRatio),
            PerimgBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            PerimgBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            PersonProfiletitleLbl.topAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            PersonProfiletitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PersonProfiletitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            //   PersonProfiletitleLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            
            //
            nameTextFieldView.topAnchor.constraint(equalTo: PersonProfiletitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            nameTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            nameTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            nameTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            nameTftitlelbl.topAnchor.constraint(equalTo: nameTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            nameTftitlelbl.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            nameTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            nameTF.topAnchor.constraint(equalTo: nameTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            nameTF.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            nameTF.trailingAnchor.constraint(equalTo: nameTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            nameTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            PhonenumTextFieldView.topAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PhonenumTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PhonenumTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            PhonenumTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            phonenumTftitlelbl.topAnchor.constraint(equalTo: PhonenumTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            phonenumTftitlelbl.leadingAnchor.constraint(equalTo: PhonenumTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            phonenumTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            PhoneNumbTF.topAnchor.constraint(equalTo: phonenumTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            PhoneNumbTF.leadingAnchor.constraint(equalTo: PhonenumTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            PhoneNumbTF.trailingAnchor.constraint(equalTo: PhonenumTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            PhoneNumbTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            EmailTextFieldView.topAnchor.constraint(equalTo: PhonenumTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            EmailTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmailTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            EmailTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            emailTftitlelbl.topAnchor.constraint(equalTo: EmailTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            emailTftitlelbl.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            emailTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            EmailTF.topAnchor.constraint(equalTo: emailTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            EmailTF.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            EmailTF.trailingAnchor.constraint(equalTo: EmailTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            EmailTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            Gendertitlelbl.topAnchor.constraint(equalTo: EmailTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            Gendertitlelbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 39 * appConstant.widthRatio),
            Gendertitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            //
            radiofBtn.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            radiofBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            radiofBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            radiofBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            
            fradiotitlelbl.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            fradiotitlelbl.leadingAnchor.constraint(equalTo: radiofBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            fradiotitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            fradiotitlelbl.centerYAnchor.constraint(equalTo: radiofBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            
            // the male cre
            
            radiomBtn.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            radiomBtn.leadingAnchor.constraint(equalTo: fradiotitlelbl.trailingAnchor, constant: 90 * appConstant.widthRatio),
            radiomBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            radiomBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            
            femaleBtn.topAnchor.constraint(equalTo: radiofBtn.topAnchor, constant: 4 * appConstant.heightRatio),
            femaleBtn.leadingAnchor.constraint(equalTo: radiofBtn.leadingAnchor, constant: 4 * appConstant.widthRatio),
            femaleBtn.trailingAnchor.constraint(equalTo: fradiotitlelbl.trailingAnchor, constant: 4 * appConstant.heightRatio),
            femaleBtn.bottomAnchor.constraint(equalTo: radiofBtn.bottomAnchor, constant: 4 * appConstant.widthRatio),
            
            
            mradiotitlelbl.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            mradiotitlelbl.leadingAnchor.constraint(equalTo: radiomBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            mradiotitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            mradiotitlelbl.centerYAnchor.constraint(equalTo: radiomBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            
            maleBtn.topAnchor.constraint(equalTo: radiomBtn.topAnchor, constant: 4 * appConstant.heightRatio),
            maleBtn.leadingAnchor.constraint(equalTo: radiomBtn.leadingAnchor, constant: 4 * appConstant.widthRatio),
            maleBtn.trailingAnchor.constraint(equalTo: mradiotitlelbl.trailingAnchor, constant: 4 * appConstant.heightRatio),
            maleBtn.bottomAnchor.constraint(equalTo: radiomBtn.bottomAnchor, constant: 4 * appConstant.widthRatio),
            
            DOBTextFieldView.topAnchor.constraint(equalTo: fradiotitlelbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DOBTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DOBTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            DOBtitlelbl.topAnchor.constraint(equalTo: DOBTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            DOBtitlelbl.leadingAnchor.constraint(equalTo: DOBTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBtitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            
            DOBTF.topAnchor.constraint(equalTo: DOBtitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            DOBTF.leadingAnchor.constraint(equalTo: DOBTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBTF.trailingAnchor.constraint(equalTo: DOBTextFieldView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            DOBTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DOBBtn.topAnchor.constraint(equalTo: DOBTextFieldView.topAnchor, constant: 30 * appConstant.heightRatio),
            DOBBtn.trailingAnchor.constraint(equalTo: DOBTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DOBBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            DOBBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            addressTextFieldView.topAnchor.constraint(equalTo: DOBTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            addressTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            addressTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            addressTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            addressTftitlelbl.topAnchor.constraint(equalTo: addressTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            addressTftitlelbl.leadingAnchor.constraint(equalTo: addressTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            addressTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            addressTF.topAnchor.constraint(equalTo: addressTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            addressTF.leadingAnchor.constraint(equalTo: addressTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            addressTF.trailingAnchor.constraint(equalTo: addressTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            addressTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            medicalinfotitleLbl.topAnchor.constraint(equalTo: addressTextFieldView.bottomAnchor, constant: 30 * appConstant.heightRatio),
            medicalinfotitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            medicalinfotitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            //
            // DieseaseTextFieldView
            DieseaseTextFieldView.topAnchor.constraint(equalTo: medicalinfotitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DieseaseTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DieseaseTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DieseaseTextFieldView.heightAnchor.constraint(equalToConstant: 92 * appConstant.heightRatio),
            
            diseaseBtitlelbl.topAnchor.constraint(equalTo: DieseaseTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            diseaseBtitlelbl.leadingAnchor.constraint(equalTo: DieseaseTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            diseaseBtitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            diseaseTF.topAnchor.constraint(equalTo: diseaseBtitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            diseaseTF.leadingAnchor.constraint(equalTo: DieseaseTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            diseaseTF.trailingAnchor.constraint(equalTo: DieseaseTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            diseasedownBtn.centerYAnchor.constraint(equalTo: diseaseBtitlelbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            diseasedownBtn.trailingAnchor.constraint(equalTo: DieseaseTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            diseasedownBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            diseasedownBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            diseaseBtn.topAnchor.constraint(equalTo: diseaseBtitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            diseaseBtn.leadingAnchor.constraint(equalTo: DieseaseTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            diseaseBtn.trailingAnchor.constraint(equalTo: DieseaseTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            diseaseBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            SymptomCV.topAnchor.constraint(equalTo: diseaseTF.topAnchor, constant: 0 * appConstant.heightRatio),
            SymptomCV.leadingAnchor.constraint(equalTo: DieseaseTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            SymptomCV.trailingAnchor.constraint(equalTo: DieseaseTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SymptomCV.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            SymptomCV.bottomAnchor.constraint(equalTo: DieseaseTextFieldView.bottomAnchor, constant: -2 * appConstant.heightRatio),
            
            
            
            MedicalreportTextFieldView.topAnchor.constraint(equalTo: DieseaseTextFieldView.bottomAnchor, constant: 19 * appConstant.heightRatio),
            MedicalreportTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            MedicalreportTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            MedicalreportTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Medicalreptitlelbl.topAnchor.constraint(equalTo: MedicalreportTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            Medicalreptitlelbl.leadingAnchor.constraint(equalTo: MedicalreportTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            Medicalreptitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            MedicalrepdiseaseTF.topAnchor.constraint(equalTo: Medicalreptitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            MedicalrepdiseaseTF.leadingAnchor.constraint(equalTo: MedicalreportTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            MedicalrepdiseaseTF.trailingAnchor.constraint(equalTo: MedicalreportTextFieldView.trailingAnchor, constant: -30 * appConstant.widthRatio),
            MedicalrepdiseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            // MedicalrepBtn.topAnchor.constraint(equalTo: MedicalreportTextFieldView.topAnchor, constant: 30 * appConstant.heightRatio),
            MedicalrepBtn.centerYAnchor.constraint(equalTo: MedicalreportTextFieldView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            MedicalrepBtn.trailingAnchor.constraint(equalTo: MedicalreportTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            MedicalrepBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            MedicalrepBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            ///
            ///
            EmergencycontTextFieldView.topAnchor.constraint(equalTo: MedicalreportTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            EmergencycontTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmergencycontTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            EmergencycontTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            EmergencycontTftitlelbl.topAnchor.constraint(equalTo: EmergencycontTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            EmergencycontTftitlelbl.leadingAnchor.constraint(equalTo: EmergencycontTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            EmergencycontTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            
            EmergencycontTF.topAnchor.constraint(equalTo: EmergencycontTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            EmergencycontTF.leadingAnchor.constraint(equalTo: EmergencycontTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            EmergencycontTF.trailingAnchor.constraint(equalTo: EmergencycontTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            EmergencycontTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            HomeBtn.topAnchor.constraint(equalTo: EmergencycontTextFieldView.bottomAnchor, constant: 29 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40 * appConstant.heightRatio ),
            
        ])
        
        if iscrolltobottom == "bottom"
        {
            
            //            self.scrollview.setContentOffset(CGPoint(x:200, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
            //            let bottomOffset = CGPoint(x: 0, y: scrollview.contentSize.height - scrollview.bounds.size.height)
            //             scrollview.setContentOffset(bottomOffset, animated: true)
            let point = CGPoint(x: 0, y: self.view.frame.size.height)
            scrollview.contentOffset = point
            
        }
        
    }

    func editdatasetting()
    {
//        PhoneNumbTF.setFlag(key: PhoneNumbTF.selectedCountry)
        nameTF.text = getsubcatlist.data?.name
        PhoneNumbTF.text = getsubcatlist.data?.contact
        EmailTF.text = getsubcatlist.data?.email
        DOBTF.text = getsubcatlist.data?.date_of_birth
        addressTF.text = getsubcatlist.data?.address
        //        MedicalrepdiseaseTF.text = getsubcatlist.data?.medical_record
        EmergencycontTF.text = getsubcatlist.data?.emergencey_contact
        //        pdfDataForDisease = getsubcatlist.data?.medical_record_url
        
//        MedicalrepdiseaseTF.text = getsubcatlist.data?.medical_record
//        getsymtopmslist = getsubcatlist.illness
        
        if getsubcatlist.data?.gender == "Female"
        {
            radioF = "Female"
            radiofBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiomBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
        } else {
            radioF = "Male"
            radiomBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiofBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
        }
 
        if getsubcatlist.data?.url == nil
        {
            Perimg.image = UIImage(named: "Profile_img")
        }
        else
        {
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
            let url = URL(string: base + ( getsubcatlist.data?.url ?? ""))
            Perimg.kf.setImage(with: url)
        }
        
    }
    
    @objc func PerimgBtn_press()
    {
        //        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        //        imagePicker.delegate = self
        //        self.present(imagePicker, animated: true)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @objc func createdateIllnesspicker()
    {
        
       
        
        diseasePicker = UIPickerView.init()
        diseasePicker.delegate = self
        diseasePicker.dataSource = self
        diseasePicker.backgroundColor = UIColor.white
        diseasePicker.setValue(UIColor.black, forKey: "textColor")
        diseasePicker.autoresizingMask = .flexibleWidth
        diseasePicker.contentMode = .center
        diseasePicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(diseasePicker)
                
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed1))
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([dateFlexSpace,btn], animated: true)

        self.view.addSubview(toolBar)
        
    }
    
    @objc func disseasebtn_press(_ sender:UIButton)
    {
        diseaseTF.placeholder = " "
        let popoverVC =  illnessTV()
        popoverVC.getsymtopmslist = getillnesslist
        popoverVC.selectionTable.reloadData()
        popoverVC.delegate = self
        popoverVC.preferredContentSize = CGSize(width: 220.0 * appConstant.heightRatio , height: 200 * appConstant.widthRatio)
        
        popoverVC.modalPresentationStyle = .popover
        
        popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
        
        popoverVC.popoverPresentationController?.sourceView = sender
        
        self.present(popoverVC, animated: true, completion: nil)
    }
    

    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.none
        
    }
    
    
    
    func createtoolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([dateFlexSpace,btn], animated: true)
       
        return toolbar
    }
    
    @objc func donepressed()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        DOBTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func createtoolbar1() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed1))
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([dateFlexSpace,btn], animated: true)
       
        return toolbar
    }
    
    @objc func donepressed1()
    {
        let row = diseasePicker.selectedRow(inComponent: 0)
        if row == 0 {
//            self.getsymtopmsidlist.append("\(getillnesslist.data![row].id)")
            self.view.endEditing(true)
            toolBar.removeFromSuperview()
            diseasePicker.removeFromSuperview()
            return
        }
        for id in self.getsymtopmsidlist{
            if Int(id) == getillnesslist.data![row].id{
                toolBar.removeFromSuperview()
                diseasePicker.removeFromSuperview()
                return
            }
        }
        self.getsymtopmslist.append(getillnesslist.data![row].name ?? "")
        self.getsymtopmsidlist.append("\(getillnesslist.data![row].id ?? 0)")
        let name = getillnesslist.data![row].name
        let id = getillnesslist.data![row].id
//        getillnesslist.data?"".remove(at: row)
        self.diseaseTF.text = "  "
        diseasePicker.reloadAllComponents()
        
        self.SymptomCV.reloadData()
        self.view.endEditing(true)
        toolBar.removeFromSuperview()
        diseasePicker.removeFromSuperview()
       
    }
    
    func createdatepicker()
    {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        var minDateComponent = calendar.dateComponents([.day,.month,.year], from: Date())
        minDateComponent.day = 01
        minDateComponent.month = 01
        minDateComponent.year = 1900

        let minDate = calendar.date(from: minDateComponent)

        datePicker.minimumDate = minDate
        datePicker.maximumDate = currentDate
        DOBTF.inputView = datePicker
        DOBTF.inputAccessoryView = createtoolbar()
        
        
    }
    
    
    @objc func dobbtn_press(_ sender: UIButton)
    {
        
        createdatepicker()
        DOBTF.inputView = datePicker
        DOBTF.inputAccessoryView = createtoolbar()
        
    }
    
    
    //
    
    @objc func backbtn_press(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func EditProfileRequest()
    {
        //        getsymtopmsidlist.removeAll()
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "All fields requird", title: "Error!")
        }
        else
        {
            
            AppUserDefault.shared.username = nameTF.text
            let parameters: [String: Any] = [
                "name" : nameTF.text ?? "",
                "contact" : self.countryCode + (PhoneNumbTF.text  ?? "") ,
                "email" : EmailTF.text ?? "",
                "gender" : radioF ,
                "date_of_birth" : DOBTF.text ?? "",
                "address" : addressTF.text ?? "",
                "illness_id" : getsymtopmsidlist,
                "medical_record" :  MedicalrepdiseaseTF.text as AnyObject,
                "emergency_contact" :  EmergencycontTF.text ?? "",
                "image"  :  editimagenameof,
            ]
            
            if parameters != nil
            {
                //  let headers: [String: AnyObject] = ["Accept": "application/json"]
                DispatchQueue.main.async {
                    ActivityIndicator.shared.showSpinner(onView: self.view)
                }
                manager.editprofile(params: parameters) { msg, hasError in
                    //   RSLoadingView.hide(from: self.view)
                    DispatchQueue.main.async {
                        ActivityIndicator.shared.removeSpinner()
                        if hasError{
                            alertWithMsg(vc: self, msg: msg, title: "Error!")
                        }else{
                            //  alertWithMsg(vc: self, msg: msg, title: "Alert!")
                            self.navigationController?.popViewController(animated: true)
                            
                        }
                    }
                    
                }
                
            }
            else
            {
                alertWithMsg(vc: self, msg: "Parameter is Null", title: "Alert!")
            }
            //
            
        }
        
        
    }
    
    @objc func radiofbtn_press(){
        
        imgtoggle = !imgtoggle
        if imgtoggle {
            radioF = "Female"
            radiofBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiomBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
            
            
        } else {
            radioF = "Male"
            radiomBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiofBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
            
        }
        
        print("The Selected Gender is\(radioF)")
        
    }
    
    
    
    
    @objc func radiombtn_press(){
        
        imgtoggle = !imgtoggle
        if imgtoggle {
            radioF = "Female"
            radiofBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiomBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
            
            
        } else {
            radioF = "Male"
            radiomBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiofBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
            
        }
        
        print("The Selected Gender is\(radioF)")
        
    }
    
    @objc func getpdffile_press()
    {
        let types: [String] = [kUTTypePDF as String]
        let documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .formSheet
        self.present(documentPicker, animated: true, completion: nil)
    }
    
    
    
    
    @objc func savebtn_press(){
        
        EditProfileRequest()
        
        // self.navigationController?.pushViewController(MyProfileController(), animated: true)
    }
    
}

extension EditProfileController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getsymtopmslist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SymptomCV.dequeueReusableCell(withReuseIdentifier: SymptopCVCell.identifier, for: indexPath) as! SymptopCVCell
        
        
        //        let symptopname1 = getsubcatlist.illness?[indexPath.row].name ?? ""
        //        let attributedString1 = NSMutableAttributedString(string: symptopname1 )
        //        cell.selectLbl.attributedText = attributedString1
        
        let symptopname = getsymtopmslist[indexPath.row]
        
        let attributedString = NSMutableAttributedString(string: symptopname )
        //        let iconsSize = CGRect(x: 0, y: -3, width: 16, height: 16)
        //        let chatIcon = NSTextAttachment()
        //        chatIcon.image = UIImage(named: "CrossIcon")
        //        chatIcon.bounds = iconsSize
        //        attributedString.append(NSAttributedString(attachment: chatIcon))
        cell.crossBtn.tag  = indexPath.row
        cell.crossBtn.addTarget(self, action: #selector(deletebtn), for: .touchUpInside)
        cell.selectLbl.attributedText = attributedString
        //    cell.backgroundColor = .filterUnSelect
        return cell
    }
    
    @objc func deletebtn(sander : UIButton){
        let sp = getsymtopmslist[sander.tag]
        getsymtopmslist.remove(at: sander.tag)
        getsymtopmsidlist.remove(at: sander.tag)
        if getsymtopmslist.count == 0{
            self.diseaseTF.text = ""
        }
        self.SymptomCV.reloadData()
    }
    //
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let symptopname = getsymtopmslist[indexPath.row]
        let size: CGSize = (symptopname.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0 * appConstant.widthRatio)]))
        return CGSize(width:(size.width + 30) , height: 50 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8 * appConstant.widthRatio
    }
    
    
}


//textfield delegates
extension EditProfileController:UITextFieldDelegate{
    
    @objc
    func textFieldDidChange(textField: UITextField) {
        if textField == nameTF
        {
            if textField.text!.count > 3{
                //  NameValidationIcon.isHidden = false
            }
            else
            {
                //  NameValidationIcon.isHidden = true
            }
        }
        else if textField == EmailTF
        {
            if Helper.validateEmail(EmailTF.text!) {
            }
            else
            {
            }
        }
    }
    
}


extension EditProfileController
{
    func validate() -> (String?, Bool) {
        let name = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = EmailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phonenumber = PhoneNumbTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let DOB = DOBTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let addres = addressTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let diease = diseaseTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let emergency = EmergencycontTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        if name!.count  == 0 {
            return("Name is required.", false)
        }
        
        if email?.count == 0 {
            return("Email is required.", false)
        }
        if !Helper.validateEmail(EmailTF.text!) {
            return("Please enter correct email.", false)
        }
        if phonenumber!.count   == 0  {
            return("phone Number is required.", false)
        }
        if DOB?.count == 0 {
            return("Date of Birth is required.", false)
        }
        if addres?.count == 0 {
            return("Address Field is required.", false)
        }
        //        if diease?.count == 0 {
        //            return("Password is required.", false)
        //        }
        if emergency?.count == 0 {
            return("Emergency phone Number is required.", false)
        }
        
        //        if !Helper.validatePassword(passwordTF.text!) {
        //            return("Please enter correct Password", false)
        //        }
        return(nil,true)
    }
    
}

extension EditProfileController: FPNTextFieldDelegate {
    
    /// The place to present/push the listController if you choosen displayMode = .list
    func fpnDisplayCountryList() {
        //      let navigationViewController = UINavigationController(rootViewController: listController)
        //
        //      listController.title = "Countries"
        //      present(navigationViewController, animated: true, completion: nil)
    }
    
    /// Lets you know when a country is selected
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code) // Output "France", "+33", "FR"
        self.countryCode = dialCode
    }
    
    /// Lets you know when the phone number is valid or not. Once a phone number is valid, you can get it in severals formats (E164, International, National, RFC3966)
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            // Do something...
            //         textField.getFormattedPhoneNumber(format: .E164)           // Output "+33600000001"
            //         textField.getFormattedPhoneNumber(format: .International)  // Output "+33 6 00 00 00 01"
            //         textField.getFormattedPhoneNumber(format: .National)       // Output "06 00 00 00 01"
            //         textField.getFormattedPhoneNumber(format: .RFC3966)        // Output "tel:+33-6-00-00-00-01"
            //         textField.getRawPhoneNumber()                               // Output "600000001"
        } else {
            // Do something...
            //          PhoneNumbTF.displayMode = .list // .picker by default
            //
            //          listController.setup(repository: textField.countryRepository)
            //          listController.didSelect = { [weak self] country in
            //          self?.PhoneNumbTF.setFlag(countryCode: country.code)
            
            //      }
        }
        
        
    }
    
    
    func getdoctorcategorylist()
    {
        //  loadingView.show(on: view)
        
        //  view.center = CGPoint(x: selectionTable.frame.size.width  / 2,
        //       y: selectionTable.frame.size.height / 2)
        //  self.showSpinner(onView:  CGRect(x: selectionTable.frame.size.width  / 2,y: selectionTable.frame.size.height / 2))
        ActivityIndicator.shared.showSpinner(onView: self.view)
        illnessManager.illnesslist{ docdata, msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
                //   RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data!.count > 0
                {
                    //    RSLoadingView.hide(from: self.view)
                    self.getillnesslist =  docdata!
                    self.diseasePicker.reloadAllComponents()
                    
                }
                else
                {
                    
                    alertWithMsg(vc: self, msg: msg, title: "Alert!")
                    
                }
            }
        }
    }
    
}


extension EditProfileController : UIDocumentPickerDelegate
{
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // you get from the urls parameter the urls from the files selected
        let types: [String] = [kUTTypePDF as String]
        let documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
        documentPicker.delegate = self
        
        pdfDataForDisease = try! Data(contentsOf: urls.first!)
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
        //let data = NSData(contentsOf: myURL)
        
        MedicalrepdiseaseTF.text = myURL.lastPathComponent
        
        filenameof = myURL.lastPathComponent
        
        //   documentPicker.modalPresentationStyle = .formSheet
        //   self.present(documentPicker, animated: true, completion: nil)
        
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    
}


extension EditProfileController: SetillnessProtocol
{
    func setill(illness: String, id: String,list:GetAllillness) {
        self.getsymtopmslist.append(illness)
        self.getsymtopmsidlist.append(id)
        self.getillnesslist = list
        self.SymptomCV.reloadData()
    }
    
}


extension UIScrollView {
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
    
    //    func scrollToBottom() {
    //        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
    //        setContentOffset(bottomOffset, animated: true)
    //      }
}




extension EditProfileController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - ImagePicker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            Perimg.image = image
            
            editimageName1 = image
            
            if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                editimagenameof = url.lastPathComponent
                //  fileType = url.pathExtension
            }
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}

extension EditProfileController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (getillnesslist.data?.count ?? 0)
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return getillnesslist.data![row].name
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.getsymtopmslist.append(getillnesslist.data![row].name ?? "")
//        self.getsymtopmsidlist.append("\(getillnesslist.data![row].id)")
//
//        let name = getillnesslist.data![row].name
//        let id = getillnesslist.data![row].id
//        getillnesslist.data?.remove(at: row)
//
//        diseasePicker.reloadAllComponents()
//
//        self.SymptomCV.reloadData()
       
//        genderTF.text = illnessList[row]
    }
    
    
}

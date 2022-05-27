//
//  DescribeSymptopsController.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

struct SysmtopmData
{
    var symptom_id : [Int]?
    var complaint_name : String?
    var starting_date : String?
    var description1 : String?
    var doctor_id : Int?
    
    init(symptom_id : [Int]?, complaint_name : String?, starting_date : String?, description1 : String?, doctor_id : Int?)
    {
        self.symptom_id = symptom_id
        self.complaint_name = complaint_name
        self.starting_date = starting_date
        self.description1 = description1
        self.doctor_id = doctor_id
    }
}


import IQKeyboardManager
import UIKit
//import RSLoadingView

class DescribeSymptopsController: UIViewController, UIPopoverPresentationControllerDelegate {

 
//    lazy var scrollview : UIScrollView = {
//        let SV = UIScrollView()
//        SV.backgroundColor = UIColor.clear
//        SV.isScrollEnabled = false
//        SV.showsVerticalScrollIndicator = false
//        SV.translatesAutoresizingMaskIntoConstraints = false
//
//        return SV
//    }()
//
//
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 46 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
      //  btn.setTitle("Get Started", for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var FirstIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Num1")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var SymptoptitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 16)
        lbl.textColor = UIColor.black
        lbl.text = "Symptoms"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextColor)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var SecondIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum2")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var methodtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 16)
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.text = "Method"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var SecondlineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ThirdIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum3")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    
    
    
    lazy var chooseSymptoptitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Choose Symptoms"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
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
    
    lazy var nosypmtopLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = semiBold(size: 13)
        lbl.textColor = UIColor.black
        lbl.text = "No Symptoms add yet"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var plusBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "Plusicon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
      //  btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(createdatepicker), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var AddSymptopLbl: UIButton = {
        let btn = UIButton()
        
        //btn.titleLabel?.textColor = UIColor(named: Colors.AppColor)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = semiBold(size: 15)
        btn.setTitle("Add Symptoms", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(createdatepicker), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var fillformLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = semiBold(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Fill the Forms"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var complainTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var complainTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = medium(size: 15)
        lbl.text = "Name your Complaint (Max. 60 characters)"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var complainTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: My head feel dizzy"
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var SymptopdayTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var SymptopdayTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = medium(size: 15)
        lbl.text = "When did your symptoms start?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SymptopdayTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "2 days"
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var ProvideinfoTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ProvideinfoTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = medium(size: 15)
        lbl.text = "Provide more information (optional)"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ProvideinfoTF : UITextView = {
        let tf = UITextView()
//        tf.text = "When i woke up i feel like..."
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var Provideinfotextfieldtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "When i woke up i feel like..."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Provideinfomaxlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "Max. 150 characters"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var agreeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.setImage(UIImage(named: "Checkbox"), for: .normal)
//        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
      //  btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(agreebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var agreelightlbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "I agree with"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var agreedarklbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font =  bold(size: 15)
        lbl.text = " Terms & Conditions"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.layer.borderWidth = 1
       // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font =  bold(size: 15)
        lbl.text = "Choose Contact Method"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var backbtnIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
   
    var imgtoggle:String = "false"
//    let loadingView = RSLoadingView()
    let manager = GetSymtopslistManagers()
    var getsymtopmslist = [String]()
    var getsymtopmsidlist = [Int]()
    var symptopnames = ["Fatigue","Dry cough","nausea","cough"]
    
    var EmerData = symptopdata
    let manager1 = PostSypmtopsDataManager()
    
    //
    let managersym = GetSymtopslistManagers()
    var getsymtopmslistsym = GetAllSymptoms()
    
//    var tbr = CustomTabBarController()
    
    var slotid1 = 0
    var datePicker = UIPickerView()
  let DateArray = ["","1 day","2 days","3 days","4 days","5 days","6 days","7 days","8 days","9 days","10 days","11 days","12 days","13 days","14 days","15 days","16 days","17 days","18 days","19 days","20 days","21 days","22 days","23 days","24 days","25 days","26 days","27 days",
                                     "28 days","29 days","30 days","31 days"]
    var toolBar = UIToolbar()
    var diseasePicker = UIPickerView()
    var illnessList : [String] = [""]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        complainTF.delegate = self
        SymptopdayTF.delegate = self
        ProvideinfoTF.delegate = self
        SymptopdayTF.delegate = self
        SymptopdayTF.inputView = datePicker
        datePicker.dataSource = self
        datePicker.delegate = self
        datePicker.reloadAllComponents()
       
       
//        tbr.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        agreeBtn.setImage(UIImage(named: "Checkbox"), for: .normal)
        SymptomCV.delegate = self
        SymptomCV.dataSource = self
        SymptomCV.register(SymptopCVCell.self, forCellWithReuseIdentifier: SymptopCVCell.identifier)
      //  getdoctorcategorylist()
        setup()
        initializeHideKeyboard()
        
        getdoctorcategorylist()
        
        nosypmtopLbl.isHidden = true
        
    }
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(FirstIcon)
        headerView.addSubview(SymptoptitleLbl1)
        headerView.addSubview(lineView)
        headerView.addSubview(SecondIcon)
        headerView.addSubview(methodtitleLbl1)
        headerView.addSubview(SecondlineView)
        headerView.addSubview(ThirdIcon)
        
//        view.addSubview(scrollview)
        view.addSubview(containerView)
        view.addSubview(chooseSymptoptitleLbl1)
        view.addSubview(SymptomCV)
        view.addSubview(nosypmtopLbl)
        
        view.addSubview(plusBtn)
        view.addSubview(AddSymptopLbl)
        view.addSubview(fillformLbl)
        
        view.addSubview(complainTextFieldView)
        view.addSubview(complainTftitlelbl)
        view.addSubview(complainTF)
        
        view.addSubview(SymptopdayTextFieldView)
        view.addSubview(SymptopdayTftitlelbl)
        view.addSubview(SymptopdayTF)
        
        view.addSubview(ProvideinfoTextFieldView)
        view.addSubview(ProvideinfoTftitlelbl)
        view.addSubview(ProvideinfoTF)
       
        view.addSubview(Provideinfomaxlbl)
        view.addSubview(agreeBtn)
        view.addSubview(agreelightlbl)
        view.addSubview(agreedarklbl)
        
        view.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
        
            
        NSLayoutConstraint.activate([
            
            
            
            
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -48 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            backBtn.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 55 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            FirstIcon.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            FirstIcon.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15 * appConstant.heightRatio),
            FirstIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            FirstIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            SymptoptitleLbl1.centerYAnchor.constraint(equalTo: FirstIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SymptoptitleLbl1.leadingAnchor.constraint(equalTo: FirstIcon.trailingAnchor, constant: 5 * appConstant.heightRatio),
            SymptoptitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            lineView.centerYAnchor.constraint(equalTo: FirstIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            lineView.leadingAnchor.constraint(equalTo: SymptoptitleLbl1.trailingAnchor, constant: 10 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            lineView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),

            SecondIcon.centerYAnchor.constraint(equalTo: lineView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SecondIcon.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 10 * appConstant.heightRatio),
            SecondIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            SecondIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            methodtitleLbl1.centerYAnchor.constraint(equalTo: SecondIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            methodtitleLbl1.leadingAnchor.constraint(equalTo: SecondIcon.trailingAnchor, constant: 5 * appConstant.heightRatio),
            methodtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            SecondlineView.centerYAnchor.constraint(equalTo: methodtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SecondlineView.leadingAnchor.constraint(equalTo: methodtitleLbl1.trailingAnchor, constant: 10 * appConstant.heightRatio),
            SecondlineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            SecondlineView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            ThirdIcon.centerYAnchor.constraint(equalTo: SecondlineView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            ThirdIcon.leadingAnchor.constraint(equalTo: SecondlineView.trailingAnchor, constant: 10 * appConstant.heightRatio),
            ThirdIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            ThirdIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            
//            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
//            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 24 * appConstant.heightRatio),
//            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
//            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 118 * appConstant.heightRatio),
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
//            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

            
            
            chooseSymptoptitleLbl1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            SymptomCV.topAnchor.constraint(equalTo: chooseSymptoptitleLbl1.bottomAnchor, constant: 10 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SymptomCV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            SymptomCV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SymptomCV.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            
            
            nosypmtopLbl.leadingAnchor.constraint(equalTo: chooseSymptoptitleLbl1.leadingAnchor),
            nosypmtopLbl.centerYAnchor.constraint(equalTo: SymptomCV.centerYAnchor),
            
            
            plusBtn.topAnchor.constraint(equalTo: SymptomCV.bottomAnchor, constant: 19 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            plusBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            plusBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            AddSymptopLbl.centerYAnchor.constraint(equalTo: plusBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            AddSymptopLbl.leadingAnchor.constraint(equalTo: plusBtn.trailingAnchor, constant: 10 * appConstant.heightRatio),
            AddSymptopLbl.heightAnchor.constraint(equalToConstant: 14 * appConstant.heightRatio),
            
            
            fillformLbl.topAnchor.constraint(equalTo: AddSymptopLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            fillformLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            fillformLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            complainTextFieldView.topAnchor.constraint(equalTo: fillformLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            complainTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            complainTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            complainTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            complainTftitlelbl.topAnchor.constraint(equalTo: complainTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            complainTftitlelbl.leadingAnchor.constraint(equalTo: complainTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            complainTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            complainTF.topAnchor.constraint(equalTo: complainTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            complainTF.leadingAnchor.constraint(equalTo: complainTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            complainTF.trailingAnchor.constraint(equalTo: complainTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            complainTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            SymptopdayTextFieldView.topAnchor.constraint(equalTo: complainTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            SymptopdayTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            SymptopdayTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SymptopdayTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            SymptopdayTftitlelbl.topAnchor.constraint(equalTo: SymptopdayTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            SymptopdayTftitlelbl.leadingAnchor.constraint(equalTo: SymptopdayTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            SymptopdayTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            SymptopdayTF.topAnchor.constraint(equalTo: SymptopdayTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            SymptopdayTF.leadingAnchor.constraint(equalTo: SymptopdayTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            SymptopdayTF.trailingAnchor.constraint(equalTo: SymptopdayTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SymptopdayTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        //Provideinfo
            ProvideinfoTextFieldView.topAnchor.constraint(equalTo: SymptopdayTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            ProvideinfoTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ProvideinfoTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ProvideinfoTextFieldView.heightAnchor.constraint(equalToConstant: 148 * appConstant.heightRatio),
            
            ProvideinfoTftitlelbl.topAnchor.constraint(equalTo: ProvideinfoTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            ProvideinfoTftitlelbl.leadingAnchor.constraint(equalTo: ProvideinfoTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            ProvideinfoTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            ProvideinfoTF.topAnchor.constraint(equalTo: ProvideinfoTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            ProvideinfoTF.leadingAnchor.constraint(equalTo: ProvideinfoTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            ProvideinfoTF.trailingAnchor.constraint(equalTo: ProvideinfoTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            ProvideinfoTF.bottomAnchor.constraint(equalTo: ProvideinfoTextFieldView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            
//            Provideinfotextfieldtitlelbl.topAnchor.constraint(equalTo: ProvideinfoTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
//            Provideinfotextfieldtitlelbl.leadingAnchor.constraint(equalTo: ProvideinfoTF.leadingAnchor),
//            Provideinfotextfieldtitlelbl.trailingAnchor.constraint(equalTo: ProvideinfoTF.trailingAnchor),

            Provideinfomaxlbl.bottomAnchor.constraint(equalTo: ProvideinfoTextFieldView.bottomAnchor, constant: -10 * appConstant.heightRatio),
            Provideinfomaxlbl.trailingAnchor.constraint(equalTo: ProvideinfoTextFieldView.trailingAnchor, constant: -12 * appConstant.heightRatio),
            Provideinfomaxlbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            agreeBtn.topAnchor.constraint(equalTo: ProvideinfoTextFieldView.bottomAnchor, constant: 34 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            agreeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 69 * appConstant.heightRatio),
            agreeBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            agreeBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            agreelightlbl.centerYAnchor.constraint(equalTo: agreeBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            agreelightlbl.leadingAnchor.constraint(equalTo: agreeBtn.trailingAnchor, constant: 10 * appConstant.heightRatio),
            agreelightlbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            agreedarklbl.centerYAnchor.constraint(equalTo: agreelightlbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            agreedarklbl.leadingAnchor.constraint(equalTo: agreelightlbl.trailingAnchor, constant: 1 * appConstant.heightRatio),
            agreedarklbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            buttonView.topAnchor.constraint(equalTo: agreeBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            buttonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
//            buttonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -40 * appConstant.heightRatio),
            
            
            nextBtn.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            buttonLbl.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            buttonLbl.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor,constant: 0 * appConstant.widthRatio),
          //  buttonLbl.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 10 * appConstant.widthRatio),
//            buttonLbl.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: -10 * appConstant.heightRatio),
            
            
            backbtnIcon.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backbtnIcon.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: -23 * appConstant.widthRatio),
            backbtnIcon.heightAnchor.constraint(equalToConstant: 17 * appConstant.heightRatio),
            backbtnIcon.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            
            
        ])
    }
    
    @IBAction func YOUR_BUTTON__TAP_ACTION(_ sender: UIButton) {
      
    }
    @objc func createdatepicker()
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
            if Int(id) == getsymtopmslistsym.data![row].id{
                toolBar.removeFromSuperview()
                diseasePicker.removeFromSuperview()
                return
            }
        }
        
        self.getsymtopmslist.append(getsymtopmslistsym.data![row].name ?? "")
        self.getsymtopmsidlist.append(getsymtopmslistsym.data![row].id ?? 0)
        let name = getsymtopmslistsym.data![row].name
        let id = getsymtopmslistsym.data![row].id
//        getsymtopmslistsym.data?.remove(at: row)
    
        diseasePicker.reloadAllComponents()
        
        self.SymptomCV.reloadData()
        self.view.endEditing(true)
        toolBar.removeFromSuperview()
        diseasePicker.removeFromSuperview()
       
    }
    
    @objc func addbtn_press(_ sender:UIButton){

      //  addSectionBtn.backgroundColor = .selectedBtn
        plusBtn.setTitleColor(.white, for: .normal)
        let popoverVC =  SymptomsTV()
        popoverVC.getsymtopmslist = getsymtopmslistsym
        popoverVC.selectionTable.reloadData()
        
        popoverVC.delegate = self
        popoverVC.preferredContentSize = CGSize(width: 220.0 * appConstant.heightRatio , height: 200 * appConstant.widthRatio)

        popoverVC.modalPresentationStyle = .popover

        popoverVC.popoverPresentationController?.permittedArrowDirections = .up

        popoverVC.popoverPresentationController?.delegate = self
        
        popoverVC.popoverPresentationController?.sourceView = sender

        self.present(popoverVC, animated: true, completion: nil)
        
    }
    
    @objc func agreebtn_press(_ sender: UIButton){

     //   imgtoggle = !imgtoggle
        if sender.isSelected {
               agreeBtn.setImage(UIImage(named: "Checkbox"), for: .normal)
            sender.isSelected = false
            imgtoggle = "false"

           } else {
               agreeBtn.setImage(UIImage(named: "Tickicon"), for: .normal)
               sender.isSelected = true
               imgtoggle = "true"
               
           }
        
    }
    
    func postsymptop(){
        
        
        
        let parameters: [String: AnyObject] = ["symptom_id" : getsymtopmsidlist as AnyObject,
                                               "complaint_name" : complainTF.text as AnyObject,
                                               "starting_date" : SymptopdayTF.text as AnyObject,
                                               "description" : ProvideinfoTF.text as AnyObject,
                                               "doctor_id" : doctor_id1 as AnyObject,
                                               "slots_id" : slotid1 as AnyObject,
                                               "appoinment_type" : "Call" as AnyObject,
          "smoke" : smoke as AnyObject,
          "diabetes" : diabetes as AnyObject,
          "asthma" : epilepsy as AnyObject,
          "allergic" :  allergy as AnyObject,
         "diagnosed_diabetes" :  diabetes2 as AnyObject,
        "diagnosed_heart" :  heart as AnyObject,
        "diagnosed_kidney" :  kindny as AnyObject,
        "diagnosed_arthritis" :  arthistics as AnyObject,
        "diagnosed_pulmonary" :  pulmonary as AnyObject,
        "diagnosed_eating" :  eatingdisorder as AnyObject,
      ]
        
        ActivityIndicator.shared.showSpinner(onView: self.view)
       // loadingView.show(on: self)
  //  let headers: [String: AnyObject] = ["Accept": "application/json"]
        
        manager1.postsymptopdata(params: parameters) { [self] msg, hasError in
            ActivityIndicator.shared.removeSpinner()
       // RSLoadingView.hide(from: self)
        if hasError{
            print(hasError)
            ActivityIndicator.shared.removeSpinner()
       //     alertWithMsg(vc: self, msg: msg, title: "Error!")
        }else{
            print(msg)
        //    alertWithMsg(vc: self, msg: msg, title: "Alert!")
            print("Success")
            ActivityIndicator.shared.removeSpinner()
//            let VC:DoctorCategoryController = storyboard?.instantiateViewController(withIdentifier: "DoctorCategoryController") as! DoctorCategoryController
//            self.present(VC, animated: true)
           // self.delegate?.setnext()
           
        }
    }
        
        
    }
    
    
    @objc func backbtn_press(){
        self.dismiss(animated: true, completion: nil)
//        self.navigationController?.popViewController(animated: true)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
          
          return UIModalPresentationStyle.none
          
      }
    
    //Calling The Symtop Api
    func getdoctorcategorylist()
    {
      //  loadingView.show(on: view)
        ActivityIndicator.shared.showSpinner(onView: self.view)
        managersym.symtopmslist{ docdata, msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
             //   RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data!.count > 0
                {
                //    RSLoadingView.hide(from: self.view)
                    self.getsymtopmslistsym =  docdata!
                    self.diseasePicker.reloadAllComponents()
                }
                else
                {
                
                alertWithMsg(vc: self, msg: msg, title: "Alert!")

                }
            }
        }
    }
    
    
    
    
    func initializeHideKeyboard(){
    //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
    target: self,
    action: #selector(dismissMyKeyboard))
    //Add this tap gesture recognizer to the parent view
    view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissMyKeyboard(){
    //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
    //In short- Dismiss the active keyboard.
    view.endEditing(true)
    }
    
    
    @objc func nextBtn_press(_ sender: UIButton){
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "All fields requird", title: "Error!")
        }else{
        
      //  imgtoggle = !imgtoggle
        if imgtoggle == "true" {
            //
        //    nextBtn.isUserInteractionEnabled = true
            let symtop = SysmtopmData(symptom_id: getsymtopmsidlist, complaint_name: complainTF.text, starting_date: SymptopdayTF.text, description1: ProvideinfoTF.text, doctor_id: doctor_id1)
            
            symptopdata?.append(symtop)
           // postsymptop()
            let vc  = ConsultationMethodController()
            vc.delegate = self
            slotid = slotid1
            self.navigationController?.pushViewController(vc, animated: true)
         

        }
        else{
        //    nextBtn.isUserInteractionEnabled = false
            alertWithMsg(vc: self, msg: "Please Agree The Terms & Conditions First", title: "Alert!")
           // sender.isSelected = true
         //   nextBtn.isUserInteractionEnabled = true
        }
            
        }
    }

    
}


extension DescribeSymptopsController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if 0 == getsymtopmslist.count {
            nosypmtopLbl.isHidden = false
            return 0
        }
        else
        {
        nosypmtopLbl.isHidden = true
        return getsymtopmslist.count
        }
       // return getsymtopmslist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = SymptomCV.dequeueReusableCell(withReuseIdentifier: SymptopCVCell.identifier, for: indexPath) as! SymptopCVCell
        
        let symptopname = getsymtopmslist[indexPath.row]
        
        let attributedString = NSMutableAttributedString(string: symptopname )
//        let iconsSize = CGRect(x: 0, y: -3, width: 16, height: 16)
//        let chatIcon = NSTextAttachment()
//        chatIcon.image = UIImage(named: "CrossIcon")
//        chatIcon.bounds = iconsSize
//        attributedString.append(NSAttributedString(attachment: chatIcon))
        cell.crossBtn.tag  = indexPath.row
     //   getsymtopmsidlist.append(cell.crossBtn.tag)
        cell.crossBtn.addTarget(self, action: #selector(deletebtn), for: .touchUpInside)
         
        cell.selectLbl.attributedText = attributedString
    //    cell.backgroundColor = .filterUnSelect
        return cell
    }
    
    @objc func deletebtn(sander : UIButton){
//        let sp = getsymtopmslist[sander.tag]
        getsymtopmsidlist.remove(at: sander.tag)
        getsymtopmslist.remove(at: sander.tag)
        self.SymptomCV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let symptopname = getsymtopmslist[indexPath.row]
        let size: CGSize = (symptopname.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0 * appConstant.widthRatio)]))
        return CGSize(width:(size.width + 24) , height: 36 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
        return 10 * appConstant.widthRatio
   }
    
    
    
}


extension DescribeSymptopsController : SetSymtomsProtocol,PoptheVcdelegate
{
    func SetClear() {
            self.imgtoggle = "false"
            self.agreeBtn.isSelected = true
            self.agreeBtn.setImage(UIImage(named: "Checkbox"), for: .normal)
       
    }
    
    func setSym(symtoms: String, id: Int, list: GetAllSymptoms) {
        self.getsymtopmslist.append(symtoms)
        self.getsymtopmsidlist.append(id)
        self.getsymtopmslistsym  = list
        self.SymptomCV.reloadData()
    }
        
}



//textfield delegates
extension DescribeSymptopsController:UITextFieldDelegate{
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == complainTF{
            SymptopdayTF.becomeFirstResponder()
        }
        else if textField == SymptopdayTF{
            ProvideinfoTF.becomeFirstResponder()
        }
        else{
            view.endEditing(true)
        }
       return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.reloadInputViews()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == complainTF{
            let maxLength = 60
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
        
    }
}




extension DescribeSymptopsController
{
    func validate() -> (String?, Bool) {
     //   let name = NameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let complainTF = complainTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let SymptopdayTF = SymptopdayTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
      //  let ProvideinfoTF = ProvideinfoTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)

//        if name!.count  <= 2 {
//            return("Name is required.", false)
//        }
        
        if complainTF?.count == 0 {
            return("Complaint Field is required.", false)
        }
        if SymptopdayTF?.count == 0 {
            return("Symptoms start Field is required.", false)
        }
       
//        if getsymtopmsidlist <= 0
//        {
//            return("Symptop is required.", false)
//        }
//        if !Helper.validatePassword(passwordTF.text!) {
//            return("Please enter correct Password", false)
//        }
        return(nil,true)
    }
    
}


extension DescribeSymptopsController : UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == ProvideinfoTF{
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
              return newText.count <= 150
        }
       return true
    }
   
//    func textViewDidChange(descriptionField: UITextView) {
//
//        if descriptionField.text.isEmpty == false {
//            Provideinfotextfieldtitlelbl.text = ""
//        } else {
//            Provideinfotextfieldtitlelbl.text = ""
//        }
//    }
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//
//        if textView.text.isEmpty == false {
//            Provideinfotextfieldtitlelbl.text = ""
//        } else {
//            Provideinfotextfieldtitlelbl.text = " "
//        }
//    }
//
//
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//
////        if self.scrollview.frame.origin.y == 0 {
////            self.scrollview.frame.origin.y -= 300
////        }
//        return true
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//
////        if self.scrollview.frame.origin.y != 0 {
////            self.scrollview.frame.origin.y -= 0
////        }
//    }
    
}

extension DescribeSymptopsController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if datePicker == pickerView{
            return DateArray.count
        }else{
            return (getsymtopmslistsym.data?.count ?? 0)
        }
        
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if datePicker == pickerView{
            return "\(DateArray[row])"
        }else{
            return getsymtopmslistsym.data![row].name
        }
            
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if datePicker == pickerView{
            self.SymptopdayTF.text = "\(DateArray[row])"
        }else{
            
        }
    }
    
    
}

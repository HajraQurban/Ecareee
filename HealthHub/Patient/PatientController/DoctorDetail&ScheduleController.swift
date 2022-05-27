//
//  DoctorDetail&ScheduleController.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//
//The Next Detail Controller of Choose Doctor Page

import UIKit
import Cosmos
//import RSLoadingView
import Kingfisher

var slootid : Int = 0

class DoctorDetail_ScheduleController: UIViewController {

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
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
      //  btn.setTitle("Get Started", for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    lazy var headerLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 17)
        lbl.textColor = UIColor.white
        lbl.text = "Choose Slot"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var MonthYearView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DocTimeCV: UICollectionView = {
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
    
    
    lazy var DocIntroView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named:Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Doc1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var docnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 17)
        lbl.text = "Dr. Anna Nicholas"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SelectBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.isHidden = true
        btn.setImage(UIImage(named: "SelectIcon"), for: .normal)
        btn.addTarget(self, action: #selector(selectbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var hospitalnamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.font = regular(size: 12)
        lbl.text = "Pulmonologist | Queens Hospital"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var rattingView:CosmosView = {
        let rating = CosmosView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.backgroundColor = .clear
        rating.rating = 0
        rating.settings.updateOnTouch = false
        rating.settings.starSize = 18
        rating.settings.totalStars = 1
        rating.settings.starMargin = 3
        rating.settings.filledColor = UIColor(named: Colors.PrimaryAppColor1) ?? .gray
        rating.settings.emptyBorderColor = UIColor.lightGray
        rating.settings.emptyColor = .lightGray
        rating.settings.filledBorderColor = UIColor.orange
        return rating
    }()
    
    
    lazy var docrateLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 12)
        lbl.text = "4.5"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docreviewsLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 11)
        lbl.text = "230 Reviews"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    lazy var AboutdoctitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 13)
        lbl.text = "About doctor"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var AboutdocdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "She specializes in pulmonarty fibrosis, with more than 10 years experience at Mayo clinick, and a degree from John Hopkins"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var SpecialistdetailLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 16)
        lbl.text = "Specialisations/Services"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SpecialistcategoryTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    lazy var PatientReviewstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Patient Reviews"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SeeallreviewsBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.layer.shadowOpacity = 0
        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 14 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.PrimaryAppColor1)?.cgColor
        btn.titleLabel?.font = bold(size: 13)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.setTitle("See all Reviews", for: .normal)
        btn.addTarget(self, action: #selector(allreviewbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var PatientReviewTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
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
        lbl.font = bold(size: 15)
        lbl.text = "Choose Symptoms You Feel"
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
        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
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
    
    
    lazy var nospectitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font = semiBold(size: 15)
        lbl.text = "No Specialities"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var noreviewtitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font = semiBold(size: 14)
        lbl.text = "No Reviews Yet"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var dateofsel = ""
    
    var getdocspecialities = DoctoragainstSpecialityData()
    var getsubcatlist = Doctor()
    //DoctoragainstSpecialityData
 //   let loadingView = RSLoadingView()
    let manager = DoctoragtSpeciality()
    var doctor_id : Int = 0
    
    var date = ""
    var selectedTimeSlot = 0
    var specTVheight : NSLayoutConstraint?
    var revieTVHeight : NSLayoutConstraint?
  
    ///save the indexPath of last selected cell
    private var lastSelectedIndexPath = 0
    
    var TimeArray : [String] = ["09.00","11.30","13.00","15.00","18.00","19.00"]
    var DocTypeArray : [String] = ["Shortness of breath (dyspnea)","Sarcoidosis","Pneumania","Scleroderma","Systemic lupus erythematosus","Polymyositis"]
    
    var PatientImages = ["Doc1","Doc2","Doc2"]
    var PatientName : [String] = ["Joseph Hill","Laura Rashid","Lars Muellen"]
    var Patientrev : [String] = ["I love the doctor! She’s very petient in explnaing things and presenting benefits and sideffects of the treatments. She also presentedmultipel options.","Great job for Dr. Anna Nicholas!","We were looking for doctors who can help our 8 year old with a nasty pneumania, and we found Dr. Anna Nicholas on healthHUB. If ever needed, we will always go back to her."]
//    var tbr = CustomTabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.tintColor = .white
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        MonthYearView.isHidden = false
//        tbr.tabBarController?.tabBar.isHidden = true
        DocTimeCV.delegate = self
        DocTimeCV.dataSource = self
        DocTimeCV.register(DocTimeCVCell.self, forCellWithReuseIdentifier: DocTimeCVCell.identifier)
        DocTimeCV.allowsMultipleSelection = false

        SpecialistcategoryTV.delegate = self
        SpecialistcategoryTV.dataSource = self
        SpecialistcategoryTV.register(SpecialistDocTVCell.self, forCellReuseIdentifier: SpecialistDocTVCell.cellidentifier)
        
        PatientReviewTV.delegate = self
        PatientReviewTV.dataSource = self
        PatientReviewTV.register(PatientReviewsTVCell.self, forCellReuseIdentifier: PatientReviewsTVCell.cellidentifier)
        
        nospectitleLbl.isHidden = true
        noreviewtitleLbl.isHidden = true
        slootid = getdocspecialities.slots?.first?.id ?? 0
        setup()
        docdata()
        docagainstspecialitylist()
        DocTimeCV.reloadData()
    }
    
    
    func docdata(){
        
        docnameLbl.text = getsubcatlist.name
        hospitalnamelbl.text = "\(getsubcatlist.hospital_name ?? "") | \(getsubcatlist.category?.name ?? "")"
        AboutdocdescLbl.text = getsubcatlist.description
        //doctor_id =  getsubcatlist.doctor?.id!
     //   let doctorcategory = getsubcatlist.category
        doctor_id1 = getsubcatlist.id ?? 0
  //      cell.docimg.image = docImages[indexPath.row]
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + (getsubcatlist.url ?? ""))
        docimg.kf.setImage(with: url)
        
    }
    
    
    
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(scrollview)
        view.addSubview(MonthYearView)
        view.addSubview(headerView)
        
        headerView.addSubview(backBtn)
        headerView.addSubview(headerLbl)
        MonthYearView.addSubview(DocTimeCV)
       // view.addSubview(DocIntroView)
       
        scrollview.addSubview(containerView)
        containerView.addSubview(DocIntroView)
        DocIntroView.addSubview(docimg)
        DocIntroView.addSubview(docnameLbl)
        DocIntroView.addSubview(SelectBtn)
        DocIntroView.addSubview(hospitalnamelbl)
        DocIntroView.addSubview(docrateLbl)
        DocIntroView.addSubview(rattingView)
        DocIntroView.addSubview(docreviewsLbl)
        DocIntroView.addSubview(AboutdoctitleLbl)
        DocIntroView.addSubview(AboutdocdescLbl)
        containerView.addSubview(SpecialistdetailLbl)
        containerView.addSubview(SpecialistcategoryTV)
        containerView.addSubview(nospectitleLbl)

        
        containerView.addSubview(PatientReviewstitleLbl)
        containerView.addSubview(SeeallreviewsBtn)
        containerView.addSubview(PatientReviewTV)
        containerView.addSubview(noreviewtitleLbl)
        view.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
        self.specTVheight = SpecialistcategoryTV.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio)
        self.specTVheight?.isActive = true
        
        self.revieTVHeight = PatientReviewTV.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio)
        self.revieTVHeight?.isActive = true
        
        
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -48 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            MonthYearView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            MonthYearView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            MonthYearView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            MonthYearView.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            
            backBtn.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 52 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            headerLbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            headerLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            headerLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            DocTimeCV.bottomAnchor.constraint(equalTo: MonthYearView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            DocTimeCV.leadingAnchor.constraint(equalTo: MonthYearView.leadingAnchor,constant: 26 * appConstant.widthRatio),
            DocTimeCV.trailingAnchor.constraint(equalTo: MonthYearView.trailingAnchor,constant: -26 * appConstant.widthRatio),
            DocTimeCV.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: MonthYearView.bottomAnchor,constant: -36 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: buttonView.topAnchor,constant: -8 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

//
            DocIntroView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocIntroView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocIntroView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50 * appConstant.heightRatio),
            //Bottom of Containerview Remember
//            DocIntroView.heightAnchor.constraint(equalToConstant: 241 * appConstant.widthRatio),
            
            docimg.topAnchor.constraint(equalTo: DocIntroView.topAnchor, constant: 25 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: DocIntroView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            docnameLbl.topAnchor.constraint(equalTo: DocIntroView.topAnchor, constant: 17 * appConstant.heightRatio),
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            docnameLbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            
            SelectBtn.centerYAnchor.constraint(equalTo: docnameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SelectBtn.topAnchor.constraint(equalTo: DocIntroView.topAnchor, constant: 30 * appConstant.heightRatio),
            SelectBtn.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -22 * appConstant.widthRatio),
            SelectBtn.heightAnchor.constraint(equalToConstant: 4 * appConstant.heightRatio),
            
            hospitalnamelbl.topAnchor.constraint(equalTo: docnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            hospitalnamelbl.leadingAnchor.constraint(equalTo: docnameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            hospitalnamelbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            hospitalnamelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            rattingView.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            rattingView.leadingAnchor.constraint(equalTo: docnameLbl.leadingAnchor, constant: 0 * appConstant.widthRatio),
            rattingView.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            docrateLbl.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            docrateLbl.leadingAnchor.constraint(equalTo: rattingView.trailingAnchor, constant: 3.5 * appConstant.widthRatio),
            docrateLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
        
            docreviewsLbl.centerYAnchor.constraint(equalTo: docrateLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            docreviewsLbl.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            docreviewsLbl.leadingAnchor.constraint(equalTo: docrateLbl.trailingAnchor, constant: 11 * appConstant.widthRatio),
            docreviewsLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            AboutdoctitleLbl.topAnchor.constraint(equalTo: docimg.bottomAnchor, constant: 12 * appConstant.heightRatio),
            AboutdoctitleLbl.leadingAnchor.constraint(equalTo: DocIntroView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AboutdoctitleLbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            AboutdocdescLbl.topAnchor.constraint(equalTo: AboutdoctitleLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            AboutdocdescLbl.leadingAnchor.constraint(equalTo: DocIntroView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AboutdocdescLbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            AboutdocdescLbl.bottomAnchor.constraint(equalTo: DocIntroView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            

          //  AboutdocdescLbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            SpecialistdetailLbl.topAnchor.constraint(equalTo: DocIntroView.bottomAnchor, constant: 34 * appConstant.heightRatio),
            SpecialistdetailLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 21 * appConstant.widthRatio),
          //  SpecialistdetailLbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SpecialistdetailLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            SpecialistcategoryTV.topAnchor.constraint(equalTo: SpecialistdetailLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            SpecialistcategoryTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            SpecialistcategoryTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
//            SpecialistcategoryTV.heightAnchor.constraint(equalToConstant: 150 * appConstant.heightRatio),
            
            nospectitleLbl.centerXAnchor.constraint(equalTo: SpecialistcategoryTV.centerXAnchor, constant: 0),
            nospectitleLbl.centerYAnchor.constraint(equalTo: SpecialistcategoryTV.centerYAnchor, constant: 0),
            nospectitleLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),

            
            PatientReviewstitleLbl.topAnchor.constraint(equalTo: SpecialistcategoryTV.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PatientReviewstitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
          //  SpecialistdetailLbl.trailingAnchor.constraint(equalTo: DocIntroView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            PatientReviewstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
        //    SeeallreviewsBtn.centerYAnchor.constraint(equalTo: PatientReviewstitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SeeallreviewsBtn.topAnchor.constraint(equalTo: SpecialistcategoryTV.bottomAnchor, constant: 20 * appConstant.heightRatio),
            SeeallreviewsBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SeeallreviewsBtn.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            SeeallreviewsBtn.widthAnchor.constraint(equalToConstant: 167 * appConstant.heightRatio),

            PatientReviewTV.topAnchor.constraint(equalTo: SeeallreviewsBtn.bottomAnchor, constant: 8 * appConstant.heightRatio),
            PatientReviewTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PatientReviewTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            PatientReviewTV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4 * appConstant.heightRatio),
            
            noreviewtitleLbl.centerXAnchor.constraint(equalTo: PatientReviewTV.centerXAnchor, constant: 0),
            noreviewtitleLbl.centerYAnchor.constraint(equalTo: PatientReviewTV.centerYAnchor, constant: 0),
           

//            buttonView.topAnchor.constraint(equalTo: PatientReviewTV.bottomAnchor, constant: 5 * appConstant.heightRatio),
            buttonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            buttonView.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: -8 * appConstant.heightRatio),

          //  buttonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            
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
    

    
    @objc func backbtn_press(){
        self.navigationController?.popViewController(animated: true)

    }
    
    @objc func selectbtn_press(){
        
    }
    
    @objc func allreviewbtn_press(){
        
        let vc = SeeallPatientReviewsController()
        vc.modalPresentationStyle = .fullScreen
        vc.getdocspecialities = getdocspecialities
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nextBtn_press(){
        
        if slootid != 0
        {
            let vc = DescribeSymptopsController()
            vc.modalPresentationStyle = .fullScreen
            slotid = slootid
            let navController = UINavigationController(rootViewController: vc)
            navController.navigationBar.isHidden = true
            navController.navigationItem.backBarButtonItem?.isEnabled = false
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            alertWithMsg(vc: self, msg: "Pick up The Slot first", title: "Alert!")
        }
      //  self.navigationController?.pushViewController(DescribeSymptopsController(), animated: true)
    }
    
    
    func docagainstspecialitylist()
    {
      //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
       
    //    loadingView.show(on: view)
        
//        let parameters: [String: AnyObject] = [
//          "date" : dateofsel as AnyObject,
//          "doctor_id" : getsubcatlist.id as AnyObject,
//      ]
        
        ActivityIndicator.shared.showSpinner(onView: self.view)
        
        manager.docagainstspecialitylist(id: (getsubcatlist.id)!, date: dateofsel) { docdata,msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
           //     RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.status == "200"
                {
          //      RSLoadingView.hide(from: self.view)
                    self.getdocspecialities =  docdata!
                    slootid = self.getdocspecialities.slots?.first?.id ?? 0
                    self.SpecialistcategoryTV.reloadData()
                    self.PatientReviewTV.reloadData()
                    self.DocTimeCV.reloadData()
                }
                else
                {
//                RSLoadingView.hide(from: self.view)
           //     alertWithMsg(vc: self, msg: "No data", title: "Alert")
                }
            }
        }
    }

    
    
    
}


extension DoctorDetail_ScheduleController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let spec = getdocspecialities.slots else{
           
            return 0
        }
        return spec.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = DocTimeCV.dequeueReusableCell(withReuseIdentifier: DocTimeCVCell.identifier, for: indexPath) as! DocTimeCVCell

        if self.selectedTimeSlot !=  indexPath.row{
            cell.topView.backgroundColor = .white
            cell.selectLbl.textColor = UIColor(named: Colors.TextColor)
            slootid  = getdocspecialities.slots?[indexPath.row].id ?? 0
        }else{
            cell.topView.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
            cell.selectLbl.textColor = .white
        }
        cell.selectLbl.isUserInteractionEnabled  = true
        cell.selectLbl.text = (getdocspecialities.slots?[indexPath.row].start_time ?? "") + " - " +  (getdocspecialities.slots?[indexPath.row].end_time ?? "")
 
        
        return cell
    }
    
    ///UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        slootid = getdocspecialities.slots?[indexPath.row].id ?? 0
        self.selectedTimeSlot = indexPath.row
//        guard lastSelectedIndexPath != indexPath.row else { return }
//
////            if let index = lastSelectedIndexPath {
////            let cell = DocTimeCV.dequeueReusableCell(withReuseIdentifier: DocTimeCVCell.identifier, for: indexPath) as! DocTimeCVCell
////                cell.isSelected = false
////            }
////            docagainstspecialitylist()
////            date = TimeArray[indexPath.row]
//
//            let cell = DocTimeCV.dequeueReusableCell(withReuseIdentifier: DocTimeCVCell.identifier, for: indexPath) as! DocTimeCVCell
//                cell.isSelected = true
//        lastSelectedIndexPath = indexPath.row
//
        self.DocTimeCV.reloadData()
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      
//        let docslot = getdocspecialities.slots?[indexPath.row].start_time ?? "  00:00  "
//        let size: CGSize = String(docslot).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36.0 * appConstant.widthRatio)])
        return CGSize(width:( 120 * appConstant.widthRatio) , height: 50 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
        return 8 * appConstant.widthRatio
   }
    
}

extension DoctorDetail_ScheduleController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == SpecialistcategoryTV
        {
            guard let spec = getdocspecialities.speciality else{
                nospectitleLbl.isHidden = false
                return 0
            }
            if spec.count < 5{
                self.specTVheight?.isActive = false
                let height = (30 * appConstant.heightRatio ) * Double(spec.count)
                self.specTVheight = SpecialistcategoryTV.heightAnchor.constraint(equalToConstant: height +  10)
                self.specTVheight?.isActive = true
            }else{
                self.specTVheight?.isActive = false
                self.specTVheight = SpecialistcategoryTV.heightAnchor.constraint(equalToConstant: 160 * appConstant.heightRatio)
                self.specTVheight?.isActive = true
            }
            nospectitleLbl.isHidden = true
            
            return spec.count
        }
        else
        {
          //  return PatientName.count
            guard let spec = getdocspecialities.review else{
                noreviewtitleLbl.isHidden = false
                SeeallreviewsBtn.isHidden = true
                return 0
            }
            
            if spec.count == 0 {
                noreviewtitleLbl.isHidden = false
                SeeallreviewsBtn.isHidden = true
            }else{
                if spec.count >= 2{
                    noreviewtitleLbl.isHidden = true
                    SeeallreviewsBtn.isHidden = false
                    self.revieTVHeight?.isActive = false
                    self.revieTVHeight = PatientReviewTV.heightAnchor.constraint(equalToConstant: 170 * appConstant.heightRatio)
                    self.revieTVHeight?.isActive = true
                    return 2
                }else{
                    self.revieTVHeight?.isActive = false
                    self.revieTVHeight = PatientReviewTV.heightAnchor.constraint(equalToConstant: 350 * appConstant.heightRatio)
                    self.revieTVHeight?.isActive = true
                }
               
                noreviewtitleLbl.isHidden = true
                SeeallreviewsBtn.isHidden = false
            }
           
            return spec.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == SpecialistcategoryTV
        {
        let cell = SpecialistcategoryTV.dequeueReusableCell(withIdentifier: SpecialistDocTVCell.cellidentifier, for: indexPath) as! SpecialistDocTVCell
            let doctorspecialist = getdocspecialities.speciality?[indexPath.row]
            cell.doctypenameLbl.text = doctorspecialist?.name
        return cell
        }
        else if tableView == PatientReviewTV
        {
            let cell = PatientReviewTV.dequeueReusableCell(withIdentifier: PatientReviewsTVCell.cellidentifier, for: indexPath) as! PatientReviewsTVCell
            
            let doctorspecialreviewlist = getdocspecialities.review?[indexPath.row]
            let doctorspecialuserinfolist = getdocspecialities.review?[indexPath.row]
            

            cell.patnameLbl.text = doctorspecialuserinfolist?.user?.name
            
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
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
        else
        {
            let cell = PatientReviewTV.dequeueReusableCell(withIdentifier: PatientReviewsTVCell.cellidentifier, for: indexPath) as! PatientReviewsTVCell
            
            let doctorspecialreviewlist = getdocspecialities.review?[indexPath.row]
            let doctorspecialuserinfolist = getdocspecialities.review?[indexPath.row]
            
            
            cell.patnameLbl.text = doctorspecialuserinfolist?.user?.name
   
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == PatientReviewTV
        {
            return 165 * appConstant.heightRatio
        }
        else
        {
        return 30 * appConstant.heightRatio
        }
    }
    
}

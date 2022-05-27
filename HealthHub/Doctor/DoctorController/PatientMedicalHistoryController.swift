//
//  PatientHistoryDetailController.swift
//  HealthHub
//
//  Created by Hamza on 10/03/2022.
//

import UIKit

class PatientMedicalHistoryController: BaseController {
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.translatesAutoresizingMaskIntoConstraints = false
        
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        //        view.layer.cornerRadius  = 25 * appConstant.heightRatio
        //        view.layer.shadowColor = UIColor.black.cgColor
        //        view.layer.shadowOpacity = 0.25
        //        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        //        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var BackgroundHistorytitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Background History"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var DopatientsmokeView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Dopatientsmoketitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Do patient smoke?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Dopatientsmokeanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Yes"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientDiabtiesView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DopatientDiabtiestitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have diabetes? "
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientDiabtiesanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "No"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientasthmaView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Dopatientasthmatitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have asthma? "
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Dopatientasthmaanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "No"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientallergicView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Dopatientallergictitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient is allergic to something? "
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Dopatientallergicanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientDiabties2View : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DopatientDiabties2titlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient is allergic to something? "
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientDiabties2anslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientDiabtie2View : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DopatientDiabtie2titlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Is this patient analyzed with diabetes?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientDiabtie2anslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientHeartView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DopatientHearttitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have any heart related issues?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientHeartanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientKidneyView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DopatientKidneytitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have any kidney related issues?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientKidneyanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientarthisitView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Dopatientarthisittitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have arthiritis?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Dopatientarthisitanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatientpulmunaryView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Dopatientpulmunarytitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have a pulmonary issue?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Dopatientpulmunaryanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DopatienteatingdisorderView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Dopatienteatingdisordertitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Does this patient have a pulmonary issue?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Dopatienteatingdisorderanslbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "i Don't Know"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var SymptomstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Symptoms"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var symptopmsView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var PatientSymptomstitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 16)
        lbl.text = "Patient Symptoms"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var Patientillensstype: UICollectionView = {
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
    
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Back", for: .normal)
        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    var appointment = appointdata()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.tintColor = .white
        Patientillensstype.delegate = self
        Patientillensstype.dataSource = self
        Patientillensstype.register(DocTypeCVCell.self, forCellWithReuseIdentifier: DocTypeCVCell.identifier)
        
        headerLbl.text = "Patient Medical History"
        setupData()
        setup()
    }
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(BackgroundHistorytitleLbl)
        containerView.addSubview(DopatientsmokeView)
        DopatientsmokeView.addSubview(Dopatientsmoketitlelbl)
        DopatientsmokeView.addSubview(Dopatientsmokeanslbl)
        containerView.addSubview(DopatientDiabtiesView)
        DopatientDiabtiesView.addSubview(DopatientDiabtiestitlelbl)
        DopatientDiabtiesView.addSubview(DopatientDiabtiesanslbl)
        containerView.addSubview(DopatientasthmaView)
        DopatientasthmaView.addSubview(Dopatientasthmatitlelbl)
        DopatientasthmaView.addSubview(Dopatientasthmaanslbl)
        containerView.addSubview(DopatientallergicView)
        DopatientallergicView.addSubview(Dopatientallergictitlelbl)
        DopatientallergicView.addSubview(Dopatientallergicanslbl)
        containerView.addSubview(DopatientDiabtie2View)
        DopatientDiabtie2View.addSubview(DopatientDiabtie2titlelbl)
        DopatientDiabtie2View.addSubview(DopatientDiabtie2anslbl)
        containerView.addSubview(DopatientHeartView)
        DopatientHeartView.addSubview(DopatientHearttitlelbl)
        DopatientHeartView.addSubview(DopatientHeartanslbl)
        containerView.addSubview(DopatientKidneyView)
        DopatientKidneyView.addSubview(DopatientKidneytitlelbl)
        DopatientKidneyView.addSubview(DopatientKidneyanslbl)
        containerView.addSubview(DopatientarthisitView)
        DopatientarthisitView.addSubview(Dopatientarthisittitlelbl)
        DopatientarthisitView.addSubview(Dopatientarthisitanslbl)
        containerView.addSubview(DopatientpulmunaryView)
        DopatientpulmunaryView.addSubview(Dopatientpulmunarytitlelbl)
        DopatientpulmunaryView.addSubview(Dopatientpulmunaryanslbl)
        containerView.addSubview(SymptomstitleLbl)
        containerView.addSubview(symptopmsView)
        symptopmsView.addSubview(PatientSymptomstitleLbl)
        symptopmsView.addSubview(Patientillensstype)
        containerView.addSubview(HomeBtn)
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 2 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            //     containerView.heightAnchor.constraint(equalToConstant: 650 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            BackgroundHistorytitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20 * appConstant.heightRatio),
            BackgroundHistorytitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            BackgroundHistorytitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            DopatientsmokeView.topAnchor.constraint(equalTo: BackgroundHistorytitleLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            DopatientsmokeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientsmokeView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientsmokeView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Dopatientsmoketitlelbl.topAnchor.constraint(equalTo: DopatientsmokeView.topAnchor, constant: 8 * appConstant.heightRatio),
            Dopatientsmoketitlelbl.leadingAnchor.constraint(equalTo: DopatientsmokeView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientsmoketitlelbl.trailingAnchor.constraint(equalTo: DopatientsmokeView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            Dopatientsmoketitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            Dopatientsmokeanslbl.topAnchor.constraint(equalTo: Dopatientsmoketitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Dopatientsmokeanslbl.leadingAnchor.constraint(equalTo: DopatientsmokeView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientsmokeanslbl.trailingAnchor.constraint(equalTo: DopatientsmokeView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            Dopatientsmokeanslbl.bottomAnchor.constraint(equalTo: DopatientsmokeView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            DopatientDiabtiesView.topAnchor.constraint(equalTo: DopatientsmokeView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            DopatientDiabtiesView.leadingAnchor.constraint(equalTo: DopatientsmokeView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            DopatientDiabtiesView.trailingAnchor.constraint(equalTo: DopatientsmokeView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            DopatientDiabtiesView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            DopatientDiabtiestitlelbl.topAnchor.constraint(equalTo: DopatientDiabtiesView.topAnchor, constant: 8 * appConstant.heightRatio),
            DopatientDiabtiestitlelbl.leadingAnchor.constraint(equalTo: DopatientDiabtiesView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientDiabtiestitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DopatientDiabtiesanslbl.topAnchor.constraint(equalTo: DopatientDiabtiestitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            DopatientDiabtiesanslbl.leadingAnchor.constraint(equalTo: DopatientDiabtiesView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientDiabtiesanslbl.trailingAnchor.constraint(equalTo: DopatientDiabtiesView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            DopatientDiabtiesanslbl.bottomAnchor.constraint(equalTo: DopatientDiabtiesView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            
            DopatientasthmaView.topAnchor.constraint(equalTo: DopatientDiabtiesView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientasthmaView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientasthmaView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientasthmaView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Dopatientasthmatitlelbl.topAnchor.constraint(equalTo: DopatientasthmaView.topAnchor, constant: 8 * appConstant.heightRatio),
            Dopatientasthmatitlelbl.leadingAnchor.constraint(equalTo: DopatientasthmaView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientasthmatitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            Dopatientasthmaanslbl.topAnchor.constraint(equalTo: Dopatientasthmatitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Dopatientasthmaanslbl.leadingAnchor.constraint(equalTo: DopatientasthmaView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientasthmaanslbl.trailingAnchor.constraint(equalTo: DopatientasthmaView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            Dopatientasthmaanslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DopatientallergicView.topAnchor.constraint(equalTo: DopatientasthmaView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientallergicView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientallergicView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientallergicView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Dopatientallergictitlelbl.topAnchor.constraint(equalTo: DopatientallergicView.topAnchor, constant: 8 * appConstant.heightRatio),
            Dopatientallergictitlelbl.leadingAnchor.constraint(equalTo: DopatientallergicView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientallergictitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            Dopatientallergicanslbl.topAnchor.constraint(equalTo: Dopatientallergictitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Dopatientallergicanslbl.leadingAnchor.constraint(equalTo: DopatientallergicView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientallergicanslbl.trailingAnchor.constraint(equalTo: DopatientallergicView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            Dopatientallergicanslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DopatientDiabtie2View.topAnchor.constraint(equalTo: DopatientallergicView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientDiabtie2View.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientDiabtie2View.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientDiabtie2View.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            DopatientDiabtie2titlelbl.topAnchor.constraint(equalTo: DopatientDiabtie2View.topAnchor, constant: 8 * appConstant.heightRatio),
            DopatientDiabtie2titlelbl.leadingAnchor.constraint(equalTo: DopatientDiabtie2View.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientDiabtie2titlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            DopatientDiabtie2anslbl.topAnchor.constraint(equalTo: DopatientDiabtie2titlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            DopatientDiabtie2anslbl.leadingAnchor.constraint(equalTo: DopatientDiabtie2View.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientDiabtie2anslbl.trailingAnchor.constraint(equalTo: DopatientDiabtie2View.trailingAnchor, constant: -20 * appConstant.heightRatio),
            DopatientDiabtie2anslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DopatientHeartView.topAnchor.constraint(equalTo: DopatientDiabtie2View.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientHeartView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientHeartView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientHeartView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            DopatientHearttitlelbl.topAnchor.constraint(equalTo: DopatientHeartView.topAnchor, constant: 8 * appConstant.heightRatio),
            DopatientHearttitlelbl.leadingAnchor.constraint(equalTo: DopatientHeartView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientHearttitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            DopatientHeartanslbl.topAnchor.constraint(equalTo: DopatientHearttitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            DopatientHeartanslbl.leadingAnchor.constraint(equalTo: DopatientHeartView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientHeartanslbl.trailingAnchor.constraint(equalTo: DopatientHeartView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            DopatientHeartanslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            DopatientKidneyView.topAnchor.constraint(equalTo: DopatientDiabtie2View.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientKidneyView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientKidneyView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientKidneyView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            DopatientKidneytitlelbl.topAnchor.constraint(equalTo: DopatientKidneyView.topAnchor, constant: 8 * appConstant.heightRatio),
            DopatientKidneytitlelbl.leadingAnchor.constraint(equalTo: DopatientKidneyView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientKidneytitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            DopatientKidneyanslbl.topAnchor.constraint(equalTo: DopatientKidneytitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            DopatientKidneyanslbl.leadingAnchor.constraint(equalTo: DopatientKidneyView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DopatientKidneyanslbl.trailingAnchor.constraint(equalTo: DopatientKidneyView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            DopatientKidneyanslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            DopatientarthisitView.topAnchor.constraint(equalTo: DopatientKidneyView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientarthisitView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientarthisitView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientarthisitView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Dopatientarthisittitlelbl.topAnchor.constraint(equalTo: DopatientarthisitView.topAnchor, constant: 8 * appConstant.heightRatio),
            Dopatientarthisittitlelbl.leadingAnchor.constraint(equalTo: DopatientarthisitView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientarthisittitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            Dopatientarthisitanslbl.topAnchor.constraint(equalTo: Dopatientarthisittitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Dopatientarthisitanslbl.leadingAnchor.constraint(equalTo: DopatientarthisitView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientarthisitanslbl.trailingAnchor.constraint(equalTo: DopatientarthisitView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            Dopatientarthisitanslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            DopatientpulmunaryView.topAnchor.constraint(equalTo: DopatientarthisitView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DopatientpulmunaryView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DopatientpulmunaryView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DopatientpulmunaryView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Dopatientpulmunarytitlelbl.topAnchor.constraint(equalTo: DopatientpulmunaryView.topAnchor, constant: 8 * appConstant.heightRatio),
            Dopatientpulmunarytitlelbl.leadingAnchor.constraint(equalTo: DopatientpulmunaryView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientpulmunarytitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            Dopatientpulmunaryanslbl.topAnchor.constraint(equalTo: Dopatientpulmunarytitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Dopatientpulmunaryanslbl.leadingAnchor.constraint(equalTo: DopatientpulmunaryView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Dopatientpulmunaryanslbl.trailingAnchor.constraint(equalTo: DopatientpulmunaryView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            Dopatientpulmunaryanslbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            SymptomstitleLbl.topAnchor.constraint(equalTo: DopatientpulmunaryView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            SymptomstitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            SymptomstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            symptopmsView.topAnchor.constraint(equalTo: SymptomstitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            symptopmsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            symptopmsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            symptopmsView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            PatientSymptomstitleLbl.topAnchor.constraint(equalTo: symptopmsView.topAnchor, constant: 8 * appConstant.heightRatio),
            PatientSymptomstitleLbl.leadingAnchor.constraint(equalTo: symptopmsView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PatientSymptomstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            Patientillensstype.topAnchor.constraint(equalTo: PatientSymptomstitleLbl.bottomAnchor, constant: 8 * appConstant.heightRatio),
            Patientillensstype.leadingAnchor.constraint(equalTo: symptopmsView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            Patientillensstype.trailingAnchor.constraint(equalTo: symptopmsView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            Patientillensstype.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            HomeBtn.topAnchor.constraint(equalTo: SymptomstitleLbl.topAnchor, constant: 0 * appConstant.heightRatio),
            HomeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            HomeBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            
            HomeBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            HomeBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30 * appConstant.heightRatio ),
            //
            
        ])
    }
    
    
    func setupData(){
        self.Dopatientsmokeanslbl.text = appointment.smoke
        self.DopatientDiabtiesanslbl.text = appointment.diabetes
        self.Dopatientasthmaanslbl.text = appointment.asthma
        self.Dopatientallergicanslbl.text = appointment.allergic
        self.DopatientDiabtie2anslbl.text = appointment.diagnosed_diabetes
        self.DopatientHeartanslbl.text = appointment.diagnosed_heart
        self.DopatientKidneyanslbl.text = appointment.diagnosed_kidney
        self.Dopatientarthisitanslbl.text = appointment.diagnosed_arthritis
        self.Dopatientpulmunaryanslbl.text = appointment.diagnosed_pulmonary
        self.Dopatienteatingdisorderanslbl.text = appointment.diagnosed_eating
        
        self.symptopmsView.isHidden  = true
        self.SymptomstitleLbl.isHidden  = true
    }
   
    
    @objc func homebtn_press(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension PatientMedicalHistoryController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = Patientillensstype.dequeueReusableCell(withReuseIdentifier: DocTypeCVCell.identifier, for: indexPath) as! DocTypeCVCell
        
        
        //        cell.illnesstitlelbl.text = getsubcatlist.illness![indexPath.row].name
        //    cell.backgroundColor = .filterUnSelect
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    //    func collectionView(_ collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    //
    //
    ////        let size: CGSize = getsubcatlist.illness![indexPath.row].name!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.0 * appConstant.widthRatio)])
    ////        return CGSize(width:(size.width + 20 * appConstant.heightRatio) , height: 30 * appConstant.heightRatio)
    //        return 0.0
    //
    //    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8 * appConstant.widthRatio
        
    }
    
    
}

//
//  SymptopPainareaController.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

import UIKit
import Foundation


class SymptopPainareaController: UIViewController, UIPopoverPresentationControllerDelegate {

    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
         view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
      //  btn.setTitle("Get Started", for: .normal)
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
        view.backgroundColor = UIColor.black
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
        lbl.font = medium(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Choose problem area"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    //Image of Getting the pain Area Symptom
    lazy var Imagelog: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Sample2")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    //Pain Head Area Button
    lazy var selectheadBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectheadBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Chest Pain Area Button
    lazy var selectchestBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectchestBtn_press), for: .touchUpInside)
        return btn
    }()
    
    //Stomach Pain Area Button
    lazy var selectstomatchBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectstomachBtn_press), for: .touchUpInside)
        return btn
    }()
    
    //Abadomen Pain Area Button
    lazy var selectAbadomenBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectAbadomenBtn_press), for: .touchUpInside)
        return btn
    }()
    
    //Thoart Pain Area Button
    lazy var selectthoartBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectthoartBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Shoulder Pain Area Button
    lazy var selectsoulder1Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectsoulder1Btn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Shoulder Pain Area Button
    lazy var selectsoulder2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectsoulder1Btn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //left Shoulder Pain Area Button
    lazy var selectleftsoulder2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectsoulder1Btn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Shoulder Pain Area Button
    lazy var selectrightsoulder2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectsoulder1Btn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Arm Pain Area Button
    lazy var selectleftarm2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectright1Btn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Arm elbow Pain Area Button
    lazy var selectleftarmElbow2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectleftarmBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Hand Pain Area Button
    lazy var selectlefthand2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectlefthandBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Arm Pain Area Button
    lazy var selectrightarm2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectright1Btn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Arm elbow Pain Area Button
    lazy var selectrightarmElbow2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectleftarmBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Hand Pain Area Button
    lazy var selectrighthand2Btn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectlefthandBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Thigh Pain Area Button
    lazy var selectrightThighBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectrightthighBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Thigh Pain Area Button
    lazy var selectleftThighBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectrightthighBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Knee Pain Area Button
    lazy var selectrightKneeBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectrightKneeBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Knee Pain Area Button
    lazy var selectleftKneeBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectrightKneeBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    //Right Calf Pain Area Button
    lazy var selectrightCalfBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectCalfBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Calf Pain Area Button
    lazy var selectleftCalfBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectCalfBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Leg Pain Area Button
    lazy var selectrightLegBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectLegBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Leg Pain Area Button
    lazy var selectleftLegBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectLegBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Foot Pain Area Button
    lazy var selectrightFootBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectFootBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Foot Pain Area Button
    lazy var selectleftFootBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(selectFootBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Right Toe Pain Area Button
    lazy var selectrightToeBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
//        btn.addTarget(self, action: #selector(selectFootBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //Left Toe Pain Area Button
    lazy var selectleftToeBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.clear
//        btn.addTarget(self, action: #selector(selectFootBtn_press), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        gesture.numberOfTapsRequired = 1
        Imagelog.isUserInteractionEnabled = true
        Imagelog.addGestureRecognizer(gesture)
        
        view.backgroundColor = .white
        setup()
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
        
        view.addSubview(chooseSymptoptitleLbl1)
       
        view.addSubview(Imagelog)
        view.addSubview(selectheadBtn)
        view.addSubview(selectthoartBtn)
        view.addSubview(selectsoulder1Btn)
        view.addSubview(selectsoulder2Btn)
        view.addSubview(selectleftsoulder2Btn)
        view.addSubview(selectrightsoulder2Btn)
        view.addSubview(selectleftarm2Btn)
        view.addSubview(selectleftarmElbow2Btn)
        view.addSubview(selectlefthand2Btn)
        
        view.addSubview(selectrightarm2Btn)
        view.addSubview(selectrightarmElbow2Btn)
        view.addSubview(selectrighthand2Btn)
        view.addSubview(selectchestBtn)
        view.addSubview(selectstomatchBtn)
        view.addSubview(selectAbadomenBtn)
        
        view.addSubview(selectrightThighBtn)
        view.addSubview(selectleftThighBtn)
        view.addSubview(selectrightKneeBtn)
        view.addSubview(selectleftKneeBtn)
        view.addSubview(selectrightCalfBtn)
        view.addSubview(selectleftCalfBtn)
        view.addSubview(selectrightLegBtn)
        view.addSubview(selectleftLegBtn)
        view.addSubview(selectrightFootBtn)
        view.addSubview(selectleftFootBtn)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -50 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            
            headerView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
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
            
            chooseSymptoptitleLbl1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52 * appConstant.heightRatio),

            chooseSymptoptitleLbl1.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            
            
            selectheadBtn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 90 * appConstant.heightRatio),
            selectheadBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 165 * appConstant.widthRatio),
            selectheadBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -165 * appConstant.widthRatio),
            selectheadBtn.heightAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            selectthoartBtn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 160 * appConstant.heightRatio),
            selectthoartBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 165 * appConstant.widthRatio),
            selectthoartBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -165 * appConstant.widthRatio),
            selectthoartBtn.heightAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
            
            selectsoulder1Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 185 * appConstant.heightRatio),
            selectsoulder1Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110 * appConstant.widthRatio),
            selectsoulder1Btn.widthAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            selectsoulder1Btn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            selectleftsoulder2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 215 * appConstant.heightRatio),
            selectleftsoulder2Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 105 * appConstant.widthRatio),
            selectleftsoulder2Btn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectleftsoulder2Btn.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
            
            selectleftarm2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 305 * appConstant.heightRatio),
            selectleftarm2Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80 * appConstant.widthRatio),
            selectleftarm2Btn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectleftarm2Btn.heightAnchor.constraint(equalToConstant: 70 * appConstant.heightRatio),
            
            
            selectleftarmElbow2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 285 * appConstant.heightRatio),
            selectleftarmElbow2Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100 * appConstant.widthRatio),
            selectleftarmElbow2Btn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectleftarmElbow2Btn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            selectlefthand2Btn.topAnchor.constraint(equalTo: selectleftarm2Btn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            selectlefthand2Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80 * appConstant.widthRatio),
            selectlefthand2Btn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            selectlefthand2Btn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            
            selectsoulder2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 185 * appConstant.heightRatio),
            selectsoulder2Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110 * appConstant.widthRatio),
            selectsoulder2Btn.widthAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            selectsoulder2Btn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            selectrightsoulder2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 215 * appConstant.heightRatio),
            selectrightsoulder2Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -105 * appConstant.widthRatio),
            selectrightsoulder2Btn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectrightsoulder2Btn.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
            selectrightarm2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 305 * appConstant.heightRatio),
            selectrightarm2Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80 * appConstant.widthRatio),
            selectrightarm2Btn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectrightarm2Btn.heightAnchor.constraint(equalToConstant: 70 * appConstant.heightRatio),
            
            selectrightarmElbow2Btn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 285 * appConstant.heightRatio),
            selectrightarmElbow2Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100 * appConstant.widthRatio),
            selectrightarmElbow2Btn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectrightarmElbow2Btn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            selectrighthand2Btn.topAnchor.constraint(equalTo: selectrightarm2Btn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            selectrighthand2Btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80 * appConstant.widthRatio),
            selectrighthand2Btn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            selectrighthand2Btn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            
            selectchestBtn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 220 * appConstant.heightRatio),
            selectchestBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130 * appConstant.widthRatio),
            selectchestBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130 * appConstant.widthRatio),
            selectchestBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            
            selectstomatchBtn.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 250 * appConstant.heightRatio),
            selectstomatchBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150 * appConstant.widthRatio),
            selectstomatchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150 * appConstant.widthRatio),
            selectstomatchBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            
            selectAbadomenBtn.topAnchor.constraint(equalTo: selectstomatchBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            selectAbadomenBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150 * appConstant.widthRatio),
            selectAbadomenBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150 * appConstant.widthRatio),
            selectAbadomenBtn.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            //
            selectrightThighBtn.topAnchor.constraint(equalTo: selectstomatchBtn.bottomAnchor, constant: 90 * appConstant.heightRatio),
            selectrightThighBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -135 * appConstant.widthRatio),
            selectrightThighBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            selectrightThighBtn.heightAnchor.constraint(equalToConstant: 70 * appConstant.heightRatio),
            
            selectleftThighBtn.topAnchor.constraint(equalTo: selectstomatchBtn.bottomAnchor, constant: 90 * appConstant.heightRatio),
            selectleftThighBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135 * appConstant.widthRatio),
            selectleftThighBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            selectleftThighBtn.heightAnchor.constraint(equalToConstant: 70 * appConstant.heightRatio),
            
            //
            selectrightKneeBtn.topAnchor.constraint(equalTo: selectrightThighBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            selectrightKneeBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -135 * appConstant.widthRatio),
            selectrightKneeBtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            selectrightKneeBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            selectleftKneeBtn.topAnchor.constraint(equalTo: selectleftThighBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            selectleftKneeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135 * appConstant.widthRatio),
            selectleftKneeBtn.widthAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            selectleftKneeBtn.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            //
            selectrightCalfBtn.topAnchor.constraint(equalTo: selectrightKneeBtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            selectrightCalfBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160 * appConstant.widthRatio),
            selectrightCalfBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            selectrightCalfBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            selectleftCalfBtn.topAnchor.constraint(equalTo: selectleftKneeBtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
            selectleftCalfBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160 * appConstant.widthRatio),
            selectleftCalfBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            selectleftCalfBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            
            //
            selectrightLegBtn.topAnchor.constraint(equalTo: selectrightKneeBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            selectrightLegBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140 * appConstant.widthRatio),
            selectrightLegBtn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectrightLegBtn.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
            selectleftLegBtn.topAnchor.constraint(equalTo: selectleftKneeBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            selectleftLegBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140 * appConstant.widthRatio),
            selectleftLegBtn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectleftLegBtn.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
            //
            selectrightFootBtn.topAnchor.constraint(equalTo: selectrightLegBtn.bottomAnchor, constant: 15 * appConstant.heightRatio),
            selectrightFootBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -140 * appConstant.widthRatio),
            selectrightFootBtn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectrightFootBtn.heightAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            
            selectleftFootBtn.topAnchor.constraint(equalTo: selectleftLegBtn.bottomAnchor, constant: 15 * appConstant.heightRatio),
            selectleftFootBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140 * appConstant.widthRatio),
            selectleftFootBtn.widthAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            selectleftFootBtn.heightAnchor.constraint(equalToConstant: 25 * appConstant.heightRatio),
            
            

            Imagelog.topAnchor.constraint(equalTo: chooseSymptoptitleLbl1.bottomAnchor, constant: 12 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            Imagelog.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 * appConstant.heightRatio),
            Imagelog.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30 * appConstant.heightRatio),
            Imagelog.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66)

            
            
            
            
            
            ])
                
    }
    
    @objc func backbtn_press(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //Pain Chest Area Button
    @objc func selectchestBtn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
         selectchestBtn.setTitleColor(.white, for: .normal)
          let popoverVC =  AdddeasesPopupController()
          
          popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)

        popoverVC.modalPresentationStyle = .popover

//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)


          self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Pain Stomach Area Button
    @objc func selectstomachBtn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
         selectstomatchBtn.setTitleColor(.white, for: .normal)
          let popoverVC =  StomachPainPopUpController()
          
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)

        popoverVC.modalPresentationStyle = .popover

//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Pain Abadomen Area Button
    @objc func selectAbadomenBtn_press(_ sender:UIButton){

        let popoverVC =  SelectAbadomenPainPopUpController()
          
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)

        popoverVC.modalPresentationStyle = .popover

//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Pain Thoart Area Button
    @objc func selectthoartBtn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
        selectthoartBtn.setTitleColor(.white, for: .normal)
        let popoverVC =  NeckPainPopupController()
          
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)

        popoverVC.modalPresentationStyle = .popover

//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Pain Head Area Button
    @objc func selectheadBtn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
        selectheadBtn.setTitleColor(.white, for: .normal)
        let popoverVC =  HeadPainPopUpController()
          
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)

        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    
    //Shoulder Pain Area Button
    @objc func selectsoulder1Btn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
        selectsoulder1Btn.setTitleColor(.white, for: .normal)
        let popoverVC =  ShoulderPainPopUpController()
    
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        popoverVC.popoverPresentationController?.delegate = self
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)
        
        self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Right Arm Elbow Pain Area Button
    @objc func selectright1Btn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
        selectsoulder1Btn.setTitleColor(.white, for: .normal)
        let popoverVC =  ShoulderArmPainPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Right Arm Elbow Pain Area Button
    @objc func selectleftarmBtn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
        selectsoulder1Btn.setTitleColor(.white, for: .normal)
        let popoverVC =  ElbowPainPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    
    //Right Hand Pain Area Button
    @objc func selectlefthandBtn_press(_ sender:UIButton){

        //  ChatBtn.backgroundColor = .selectedBtn
        selectsoulder1Btn.setTitleColor(.white, for: .normal)
        let popoverVC =  HandPainPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)

    }
    
    //Right Thigh Pain Area Button
    @objc func selectrightthighBtn_press(_ sender:UIButton){

       
        let popoverVC =  SelectRightThighPainPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)
       

    }
    
    //
    //Right Knee Pain Area Button
    @objc func selectrightKneeBtn_press(_ sender:UIButton){

       
        let popoverVC =  SelectKneePainPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)
       
       

    }
    
    //Calf Pain Area Button
    @objc func selectCalfBtn_press(_ sender:UIButton){

       
        let popoverVC =  SelectCalfPainPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)
       
       

    }
    
    //Leg Pain Area Button
    @objc func selectLegBtn_press(_ sender:UIButton){

       
        let popoverVC =  SelectPainLegPopUpController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)
       
       

    }
    
    
    //Foot Pain Area Button
    @objc func selectFootBtn_press(_ sender:UIButton){

       
        let popoverVC =  SelectFootPainPopupController()
        popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
        popoverVC.modalPresentationStyle = .popover
//          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        popoverVC.popoverPresentationController?.delegate = self
          
        popoverVC.popoverPresentationController?.sourceView = self.Imagelog
        popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)

        self.present(popoverVC, animated: true, completion: nil)
       
       

    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
          
          return UIModalPresentationStyle.none
          
      }
    
    @objc func tapped(gesture:UITapGestureRecognizer) {
        let point = gesture.location(in: Imagelog)
        
      //  print("The Throat apin Area\(point)")
      //  self.tappedCallback(point, 1)
      
        let xpoint = Int(point.x)
        let ypoint = Int(point.y)
        
        print(xpoint)
        print(ypoint)
        
//
//        if (xpoint == 170) && (ypoint == 95) || (xpoint == 159) && (ypoint == 84) || (xpoint == 171) && (ypoint == 86) || (xpoint == 172) && (ypoint == 87) || (xpoint == 184) && (ypoint == 89 || (xpoint == 162) && (ypoint == 85)) || (xpoint == 164) && (ypoint == 93) || (xpoint == 181) && (ypoint == 92)
//        {
//            print("The point of Throat pain Area")
//            let popoverVC =  AdddeasesPopupController()
//
//            popoverVC.preferredContentSize = CGSize(width: 341.0 * appConstant.heightRatio , height: 304 * appConstant.widthRatio)
//
//          popoverVC.modalPresentationStyle = .popover
//
//  //          popoverVC.popoverPresentationController?.permittedArrowDirections = .up
//
//
//          popoverVC.popoverPresentationController?.delegate = self
//
//          popoverVC.popoverPresentationController?.sourceView = self.Imagelog
//          popoverVC.popoverPresentationController?.sourceRect = CGRect(x: self.view.center.x, y: self.view.center.y ,width: 0,height: 0)
//
//
//            self.present(popoverVC, animated: true, completion: nil)
//        }
//        else if (xpoint == 92) && (ypoint == 133) || (xpoint == 96) && (ypoint == 145) || (xpoint == 96) && (ypoint == 149) || (xpoint == 101) && (ypoint == 147) || (xpoint == 89) && (ypoint == 155) || (xpoint == 89) && (ypoint == 130) || (xpoint == 110) && (ypoint == 160) || (xpoint == 87) && (ypoint == 171) || (xpoint == 91) && (ypoint == 177)
//        {
//            print("The point of Shoulder pain Area")
//
//        }
//        else
//        {
//
//        }
//
        
    }


    
}


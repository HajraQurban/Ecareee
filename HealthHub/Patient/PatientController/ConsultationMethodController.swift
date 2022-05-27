//
//  ConsultationMethodController.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

import UIKit

protocol PoptheVcdelegate
{
    func SetClear()
}

var slotid = 0
var appointtype = ""

class ConsultationMethodController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.isScrollEnabled = false
        SV.translatesAutoresizingMaskIntoConstraints = false
        
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
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
        btn.layer.shadowColor = UIColor.clear.cgColor
      //  btn.setTitle("Get Started", for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var FirstIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Num2")
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
        lbl.text = "Method"
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
        iv.image = UIImage(named: "DNum3")
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
        lbl.text = "Payment"
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
        iv.image = UIImage(named: "DNum4")
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
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "You can choose the way you meet and consult with your doctor"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var CallbtnView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 36 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Callimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "CalIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor.white
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var CalltitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Call"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var CallBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        //  btn.setImage(UIImage(named: "SelectIcon"), for: .normal)
        btn.addTarget(self, action: #selector(callbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var Calldesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "You can talk with your selected doctor via Video call"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var ChatbtnView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.layer.cornerRadius = 36 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Chatimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "ChattingIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var ChattitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Chat"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ChatBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
     //   btn.setImage(UIImage(named: "SelectIcon"), for: .normal)
        btn.addTarget(self, action: #selector(Chatbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var Chatdesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "You can talk with your selected doctor via chat"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var InbtnView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.layer.cornerRadius = 36 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Inimg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Calendar")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var IntitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "In person"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var InBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
     //   btn.setImage(UIImage(named: "SelectIcon"), for: .normal)
        btn.addTarget(self, action: #selector(selectbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var Indesclbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "book a personal meeting with your selected doctor."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
//        view.layer.borderWidth = 1
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
        lbl.text = "Choose Payment"
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
    
    var delegate : PoptheVcdelegate?
    
    var EmerData = symptopdata
    let manager = PostSypmtopsDataManager()
    
    var datePicker = UIPickerView()
    var DateArray = ["1 day","2 day","3 day","4 day","5 day","6 day","7 day","8 day","9 day","10 day","11 day","12 day","13 day","14 day","15 day","16 day","7 day","18 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day","1 day"]
    var toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        setup()
        callbtn_press()
        //Setting The UserDefault Save Data Into The Global Object.
        AssignDataToBackgroundHistory()
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
        
        view.addSubview(scrollview)
        scrollview.addSubview(containerView)
        
        containerView.addSubview(chooseSymptoptitleLbl1)
        containerView.addSubview(CallbtnView)
        containerView.addSubview(CallBtn)
        containerView.addSubview(Callimg)
        containerView.addSubview(CalltitleLbl)
        containerView.addSubview(Calldesclbl)
        
        containerView.addSubview(ChatbtnView)
        containerView.addSubview(ChatBtn)
        containerView.addSubview(Chatimg)
        containerView.addSubview(ChattitleLbl)
        containerView.addSubview(Chatdesclbl)
        
        containerView.addSubview(InbtnView)
        containerView.addSubview(InBtn)
        containerView.addSubview(Inimg)
        containerView.addSubview(IntitleLbl)
        containerView.addSubview(Indesclbl)
        
        containerView.addSubview(buttonView)
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
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 30 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),

            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor, constant: 0 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            
            chooseSymptoptitleLbl1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -52 * appConstant.heightRatio),
            chooseSymptoptitleLbl1.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            CallbtnView.topAnchor.constraint(equalTo: chooseSymptoptitleLbl1.bottomAnchor, constant: 20 * appConstant.heightRatio),
            CallbtnView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            CallbtnView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            CallbtnView.heightAnchor.constraint(equalToConstant: 142 * appConstant.heightRatio),
            
            Callimg.topAnchor.constraint(equalTo: CallbtnView.topAnchor, constant: 52 * appConstant.heightRatio),
            Callimg.leadingAnchor.constraint(equalTo: CallbtnView.leadingAnchor, constant: 30 * appConstant.heightRatio),
            Callimg.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            Callimg.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),

            
            
            CalltitleLbl.topAnchor.constraint(equalTo: CallbtnView.topAnchor, constant: 36 * appConstant.heightRatio),
            CalltitleLbl.leadingAnchor.constraint(equalTo: Callimg.trailingAnchor, constant: 34 * appConstant.heightRatio),
            CalltitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            
            Calldesclbl.topAnchor.constraint(equalTo: CalltitleLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Calldesclbl.leadingAnchor.constraint(equalTo: Callimg.trailingAnchor, constant: 34 * appConstant.heightRatio),
            Calldesclbl.trailingAnchor.constraint(equalTo: CallbtnView.trailingAnchor, constant: -34 * appConstant.heightRatio),
            Calldesclbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            
            CallBtn.topAnchor.constraint(equalTo: CallbtnView.topAnchor, constant: 0 * appConstant.heightRatio),
            CallBtn.leadingAnchor.constraint(equalTo: CallbtnView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            CallBtn.trailingAnchor.constraint(equalTo: CallbtnView.trailingAnchor, constant: -0 * appConstant.heightRatio),
            CallBtn.bottomAnchor.constraint(equalTo: CallbtnView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            
            ChatbtnView.topAnchor.constraint(equalTo: CallbtnView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            ChatbtnView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            ChatbtnView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            ChatbtnView.heightAnchor.constraint(equalToConstant: 142 * appConstant.heightRatio),
            
            
            Chatimg.topAnchor.constraint(equalTo: ChatbtnView.topAnchor, constant: 52 * appConstant.heightRatio),

            Chatimg.leadingAnchor.constraint(equalTo: ChatbtnView.leadingAnchor, constant: 30 * appConstant.heightRatio),
            Chatimg.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            Chatimg.widthAnchor.constraint(equalToConstant: 48 * appConstant.widthRatio),
            
            
            ChattitleLbl.topAnchor.constraint(equalTo: ChatbtnView.topAnchor, constant: 36 * appConstant.heightRatio),

            ChattitleLbl.leadingAnchor.constraint(equalTo: Chatimg.trailingAnchor, constant: 34 * appConstant.heightRatio),
            ChattitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            
            Chatdesclbl.topAnchor.constraint(equalTo: ChattitleLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Chatdesclbl.leadingAnchor.constraint(equalTo: Chatimg.trailingAnchor, constant: 34 * appConstant.heightRatio),
            Chatdesclbl.trailingAnchor.constraint(equalTo: ChatbtnView.trailingAnchor, constant: -34 * appConstant.heightRatio),
            Chatdesclbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            ChatBtn.topAnchor.constraint(equalTo: ChatbtnView.topAnchor, constant: 0 * appConstant.heightRatio),
            ChatBtn.leadingAnchor.constraint(equalTo: ChatbtnView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            ChatBtn.trailingAnchor.constraint(equalTo: ChatbtnView.trailingAnchor, constant: -0 * appConstant.heightRatio),
            ChatBtn.bottomAnchor.constraint(equalTo: ChatbtnView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            
            
            //
            InbtnView.topAnchor.constraint(equalTo: ChatbtnView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            InbtnView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            InbtnView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            InbtnView.heightAnchor.constraint(equalToConstant: 142 * appConstant.heightRatio),
            
            
            Inimg.topAnchor.constraint(equalTo: InbtnView.topAnchor, constant: 52 * appConstant.heightRatio),
            Inimg.leadingAnchor.constraint(equalTo: InbtnView.leadingAnchor, constant: 30 * appConstant.heightRatio),
            Inimg.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            Inimg.widthAnchor.constraint(equalToConstant: 48 * appConstant.widthRatio),
            
            
            IntitleLbl.topAnchor.constraint(equalTo: InbtnView.topAnchor, constant: 36 * appConstant.heightRatio),
            IntitleLbl.leadingAnchor.constraint(equalTo: Inimg.trailingAnchor, constant: 34 * appConstant.heightRatio),
            IntitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            
            Indesclbl.topAnchor.constraint(equalTo: IntitleLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Indesclbl.leadingAnchor.constraint(equalTo: Inimg.trailingAnchor, constant: 34 * appConstant.heightRatio),
            Indesclbl.trailingAnchor.constraint(equalTo: InbtnView.trailingAnchor, constant: -34 * appConstant.heightRatio),
            Indesclbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            
            InBtn.topAnchor.constraint(equalTo: InbtnView.topAnchor, constant: 0 * appConstant.heightRatio),
            InBtn.leadingAnchor.constraint(equalTo: InbtnView.leadingAnchor, constant: 0 * appConstant.heightRatio),
            InBtn.trailingAnchor.constraint(equalTo: InbtnView.trailingAnchor, constant: -0 * appConstant.heightRatio),
            InBtn.bottomAnchor.constraint(equalTo: InbtnView.bottomAnchor, constant: -0 * appConstant.heightRatio),
            
            buttonView.topAnchor.constraint(equalTo: InbtnView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            buttonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            buttonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -40 * appConstant.heightRatio),

            
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
        self.delegate?.SetClear()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func callbtn_press(){
        appointtype = "Call"
        CallbtnView.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        ChatbtnView.backgroundColor = UIColor.white
        InbtnView.backgroundColor = UIColor.white
        Inimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        Chatimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        Callimg.tintColor = UIColor.white
        
      //  self.navigationController?.pushViewController(UPCommingController(), animated: true)
    }
    
    @objc func nextBtn_press(){
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to book this appointment?", preferredStyle: .alert)

           // Create the actions
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
               UIAlertAction in
            
            self.postsymptop()
               NSLog("OK Pressed")
           }
        let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default) {
               UIAlertAction in
            AppUserDefault.shared.isAppointment = false
//            self.postsymptop()
           
//               NSLog("Cancel Pressed")
           }

           // Add the actions
           alertController.addAction(okAction)
           alertController.addAction(cancelAction)

           // Present the controller
        self.present(alertController, animated: true, completion: nil)
       
       
    }
    
    @objc func createdatepicker()
    {
        datePicker = UIPickerView.init()
        
        datePicker.backgroundColor = UIColor.white
        datePicker.setValue(UIColor.black, forKey: "textColor")
        datePicker.autoresizingMask = .flexibleWidth
        datePicker.contentMode = .center
        datePicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(datePicker)
                
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed1))
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([dateFlexSpace,btn], animated: true)

        self.view.addSubview(toolBar)
        
    }
    
    @objc func donepressed1()
    {
        self.view.endEditing(true)
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    
    @objc func selectbtn_press(){
        appointtype = "InPerson"
        CallbtnView.backgroundColor = UIColor.white
        ChatbtnView.backgroundColor = UIColor.white
        InbtnView.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        Inimg.tintColor = UIColor.white
        Chatimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        Callimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
      //  self.navigationController?.pushViewController(AvailDoc_DateController(), animated: true)
    }
    
    func AssignDataToBackgroundHistory()
    {
        smoke  =  AppUserDefault.shared.smoke ?? ""
        diabetes  =  AppUserDefault.shared.diabetes ?? ""
        epilepsy   =  AppUserDefault.shared.epilepsy ?? ""
        allergy   =  AppUserDefault.shared.allergy ?? ""
        diabetes2   =  AppUserDefault.shared.diabetes2 ?? ""
        heart    =  AppUserDefault.shared.heart ?? ""
        kindny   =  AppUserDefault.shared.kindny ?? ""
        arthistics   =  AppUserDefault.shared.arthistics ?? ""
        pulmonary   =  AppUserDefault.shared.pulmonary ?? ""
        eatingdisorder   =  AppUserDefault.shared.eatingdisorder ?? ""
    }
    
    func postsymptop(){
        
        
        if (String(slootid) != "") && appointtype != ""
        {
        
        let parameters: [String: AnyObject] = ["symptom_id" : EmerData![0].symptom_id as AnyObject,
                                               "complaint_name" : EmerData![0].complaint_name as AnyObject,
                                               "starting_date" : EmerData![0].starting_date as AnyObject,
                                               "description" : EmerData![0].description1 as AnyObject,
                                               "doctor_id" : doctor_id1 as AnyObject,
                                               "slots_id" : slootid as AnyObject,
                                               "appoinment_type" : appointtype as AnyObject,
                                               
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
        manager.postsymptopdata(params: parameters) { msg, hasError in
            ActivityIndicator.shared.removeSpinner()
        if hasError{
            print(hasError)
            ActivityIndicator.shared.removeSpinner()
            alertWithMsg(vc: self, msg: msg, title: "Error!")
        }else{
            print(msg)
            ActivityIndicator.shared.removeSpinner()
            
            // Create the alert controller
            let alertController = UIAlertController(title: "Alert", message: msg ?? "Appointment Created Successfully", preferredStyle: .alert)
               // Create the actions
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
                   UIAlertAction in
                ActivityIndicator.shared.removeSpinner()
                self.EmerData?.removeAll()
                let vc1 = CustomTabBarController()
                let rootNC = UINavigationController(rootViewController: vc1)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
               }
               // Add the actions
               alertController.addAction(okAction)

               // Present the controller
            self.present(alertController, animated: true, completion: nil)
            ActivityIndicator.shared.removeSpinner()
            
        }
    }
        
        
        }
        else
        {
        alertWithMsg(vc: self, msg: "First Pick the Appointment-Type OR add The Time Slot", title: "Alert!")
        }
    }
    
    @objc func Chatbtn_press(_ sender:UIButton){

        appointtype = "Chat"
        CallbtnView.backgroundColor = UIColor.white
        ChatbtnView.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        InbtnView.backgroundColor = UIColor.white
        Inimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        Chatimg.tintColor = UIColor.white
        Callimg.tintColor = UIColor(named: Colors.PrimaryAppColor1)
    }
    
//    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool{
//        ChatBtn.backgroundColor = .clear
//        ChatBtn.setTitleColor(.selectedBtn, for: .normal)
//        return true
//    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
          
          return UIModalPresentationStyle.none
          
      }

    
    
    
    
}


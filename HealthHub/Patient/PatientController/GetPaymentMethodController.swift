//
//  GetPaymentMethodController.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class GetPaymentMethodController: UIViewController {

    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
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
        btn.tintColor = .white
      //  btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var FirstIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Num4")
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
        lbl.text = "Payment"
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
        iv.image = UIImage(named: "DNum5")
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
        lbl.text = "Review Order"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var SecondlineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.clipsToBounds = false
//        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ThirdIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum4")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var cardImg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Cardimg")
        iv.backgroundColor = UIColor.clear
        iv.layer.cornerRadius = 18 * appConstant.heightRatio
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var cardinfotitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Card Information"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
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
        lbl.text = "Enter card name holder full name"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var nameTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Peter parker"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var cardnoTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cardnoTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Enter card number"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var cardnoTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "1234  5678  9012  3456"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var cardexpTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cardexpTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Card expire date"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var cardexpTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "dd/mm/yyyy"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    lazy var ccvvTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ccvvTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "CVV number"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var ccvvTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "1234"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
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
        lbl.text = "Review Order"
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
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
        view.addSubview(cardImg)
        view.addSubview(cardinfotitleLbl1)
        view.addSubview(nameTextFieldView)
        nameTextFieldView.addSubview(nameTftitlelbl)
        nameTextFieldView.addSubview(nameTF)
        view.addSubview(cardnoTextFieldView)
        cardnoTextFieldView.addSubview(cardnoTftitlelbl)
        cardnoTextFieldView.addSubview(cardnoTF)
        view.addSubview(cardexpTextFieldView)
        cardexpTextFieldView.addSubview(cardexpTftitlelbl)
        cardexpTextFieldView.addSubview(cardexpTF)
        view.addSubview(ccvvTextFieldView)
        ccvvTextFieldView.addSubview(ccvvTftitlelbl)
        ccvvTextFieldView.addSubview(ccvvTF)
        view.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -48 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
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
            
            
            cardImg.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            cardImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            cardImg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            cardImg.heightAnchor.constraint(equalToConstant: 180 * appConstant.heightRatio),
            
            
            cardinfotitleLbl1.topAnchor.constraint(equalTo: cardImg.bottomAnchor, constant: 20 * appConstant.heightRatio),
            cardinfotitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            cardinfotitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
        
            nameTextFieldView.topAnchor.constraint(equalTo: cardinfotitleLbl1.bottomAnchor, constant: 20 * appConstant.heightRatio),
            nameTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            nameTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            nameTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            nameTftitlelbl.topAnchor.constraint(equalTo: nameTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            nameTftitlelbl.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            nameTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            nameTF.topAnchor.constraint(equalTo: nameTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            nameTF.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            nameTF.trailingAnchor.constraint(equalTo: nameTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            nameTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            cardnoTextFieldView.topAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            cardnoTextFieldView.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor),
            cardnoTextFieldView.trailingAnchor.constraint(equalTo: nameTextFieldView.trailingAnchor),
            cardnoTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            cardnoTftitlelbl.topAnchor.constraint(equalTo: cardnoTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            cardnoTftitlelbl.leadingAnchor.constraint(equalTo: cardnoTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            cardnoTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            cardnoTF.topAnchor.constraint(equalTo: cardnoTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            cardnoTF.leadingAnchor.constraint(equalTo: cardnoTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            cardnoTF.trailingAnchor.constraint(equalTo: cardnoTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            cardnoTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        
            cardexpTextFieldView.topAnchor.constraint(equalTo: cardnoTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            cardexpTextFieldView.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor),
            cardexpTextFieldView.trailingAnchor.constraint(equalTo: nameTextFieldView.trailingAnchor),
            cardexpTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            cardexpTftitlelbl.topAnchor.constraint(equalTo: cardexpTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            cardexpTftitlelbl.leadingAnchor.constraint(equalTo: cardexpTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            cardexpTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            cardexpTF.topAnchor.constraint(equalTo: cardexpTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            cardexpTF.leadingAnchor.constraint(equalTo: cardexpTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            cardexpTF.trailingAnchor.constraint(equalTo: cardexpTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            cardexpTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            ccvvTextFieldView.topAnchor.constraint(equalTo: cardexpTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            ccvvTextFieldView.leadingAnchor.constraint(equalTo: cardexpTextFieldView.leadingAnchor),
            ccvvTextFieldView.trailingAnchor.constraint(equalTo: cardexpTextFieldView.trailingAnchor),
            ccvvTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            ccvvTftitlelbl.topAnchor.constraint(equalTo: ccvvTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            ccvvTftitlelbl.leadingAnchor.constraint(equalTo: ccvvTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            ccvvTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            ccvvTF.topAnchor.constraint(equalTo: ccvvTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            ccvvTF.leadingAnchor.constraint(equalTo: ccvvTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            ccvvTF.trailingAnchor.constraint(equalTo: ccvvTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            ccvvTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            buttonView.topAnchor.constraint(equalTo: ccvvTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),

            
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
    
    @objc func backbtn_press()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtn_press(){
            
       
    }


}

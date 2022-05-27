//
//  OnBoarding3.swift
//  Certifly
//
//  Created by Hamza on 11/23/21.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

protocol DoctorOnBoard3Delegate{
    func slider3BtnPress()
}

var DoctoronBoard3Data : DoctorOnBoard3Delegate?

class DoctorOnBoardingView3: UIView {

    lazy var sliderImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Doctoronboarding3")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var backcurleimg: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backcurleimg")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
//        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var sliderHLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor =  UIColor.white
        lbl.textAlignment = .right
        lbl.font = bold(size: 24)
        lbl.text = "Give \nconsultation \nfrom Home"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var desc1Lbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = regular(size: 15)
        lbl.text = "Connect with your patient remotely, anywhere and any time."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

//    lazy var neverBtn : CustomButton = {
//        let btn = CustomButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.backgroundColor = .clear
//        btn.setTitle("Never show again", for: .normal)
//        btn.setTitleColor(redBtnColor(), for: .normal)
//        btn.layer.shadowColor = UIColor.clear.cgColor
//        btn.addTarget(self, action: #selector(neverBtn_press), for: .touchUpInside)
//        return btn
//    }()
//
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        Doctoronboard3 = self
        setup()
        
    }
    
 
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func setup(){
        self.addSubview(sliderImage)
        self.addSubview(backcurleimg)
        self.addSubview(sliderHLbl)
        self.addSubview(desc1Lbl)
        
        NSLayoutConstraint.activate([
            sliderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sliderImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 40 * appConstant.heightRatio),
            sliderImage.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            sliderImage.widthAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            backcurleimg.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: -10 * appConstant.widthRatio),
            backcurleimg.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 10 * appConstant.widthRatio),
            backcurleimg.heightAnchor.constraint(equalToConstant: 350 * appConstant.heightRatio),
            backcurleimg.topAnchor.constraint(equalTo: sliderImage.bottomAnchor,constant: 110 * appConstant.heightRatio),
            
            sliderHLbl.topAnchor.constraint(equalTo: backcurleimg.topAnchor, constant: 30 * appConstant.heightRatio),
            sliderHLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            sliderHLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
//            sliderHLbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            desc1Lbl.topAnchor.constraint(equalTo: sliderHLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            desc1Lbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            desc1Lbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
        
        ])
    }
    
    @objc func nextBtn_press(){
        DoctoronBoard3Data?.slider3BtnPress()
    }
    
    @objc func neverBtn_press(){
        UserDefaults.standard.setValue(true, forKey: "onboarding")
        DoctoronBoard3Data?.slider3BtnPress()
    }
}

extension DoctorOnBoardingView3: DoctorSlider3Delegate{
    func btn3Press() {
        
    }
}

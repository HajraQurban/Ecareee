//
//  OnBoarding3.swift
//  Certifly
//
//  Created by Hamza on 11/23/21.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

protocol OnBoard3Delegate{
    func slider3BtnPress()
}

var onBoard3Data : OnBoard3Delegate?

class OnBoarding3: UIView {
    
    lazy var sliderImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Onboarding3")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var sliderHLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor =  UIColor(named: Colors.AppColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 36)
        lbl.text = "Consult from Home"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var desc1Lbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 15)
        lbl.text = "Connect with your MD and be prepared before you meet."
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
        onboard3 = self
        setup()
        
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func setup(){
        self.addSubview(sliderImage)
        self.addSubview(sliderHLbl)
        self.addSubview(desc1Lbl)
        
        NSLayoutConstraint.activate([
            sliderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sliderImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 40 * appConstant.heightRatio),
            sliderImage.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            sliderImage.widthAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            sliderHLbl.topAnchor.constraint(equalTo: sliderImage.bottomAnchor, constant: 24 * appConstant.heightRatio),
            sliderHLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            sliderHLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
            sliderHLbl.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            desc1Lbl.topAnchor.constraint(equalTo: sliderHLbl.bottomAnchor,constant: 12 * appConstant.heightRatio),
            desc1Lbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            desc1Lbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
            
        ])
    }
    
    @objc func nextBtn_press(){
        onBoard3Data?.slider3BtnPress()
    }
    
    @objc func neverBtn_press(){
        UserDefaults.standard.setValue(true, forKey: "onboarding")
        onBoard3Data?.slider3BtnPress()
    }
}

extension OnBoarding3: Slider3Delegate{
    func btn3Press() {
        
    }
}

//
//  OnBoarding1.swift
//  Certifly
//
//  Created by Hamza on 11/23/21.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

protocol OnBoard1Delegate{
    func slider1BtnPress()
}

var onBoard1Data : OnBoard1Delegate?

class OnBoarding1: UIView {
    
    lazy var sliderImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Onboarding1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var sliderHLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .right
        lbl.font = bold(size: 36)
        lbl.text = "Find your Doctor"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .right
        lbl.font = regular(size: 15)
        lbl.text = "Find the best healthcare providers that suits you the most with the tap on your mobile phone."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        onboard1 = self
        setup()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func setup(){
        self.addSubview(sliderImage)
//        self.addSubview(sliderHLbl)
//        self.addSubview(descLbl)
        
        
        NSLayoutConstraint.activate([
            sliderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sliderImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 40 * appConstant.heightRatio),
            sliderImage.heightAnchor.constraint(equalToConstant: 350 * appConstant.heightRatio),
            sliderImage.widthAnchor.constraint(equalToConstant: 320 * appConstant.heightRatio),
            
//            sliderHLbl.topAnchor.constraint(equalTo: sliderImage.bottomAnchor, constant: 60 * appConstant.heightRatio),
//            sliderHLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
//            sliderHLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
//            sliderHLbl.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
//
//            descLbl.topAnchor.constraint(equalTo: sliderHLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
//            descLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
//            descLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
            
        ])
    }
    
    @objc func nextBtn_press(){
        onBoard1Data?.slider1BtnPress()
        
    }
    
}

extension OnBoarding1: Slider1Delegate{
    func btn1Press() {
        
    }
    
    
}

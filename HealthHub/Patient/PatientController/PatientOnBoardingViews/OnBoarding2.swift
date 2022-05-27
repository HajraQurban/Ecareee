//
//  OnBoarding2.swift
//  Certifly
//
//  Created by Hamza on 11/23/21.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

protocol OnBoard2Delegate{
    func slider2BtnPress()
}

var onBoard2Data : OnBoard2Delegate?

class OnBoarding2: UIView {
    
    lazy var sliderImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Onboarding2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var sliderHLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 30)
        lbl.text = "Make an Appointment"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = regular(size: 15)
        lbl.text = "Book your appointment fast and easy. No delays, no limitations."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        onboard2 = self
        setup()
        
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func setup(){
        self.addSubview(sliderImage)
        self.addSubview(sliderHLbl)
        self.addSubview(descLbl)
        
        NSLayoutConstraint.activate([
            sliderImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sliderImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 40 * appConstant.heightRatio),
            sliderImage.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            sliderImage.widthAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            sliderHLbl.topAnchor.constraint(equalTo: sliderImage.bottomAnchor, constant: 24 * appConstant.heightRatio),
            sliderHLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            sliderHLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
            sliderHLbl.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
            
            descLbl.topAnchor.constraint(equalTo: sliderHLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            descLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
            
        ])
    }
    
    
    @objc func nextBtn_press(){
        onBoard2Data?.slider2BtnPress()
    }
}

extension OnBoarding2: Slider2Delegate{
    func btn2Press() {
        
    }
}


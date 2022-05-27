//
//  DoctorOnBoardingView2.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//



import UIKit

protocol DoctorOnBoard2Delegate{
    func slider2BtnPress()
}

var DoctoronBoard2Data : DoctorOnBoard2Delegate?

class DoctorOnBoardingView2: UIView {

    lazy var sliderImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Onboarding2")
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
        lbl.textColor = UIColor.white
        lbl.textAlignment = .right
        lbl.font = bold(size: 24)
        lbl.text = "Make an \nAppointment"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
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
        Doctoronboard2 = self
        setup()
        
    }
    
 
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func setup(){
        self.addSubview(sliderImage)
        self.addSubview(backcurleimg)
        self.addSubview(sliderHLbl)
        self.addSubview(descLbl)
        
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
            
            descLbl.topAnchor.constraint(equalTo: sliderHLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 42 * appConstant.widthRatio),
            descLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42 * appConstant.widthRatio),
               
        ])
    }
    
    
    @objc func nextBtn_press(){
        DoctoronBoard2Data?.slider2BtnPress()
    }
}

extension DoctorOnBoardingView2: DoctorSlider2Delegate{
    func btn2Press() {
        
    }
}


//
//  PatientwaitingroomController.swift
//  HealthHub
//
//  Created by Mac on 12/05/2022.
//

import UIKit

class PatientwaitingroomController: BaseController {
    
    lazy var meetingtitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 24)
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.text = "Your meeting has not \nstarted yet!"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var timingtitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 15)
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.text = "Start today at 4:30 pm"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var infoView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
//        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var infowaitingLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 15)
        lbl.textColor = UIColor.white
        lbl.text = "Please wait for the host to start meeting Dr. Strange’s personal meeting room"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var testaudioView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
//        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var testaudioBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("Test computer audio/video", for: .normal)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
//        btn.addTarget(self, action: #selector(bookBtn_press), for: .touchUpInside)
        return btn
    }()

//    override func loadView() {
//          super.loadView()
//          view.addSubview(testaudioView)
//      }
    
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            // Call the roundCorners() func right there.
        testaudioView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        
        }
      

    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.tintColor = .white
        headerLbl.text = "Waiting Room"
        setup()
    }
    
    func setup()
    {
        childView.addSubview(meetingtitleLbl)
        childView.addSubview(timingtitleLbl)
        childView.addSubview(infoView)
        infoView.addSubview(infowaitingLbl)
        childView.addSubview(testaudioView)
        testaudioView.addSubview(testaudioBtn)
        
        NSLayoutConstraint.activate([
        
            
            
            
//            childView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40 * appConstant.heightRatio),
            
            
            
            meetingtitleLbl.topAnchor.constraint(equalTo: childView.topAnchor, constant: 60 * appConstant.heightRatio),
            meetingtitleLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            meetingtitleLbl.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -40 * appConstant.widthRatio),
            
            
            timingtitleLbl.topAnchor.constraint(equalTo: meetingtitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            timingtitleLbl.leadingAnchor.constraint(equalTo: meetingtitleLbl.leadingAnchor),
            timingtitleLbl.trailingAnchor.constraint(equalTo: meetingtitleLbl.trailingAnchor),
            
            
            infoView.topAnchor.constraint(equalTo: timingtitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            infoView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            infoView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            infoView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            
            
            infowaitingLbl.centerYAnchor.constraint(equalTo: infoView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            infowaitingLbl.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            infowaitingLbl.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),

                        
            testaudioView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            testaudioView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            testaudioView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor),
            testaudioView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            
            testaudioBtn.centerYAnchor.constraint(equalTo: testaudioView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            testaudioBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            testaudioBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -40 * appConstant.widthRatio),
            testaudioBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),

            
            
        
        ])
        
    }

}


extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 5 * appConstant.heightRatio
        layer.mask = mask
       
       
//       // Add border
//            let borderLayer = CALayer()
//            borderLayer.shadowColor = UIColor.black.cgColor
//            borderLayer.shadowOpacity = 0.5
//            borderLayer.shadowOffset = CGSize(width: 4, height: 4)
//            borderLayer.shadowRadius = 5 * appConstant.heightRatio
//            layer.addSublayer(borderLayer)
//
       
      
       
    }
}

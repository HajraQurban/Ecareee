//
//  DoctorEndCallController.swift
//  HealthHub
//
//  Created by OBS on 14/02/2022.
//

import UIKit
import LGSideMenuController

class DoctorEndCallController: UIViewController {

    lazy var headingLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 36)
        lbl.text = "Your call has ended"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var endCallBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setImage(UIImage(named: "EndCall"), for: .normal)
        btn.isUserInteractionEnabled = false
        btn.imageView?.tintColor = .white
        btn.layer.cornerRadius = 32 * appConstant.heightRatio
        return btn
    }()
    
    lazy var mainView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.shadowColor = UIColor(named:Colors.LightText)!.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var drImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "drImg")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = false
        iv.layer.cornerRadius = 10 * appConstant.heightRatio
        return iv
    }()
    
    lazy var nameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "Dr. Hamza"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var designationLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.LightText)
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 13.0 * appConstant.heightRatio)
        lbl.text = "Neurologist |  Metro Hospital"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var dateLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "20 January 2020"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var timeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "11.30"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var topLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var summryLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Summary"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var statusLbl : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Status"
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var statusResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Ended"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var durationLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Call Duration"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var durationResultLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-Semibold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "12.40"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
   
    lazy var bookBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setTitle("Home", for: .normal)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.addTarget(self, action: #selector(bookBtn_press), for: .touchUpInside)
        return btn
    }()
    var appointment = appointdata()
    //For Side Menu
    var window: UIWindow?
    var mainController = UIViewController()
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            // Call the roundCorners() func right there.
        mainView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        
        }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        self.nameLbl.text  = appointment.patient?.name ?? ""
        self.designationLbl.text = appointment.compName ?? ""
        self.dateLbl.text = appointment.slot?.date ?? ""
        self.timeLbl.text = appointment.slot?.start_time ?? ""
        
        if appointment.patient?.url == nil
        {
            drImage.image = UIImage(named: "Profile_img")
        }
        else
        {
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + ( appointment.patient?.url ?? ""))
            drImage.kf.setImage(with: url)
        }
        
        setup()
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(endCallBtn)
        view.addSubview(headingLbl)
        view.addSubview(mainView)
        mainView.addSubview(drImage)
        mainView.addSubview(drImage)
        mainView.addSubview(nameLbl)
        mainView.addSubview(designationLbl)
        mainView.addSubview(dateLbl)
        mainView.addSubview(timeLbl)
        mainView.addSubview(topLine)
        mainView.addSubview(summryLbl)
        mainView.addSubview(statusLbl)
        mainView.addSubview(statusResultLbl)
        mainView.addSubview(durationLbl)
        mainView.addSubview(durationResultLbl)
        view.addSubview(bookBtn)
        
        NSLayoutConstraint.activate([
        
            endCallBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0 * appConstant.widthRatio),
            endCallBtn.topAnchor.constraint(equalTo: margin.topAnchor,constant: 40 * appConstant.heightRatio),
            endCallBtn.widthAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            endCallBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            headingLbl.topAnchor.constraint(equalTo: endCallBtn.bottomAnchor,constant: 20 * appConstant.heightRatio),
            headingLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100 * appConstant.widthRatio),
            headingLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100 * appConstant.widthRatio),
            
            mainView.topAnchor.constraint(equalTo: headingLbl.topAnchor,constant: 120 * appConstant.heightRatio),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            drImage.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 6 * appConstant.heightRatio),
            drImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 6 * appConstant.widthRatio),
            drImage.widthAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            drImage.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
                                              
            nameLbl.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: drImage.trailingAnchor,constant: 18 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -4 * appConstant.widthRatio),
            
            designationLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            designationLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            designationLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -4 * appConstant.widthRatio),
           
            dateLbl.bottomAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 0 * appConstant.heightRatio),
            dateLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            timeLbl.centerYAnchor.constraint(equalTo: dateLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            timeLbl.leadingAnchor.constraint(equalTo: dateLbl.trailingAnchor,constant: 24 * appConstant.widthRatio),
           
            topLine.topAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 16 * appConstant.heightRatio),
            topLine.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            topLine.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            topLine.heightAnchor.constraint(equalToConstant: 4 * appConstant.heightRatio),
            
            summryLbl.topAnchor.constraint(equalTo: topLine.bottomAnchor,constant: 20 * appConstant.heightRatio),
            summryLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            summryLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
            statusLbl.topAnchor.constraint(equalTo: summryLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            statusLbl.leadingAnchor.constraint(equalTo: summryLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            statusResultLbl.centerYAnchor.constraint(equalTo: statusLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            statusResultLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            
          
            durationLbl.topAnchor.constraint(equalTo: statusResultLbl.bottomAnchor,constant: 10 * appConstant.heightRatio),
            durationLbl.leadingAnchor.constraint(equalTo: summryLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            durationResultLbl.centerYAnchor.constraint(equalTo: durationLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            durationResultLbl.trailingAnchor.constraint(equalTo:  mainView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            durationLbl.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            
            bookBtn.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20 * appConstant.heightRatio),
            bookBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            bookBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            bookBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
        ])
        
    }
    
    @objc func bookBtn_press(){
     
//        let vc = DoctorCustomTabbarController()
//        vc.selectedIndex = 2
//        let rootNC = UINavigationController(rootViewController: vc)
//        rootNC.navigationBar.isHidden = true
//        UIApplication.shared.windows.first?.rootViewController = rootNC
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        mainController = DoctorCustomTabbarController()
        let rootNavigationController = UINavigationController(rootViewController: mainController)
        rootNavigationController.navigationBar.isHidden = true
        let leftViewController = SideMenuViewController()
        // 3. Create instance of LGSideMenuController with above controllers as root and left.
        let sideMenuController = LGSideMenuController(rootViewController: rootNavigationController,
                                                      leftViewController: leftViewController)
        // 4. Set presentation style by your taste if you don't like the default one.
        sideMenuController.leftViewPresentationStyle = .slideAbove
        sideMenuController.isLeftViewSwipeGestureEnabled = false
        
        // 5. Set width for the left view if you don't like the default one.
        sideMenuController.leftViewWidth = 300 * appConstant.widthRatio
        // 6. Make it `rootViewController` for your window.
        //      self.window = UIWindow(frame: UIScreen.main.bounds)
        self.view.window?.rootViewController = sideMenuController
        self.view.window?.makeKeyAndVisible()
        
    }
    
}

//
//  DoctorSignStartedController.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import UIKit
import LGSideMenuController

class DoctorSignStartedController: BaseController {

    lazy var heading : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Welcome Richard !"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Before any appointments, \nwalk us through your career \nbackground."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Getstartedlogo : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "GetStart1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var askdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 18)
        lbl.text = "We will ask you all the important questions"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var getstartedBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(getstartedbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var signinBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: Colors.ButtonBG), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitle("Sign In", for: .normal)
        btn.layer.borderWidth = 1  * appConstant.heightRatio
        btn.layer.borderColor =  UIColor(named:Colors.ButtonBG)?.cgColor
        btn.addTarget(self, action: #selector(signupbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupofUI()
        backBtn.isHidden = true
        headerLbl.text = "Welcome"
        heading.text = AppUserDefault.shared.username
        signinBtn.isHidden = true
        
    }
    
    func setupofUI(){
        let margin = view.layoutMarginsGuide
        view.addSubview(Getstartedlogo)
        view.addSubview(heading)
        view.addSubview(descLbl)
        view.addSubview(askdescLbl)
        view.addSubview(getstartedBtn)
        view.addSubview(signinBtn)
        
        
        NSLayoutConstraint.activate([
            
            
            heading.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21 * appConstant.heightRatio),
            heading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21 * appConstant.heightRatio),

            heading.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            descLbl.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 10 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21 * appConstant.heightRatio),
            descLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21 * appConstant.heightRatio),

           // descLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
            
            Getstartedlogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Getstartedlogo.topAnchor.constraint(equalTo: descLbl.bottomAnchor,constant: 21 * appConstant.heightRatio),
            Getstartedlogo.heightAnchor.constraint(equalToConstant: 258 * appConstant.heightRatio),
            Getstartedlogo.widthAnchor.constraint(equalToConstant: 249 * appConstant.heightRatio),
                        
            
            askdescLbl.topAnchor.constraint(equalTo: Getstartedlogo.bottomAnchor, constant: 10 * appConstant.heightRatio),
            askdescLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21 * appConstant.heightRatio),
            askdescLbl.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21 * appConstant.heightRatio),

            askdescLbl.heightAnchor.constraint(equalToConstant: 34 * appConstant.heightRatio),
            
//            descLbl.bottomAnchor.constraint(equalTo: nextBtn.topAnchor,constant: -12 * appConstant.heightRatio),
            getstartedBtn.topAnchor.constraint(equalTo: askdescLbl.bottomAnchor, constant: 7 * appConstant.heightRatio),
            getstartedBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            getstartedBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -19 * appConstant.widthRatio),
            getstartedBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            signinBtn.topAnchor.constraint(equalTo: getstartedBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            signinBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            signinBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            signinBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            ])
        
    }
    
    @objc func getstartedbtn_press(){
        
    //    self.navigationController?.pushViewController(CustomTabBarController(), animated: true)
//        let vc = DoctorMainBackgroundHistoryController()
//        vc.modalPresentationStyle = .fullScreen
//
//        self.navigationController?.pushViewController(vc, animated: true)
        let rootNavigationController = UINavigationController(rootViewController: DoctorDashBoardController())
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
    
    @objc func signupbtn_press(){

        self.navigationController?.pushViewController(SigninController(), animated: true)
    }

}

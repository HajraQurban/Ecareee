//
//  SideMenuViewController.swift
//  HealthHub
//
//  Created by OBS on 28/01/2022.
//

import UIKit
import SSCustomSideMenu
import LGSideMenuController

class SideMenuViewController: LGSideMenuController {
    
    lazy var containerView : UIView = {
        let view = UIView()
//        view.layer.cornerRadius = 8 * appConstant.heightRatio
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var logoimg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "SplashLogo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 36 * appConstant.heightRatio
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "NA2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var docnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Dr. Anna Nicholas"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docemailLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "strange@gmail.com"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sidemenuitemTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.clear
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var gobackBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitle("Go back", for: .normal)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
//        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.addTarget(self, action: #selector(backBtn_press), for: .touchUpInside)
        return btn
    }()
    
    //For Side Menu Data
    var ImageArray = ["Side1","Side2","Side3","Side4","Side5","Side6","Side7"]
    var namearray : [String] = ["Dashboard","My profile","Speciality","Slot details","Reviews list","Appointments","Log out"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        sidemenuitemTV.delegate = self
        sidemenuitemTV.dataSource = self
        sidemenuitemTV.register(SideMenuTVCell.self, forCellReuseIdentifier: SideMenuTVCell.cellidentifier)
        leftViewPresentationStyle = .slideAboveBlurred
        setupUI()
        setdata()
    }
    
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()

            // Call the roundCorners() func right there.
        gobackBtn.roundCorners(corners: [ .topRight , .bottomRight], radius: 12 * appConstant.heightRatio)
        containerView.roundCorners(corners: [ .topRight], radius: 12 * appConstant.heightRatio)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setdata()
    }
    
    func setupUI(){
        
        let margin = view.layoutMarginsGuide
        
        view.addSubview(containerView)
        containerView.addSubview(logoimg)
        containerView.addSubview(docimg)
        containerView.addSubview(docnameLbl)
        containerView.addSubview(docemailLbl)
        containerView.addSubview(lineView)
        containerView.addSubview(sidemenuitemTV)
        containerView.addSubview(gobackBtn)
        
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 60 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            //            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            logoimg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8 * appConstant.heightRatio),
            logoimg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            logoimg.heightAnchor.constraint(equalToConstant: 58 * appConstant.heightRatio),
            logoimg.widthAnchor.constraint(equalToConstant: 58 * appConstant.heightRatio),
            
            lineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            lineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            lineView.topAnchor.constraint(equalTo: logoimg.bottomAnchor, constant: 25 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
            
            sidemenuitemTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            sidemenuitemTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0 * appConstant.widthRatio),
            sidemenuitemTV.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            sidemenuitemTV.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),

            //            sidemenuitemTV.heightAnchor.constraint(equalToConstant: 300 * appConstant.heightRatio),
            
            docimg.topAnchor.constraint(equalTo: sidemenuitemTV.bottomAnchor, constant: 24 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 31 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),

            
            docnameLbl.topAnchor.constraint(equalTo: docimg.topAnchor, constant: 0 * appConstant.heightRatio),
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 14 * appConstant.widthRatio),
            docnameLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            docemailLbl.topAnchor.constraint(equalTo: docnameLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            docemailLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 14 * appConstant.widthRatio),
            docemailLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            docemailLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            gobackBtn.topAnchor.constraint(equalTo: docimg.bottomAnchor, constant: 12 * appConstant.heightRatio),
            gobackBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            gobackBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40 * appConstant.widthRatio),
            gobackBtn.heightAnchor.constraint(equalToConstant: 54 * appConstant.heightRatio),
            gobackBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20 * appConstant.heightRatio),

            
            
        ])
        
    }
    
    func setdata()
    {
        
        if AppUserDefault.shared.url == nil || AppUserDefault.shared.url == ""
        {
            docimg.image = UIImage(named: "NA2")
        }
        else
        {
            let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
            let url = URL(string: base + ( AppUserDefault.shared.url ?? ""))
            docimg.kf.setImage(with: url)
        }
//        docnameLbl.text = AppUserDefault.shared.username
//        docemailLbl.text = AppUserDefault.shared.useremail
        
        
    }
    
    @objc func backBtn_press()
    {
        self.sideMenuController?.hideLeftViewAnimated(sender: self)
    }
    
}


extension SideMenuViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sidemenuitemTV.dequeueReusableCell(withIdentifier: SideMenuTVCell.cellidentifier, for: indexPath) as! SideMenuTVCell
        
        cell.patImg.image = UIImage(named: ImageArray[indexPath.row])
        cell.patnameLbl.text = namearray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
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
        else if indexPath.row == 1
        {
            let vc = DoctorProfileController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 2
        {
            let vc = DoctorSpecialityController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 3
        {
            let vc = DoctorSlotDetailsController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
        else if indexPath.row == 4
        {
            let vc = DoctorReviewsListController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 5
        {
            let vc = DoctorAppointmentDetailsController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else if indexPath.row == 6
        {
            //
            let refreshAlert = UIAlertController(title: "Log out", message: "Are You Sure to Log out ? ", preferredStyle: UIAlertController.Style.alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                Helper.clearUser()
                let vc = WellcomeStartController()
                let rootNC = UINavigationController(rootViewController: vc)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                
                refreshAlert .dismiss(animated: true, completion: nil)
                
                
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

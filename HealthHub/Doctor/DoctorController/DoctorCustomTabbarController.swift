//
//  DoctorCustomTabbarController.swift
//  HealthHub
//
//  Created by Mac on 09/03/2022.
//

import UIKit
import LGSideMenuController

class DoctorCustomTabbarController: UITabBarController, UITabBarControllerDelegate {

    var tabheight = NSLayoutConstraint()
    let bgView = UIView()
    //For Side Menu
    var window: UIWindow?
    var mainController = UIViewController()
    
    lazy var menuBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setImage(UIImage(named: "doctor_Home_Tab"), for: .normal)
        btn.layer.cornerRadius = 32 * appConstant.heightRatio
       // btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        return btn
      }()
    
    lazy var dashlbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Dashboard"
        lbl.textColor = .black
        return lbl
    }()
    
//    open override var tabBar: TabBarWithCorners {
//           return TabBarWithCorners()
//       }
    
      override func viewDidLoad() {
        super.viewDidLoad()
          self.view.backgroundColor = UIColor(named: Colors.AppBGColor)
          self.navigationController?.navigationBar.isHidden = true
//        self.tabBar.isTranslucent = true
          
//        self.tabBar.barTintColor = UIColor(named: "tabBG")
//          self.tabBar.backgroundColor = .red
         
//          bgView.frame = self.tabBar.bounds
          
          setthe()
          delegate = self
        tabBarItem.imageInsets = UIEdgeInsets(top: 10 * appConstant.heightRatio, left: 4 * appConstant.heightRatio, bottom: 10 * appConstant.heightRatio, right: 4 * appConstant.heightRatio)
      //  tabBar.selectedItem?.badgeColor = UIColor(patternImage: UIImage(named: "tabBG")!)
          tabBar.selectedImageTintColor = UIColor(named: Colors.PrimaryAppColor1)
          tabBar.unselectedItemTintColor =  .black//UIColor(named: Colors.red)
        //let controller1 = Home()
        let controller1 = DoctorSlotDetailsController()
        controller1.tabBarItem = UITabBarItem(title: "Slots", image: UIImage(named: "slot_tab"), tag: 1)
        let nav1 = UINavigationController(rootViewController: controller1)
          nav1.navigationBar.isHidden = true
        let controller2 = DoctorAppointmentDetailsController()
        controller2.tabBarItem = UITabBarItem(title: "Appointments", image: UIImage(named: "appointment_Tab"), tag: 2)
        let nav2 = UINavigationController(rootViewController: controller2)
          nav2.navigationBar.isHidden = true
        let controller3 = DoctorDashBoardController()
        controller3.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: ""), tag: 2)
        let nav3 = UINavigationController(rootViewController: controller3)
          nav3.navigationBar.isHidden = true
        let controller4 = MessageListController()
        controller4.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "MailIcon"), tag: 4)
        let nav4 = UINavigationController(rootViewController: controller4)
          nav4.navigationBar.isHidden = true
        let controller5 = DoctorDashBoardController()
        controller5.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "MoreIcon"), tag: 5)
          controller5.backBtn.isHidden = true
        let nav5 = UINavigationController(rootViewController: controller5)
          nav5.navigationBar.isHidden = true
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
          setupMiddleButton()
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
      
      }
    
    func setthe()
    {
        tabBar.layer.masksToBounds = true
        tabBar.backgroundColor =  UIColor(named: Colors.TextfieldBG)
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 25 * appConstant.heightRatio
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
      
//        bgView.backgroundColor = .white
//        bgView.layer.shadowColor  = UIColor.black.cgColor
//        bgView.layer.shadowRadius = 3 * appConstant.heightRatio
//        bgView.layer.shadowOffset =  CGSize(width: 1, height: 0)
//        bgView.layer.shadowOpacity = 0.5
//        bgView.contentMode = .scaleAspectFit
//
//        bgView.layer.cornerRadius = 15 * appConstant.heightRatio
//        self.tabBar.addSubview(bgView)
////        self.tabBar.sendSubviewToBack(bgView)
//        self.tabBar.clipsToBounds = false
//        self.tabBar.backgroundColor = .white
//        NSLayoutConstraint.activate([
////            bgView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
//            bgView.leadingAnchor.constraint(equalTo: self.tabBar.leadingAnchor),
//            bgView.trailingAnchor.constraint(equalTo: self.tabBar.trailingAnchor),
//            bgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -15 * appConstant.heightRatio),
//            bgView.topAnchor.constraint(equalTo: self.tabBar.topAnchor)
//
//        ])
    }
    
    
    func setupMiddleButton() {
    //    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64 * appConstant.heightRatio, height: 64 * appConstant.heightRatio))
    //      var menuButtonFrame = menuButton.frame
    //      menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 46
    //      menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    //      menuButton.frame = menuButtonFrame
    //
    //      menuButton.backgroundColor = hexStringToUIColor(hex: "91C167")
    //      menuButton.layer.cornerRadius = menuButtonFrame.height/2
          view.addSubview(menuBtn)
        view.addSubview(dashlbl)
        NSLayoutConstraint.activate([
          menuBtn.centerYAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0),
          menuBtn.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor, constant: 0),
          menuBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
          menuBtn.widthAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
          
          dashlbl.topAnchor.constraint(equalTo: menuBtn.bottomAnchor, constant: 12 * appConstant.heightRatio),
          dashlbl.centerXAnchor.constraint(equalTo: menuBtn.centerXAnchor, constant: 0),
          dashlbl.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),

          
        ])
          view.layoutIfNeeded()
      }
    
    @objc func backbtn_press(){
        
//        let vc = DoctorCustomTabbarController()
//        vc.selectedIndex = 2
//        let rootNC = UINavigationController(rootViewController: vc)
//        rootNC.navigationBar.isHidden = true
//        UIApplication.shared.windows.first?.rootViewController = rootNC
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        let vc = DoctorCustomTabbarController()
        vc.selectedIndex = 2
        let rootNavigationController = UINavigationController(rootViewController: vc)
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
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            viewDidLoad()

//        if tabBarController.selectedIndex == 0{
//            let vc = DoctorCustomTabbarController()
//            vc.selectedIndex = 0
//            let rootNC = UINavigationController(rootViewController: vc)
//            rootNC.navigationBar.isHidden = true
//            UIApplication.shared.windows.first?.rootViewController = rootNC
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//        }
        
         if tabBarController.selectedIndex == 4 {
            self.sideMenuController?.showLeftView(animated: true)
        }
    }
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}


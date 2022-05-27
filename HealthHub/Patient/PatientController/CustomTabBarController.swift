//
//  tabview1Controller.swift
//  HealthHub
//
//  Created by OBS on 13/01/2022.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var tabheight = NSLayoutConstraint()
    
    lazy var menuBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setImage(UIImage(named: "Grid"), for: .normal)
        btn.layer.cornerRadius = 32 * appConstant.heightRatio
      //  btn.setTitle("Get Started", for: .normal)
//        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
      override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
          self.navigationController?.navigationBar.isHidden = true
          
          setthe()
          delegate = self
        tabBarItem.imageInsets = UIEdgeInsets(top: 10 * appConstant.heightRatio, left: 4 * appConstant.heightRatio, bottom: 10 * appConstant.heightRatio, right: 4 * appConstant.heightRatio)
      //  tabBar.selectedItem?.badgeColor = UIColor(patternImage: UIImage(named: "tabBG")!)
          tabBar.selectedImageTintColor = UIColor(named: Colors.PrimaryAppColor1)
          tabBar.unselectedItemTintColor =  .black//UIColor(named: Colors.red)
        //let controller1 = Home()
        let controller1 = HomeController()
        controller1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "HomeIcon"), tag: 1)
        let nav1 = UINavigationController(rootViewController: controller1)
          nav1.navigationBar.isHidden = true
        let controller2 = AppointmentController()
        controller2.tabBarItem = UITabBarItem(title: "Consult", image: UIImage(named: "CalenderIcon"), tag: 2)
        let nav2 = UINavigationController(rootViewController: controller2)
          nav2.navigationBar.isHidden = true
        let controller3 = SearchDoctorController()
        controller3.tabBarItem = UITabBarItem(title: "", image: UIImage(named: ""), tag: 2)
        let nav3 = UINavigationController(rootViewController: controller3)
          nav3.navigationBar.isHidden = true
        let controller4 = MessageListController()
        controller4.tabBarItem = UITabBarItem(title: "Message", image: UIImage(named: "MailIcon"), tag: 4)
        let nav4 = UINavigationController(rootViewController: controller4)
          nav4.navigationBar.isHidden = true
        let controller5 = MyProfileController()
        controller5.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(named: "profile_tab"), tag: 5)
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
        tabBar.backgroundColor = UIColor(named: Colors.TextfieldBG)
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 25 * appConstant.heightRatio
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

    }
    
    
    func setupMiddleButton() {
//        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64 * appConstant.heightRatio, height: 64 * appConstant.heightRatio))
//            var menuButtonFrame = menuButton.frame
//            menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 46
//            menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
//            menuButton.frame = menuButtonFrame
//
//            menuButton.backgroundColor = hexStringToUIColor(hex: "91C167")
//            menuButton.layer.cornerRadius = menuButtonFrame.height/2
            view.addSubview(menuBtn)
        NSLayoutConstraint.activate([
            menuBtn.centerYAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0),
            menuBtn.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor, constant: 0),
            menuBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            menuBtn.widthAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
        ])

            view.layoutIfNeeded()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            viewDidLoad()

//
        
       
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

@IBDesignable class TabBarWithCorners: UITabBar {
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 15.0

    private var shapeLayer: CALayer?

    override func draw(_ rect: CGRect) {
        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0   , height: -3);
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
        

        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: 0.0))

        return path.cgPath
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame            = self.frame
        tabFrame.size.height    = 65 + (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? CGFloat.zero)
        tabFrame.origin.y       = self.frame.origin.y +   ( self.frame.height - 65 - (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? CGFloat.zero))
        self.layer.cornerRadius = 20
        self.frame            = tabFrame



        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })


    }

}

//
//  TabbarController.swift
//  HealthHub
//
//  Created by OBS on 16/12/2021.
//

import UIKit

class TabbarController: BaseController {

    lazy var BottomView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Homeimg : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.red
        btn.layer.shadowOpacity = 2
        btn.setImage(UIImage(systemName: "homekit"), for: .normal)
        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
  
    
    lazy var HometitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "Home"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var Appointmentimg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "CalenderIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var AppointmenttitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "Appointment"
        lbl.textAlignment = .center
        lbl.sizeToFit()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var Searchimg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Searchbtn")
        iv.backgroundColor = UIColor.clear
        iv.layer.cornerRadius = 32 * appConstant.heightRatio
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var SearchtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "Search"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var Messageimg : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "MailIcon"), for: .normal)
        btn.addTarget(self, action: #selector(messagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
  
    
    lazy var MessagetitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "Message"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var Settingimg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "SettingIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var SettingtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "Setting"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
    
//        Homeimg.tintColor = .blue
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(BottomView)
        BottomView.addSubview(Homeimg)
        BottomView.addSubview(HometitleLbl1)
        BottomView.addSubview(Appointmentimg)
        BottomView.addSubview(AppointmenttitleLbl1)
        BottomView.addSubview(Searchimg)
        BottomView.addSubview(SearchtitleLbl1)
        BottomView.addSubview(Messageimg)
        BottomView.addSubview(MessagetitleLbl1)
        BottomView.addSubview(Settingimg)
        BottomView.addSubview(SettingtitleLbl1)
        
        NSLayoutConstraint.activate([
            
            BottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10 * appConstant.heightRatio),
            BottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            BottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            BottomView.heightAnchor.constraint(equalToConstant: 102 * appConstant.heightRatio),
            
            Homeimg.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 24 * appConstant.heightRatio),
            Homeimg.leadingAnchor.constraint(equalTo: BottomView.leadingAnchor, constant: 37 * appConstant.widthRatio),
            Homeimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            Homeimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            HometitleLbl1.centerXAnchor.constraint(equalTo: Homeimg.centerXAnchor, constant: 0 * appConstant.heightRatio),
            HometitleLbl1.topAnchor.constraint(equalTo: Homeimg.bottomAnchor, constant: 10 * appConstant.heightRatio),
          //  HometitleLbl1.leadingAnchor.constraint(equalTo: BottomView.leadingAnchor, constant: 37 * appConstant.widthRatio),
            HometitleLbl1.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            

            Appointmentimg.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 24 * appConstant.heightRatio),
            Appointmentimg.leadingAnchor.constraint(equalTo: Homeimg.trailingAnchor, constant: 47 * appConstant.widthRatio),
            Appointmentimg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
       //     Appointmentimg.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),

            AppointmenttitleLbl1.centerXAnchor.constraint(equalTo: Appointmentimg.centerXAnchor, constant: 0 * appConstant.heightRatio),
      //      AppointmenttitleLbl1.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 12 * appConstant.heightRatio),
            AppointmenttitleLbl1.centerYAnchor.constraint(equalTo: HometitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            AppointmenttitleLbl1.leadingAnchor.constraint(equalTo: HometitleLbl1.trailingAnchor, constant: 12 * appConstant.widthRatio),
            AppointmenttitleLbl1.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),


            //
            
            Searchimg.centerYAnchor.constraint(equalTo: BottomView.topAnchor, constant: 10 * appConstant.heightRatio),
            Searchimg.centerXAnchor.constraint(equalTo: BottomView.centerXAnchor, constant: 0 * appConstant.widthRatio),
            Searchimg.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            Searchimg.widthAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),

    //        SearchtitleLbl1.topAnchor.constraint(equalTo: Searchimg.bottomAnchor, constant: 20 * appConstant.heightRatio),
            SearchtitleLbl1.leadingAnchor.constraint(equalTo: AppointmenttitleLbl1.trailingAnchor, constant: 12),
            SearchtitleLbl1.centerYAnchor.constraint(equalTo: AppointmenttitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SearchtitleLbl1.centerXAnchor.constraint(equalTo: Searchimg.centerXAnchor, constant: 0 * appConstant.heightRatio),
            SearchtitleLbl1.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            //
            
            Messageimg.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 24 * appConstant.heightRatio),
            Messageimg.leadingAnchor.constraint(equalTo: Searchimg.trailingAnchor, constant: 26 * appConstant.widthRatio),
            Messageimg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
       //     Messageimg.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),

            MessagetitleLbl1.centerXAnchor.constraint(equalTo: Messageimg.centerXAnchor, constant: 0 * appConstant.heightRatio),
      //      MessagetitleLbl1.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 12 * appConstant.heightRatio),
            MessagetitleLbl1.centerYAnchor.constraint(equalTo: SearchtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            MessagetitleLbl1.leadingAnchor.constraint(equalTo: SearchtitleLbl1.trailingAnchor, constant: 12 * appConstant.widthRatio),
            MessagetitleLbl1.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            //
            
            
            Settingimg.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 24 * appConstant.heightRatio),
            Settingimg.leadingAnchor.constraint(equalTo: Messageimg.trailingAnchor, constant: 26 * appConstant.widthRatio),
            Settingimg.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
       //     Messageimg.widthAnchor.constraint(equalToConstant: 24 * appConstant.widthRatio),

            SettingtitleLbl1.centerXAnchor.constraint(equalTo: Settingimg.centerXAnchor, constant: 0 * appConstant.heightRatio),
      //      SettingtitleLbl1.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 12 * appConstant.heightRatio),
            SettingtitleLbl1.centerYAnchor.constraint(equalTo: MessagetitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SettingtitleLbl1.leadingAnchor.constraint(equalTo: MessagetitleLbl1.trailingAnchor, constant: 12 * appConstant.widthRatio),
            SettingtitleLbl1.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            

            
    ])
        
    }
    
    @objc func messagebtn_press(){
    
        Messageimg.tintColor = .blue
        Homeimg.backgroundColor = .white
        self.navigationController?.pushViewController(MessageListController(), animated: false)
    }
    
    @objc func homebtn_press(){
        Homeimg.tintColor = .blue
        Messageimg.tintColor = .black
        self.navigationController?.pushViewController(HomeController(), animated: false)
        
    }
    
}

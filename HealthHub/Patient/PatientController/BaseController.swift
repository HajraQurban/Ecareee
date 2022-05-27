//
//  BaseController.swift
//  HealthHub
//
//  Created by OBS on 11/12/2021.
//

import UIKit
import SSCustomSideMenu


class BaseController: UIViewController {
        
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 46 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var MonthYearView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DateView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
      //  btn.setTitle("Get Started", for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var menuBtn : SSMenuButton = {
        let btn = SSMenuButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
      //  btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var headerLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 15)
        lbl.textColor = UIColor.white
        lbl.text = "Sign In"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        return lbl
    }()
    
    
   
    lazy var childView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 0
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 0
        view.layer.shadowOpacity = 0.0
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headerotop : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        MonthYearView.isHidden = true
        DateView.isHidden = true
        menuBtn.isHidden = true
        setupUI()
    }
    
    func setupUI(){
        let margin = view.layoutMarginsGuide
        view.addSubview(childView)
        view.addSubview(DateView)
        view.addSubview(MonthYearView)
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(menuBtn)
        headerView.addSubview(headerLbl)
        headerView.addSubview(headerotop)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            MonthYearView.topAnchor.constraint(equalTo: childView.topAnchor, constant: -10 * appConstant.heightRatio),
            MonthYearView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            MonthYearView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            MonthYearView.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            
            DateView.topAnchor.constraint(equalTo: MonthYearView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            DateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            DateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            DateView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            backBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -24 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),

            menuBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -24 * appConstant.heightRatio),
            menuBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26 * appConstant.heightRatio),
            menuBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            menuBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            headerLbl.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            headerLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0 * appConstant.heightRatio),
            headerLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            headerotop.bottomAnchor.constraint(equalTo: headerView.topAnchor, constant: 18 * appConstant.heightRatio),
            headerotop.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerotop.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headerotop.topAnchor.constraint(equalTo: view.topAnchor),

            childView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        
        ])
        
    }
        
    @objc func backbtn_press(){
        self.navigationController?.popViewController(animated: true)
    }
    

}

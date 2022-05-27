//
//  AddDoctorreviewController.swift
//  HealthHub
//
//  Created by Mac on 11/03/2022.
//

import UIKit
import Cosmos

class AddDoctorreviewController: BaseController {

    lazy var mainView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
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
        lbl.numberOfLines = 1
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
        lbl.font = regular(size: 13)
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
        lbl.font = regular(size: 13)
        lbl.text = "11.30"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var rateexperiencetitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "How would you rate your experience?"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var rattingView:CosmosView = {
        let rating = CosmosView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.backgroundColor = .clear
        rating.rating = 0
        rating.settings.updateOnTouch = true
        rating.settings.starSize = 18
        rating.settings.starMargin = 3
        rating.settings.filledColor = UIColor(named: Colors.PrimaryAppColor1)!
        rating.settings.emptyBorderColor = UIColor(named: Colors.PrimaryAppColor1) ?? .orange
        rating.settings.emptyColor = .lightGray
        rating.settings.filledBorderColor = UIColor(named: Colors.PrimaryAppColor1)  ?? .orange
        return rating
    }()
    
    lazy var ProvideinfoTF : UITextView = {
        let tf = UITextView()
//        tf.text = "When i woke up i feel like..."
        tf.backgroundColor = UIColor(named: Colors.TextfieldBG)
        tf.layer.cornerRadius = 18 * appConstant.heightRatio
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var HomeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Back", for: .normal)
//        btn.addTarget(self, action: #selector(homebtn_press), for: .touchUpInside)
        
        return btn
    }()
     
    lazy var submitreviewBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.TextfieldBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named: Colors.PrimaryAppColor1)?.cgColor
        btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.shadowRadius = 0
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Submit Review", for: .normal)
        btn.addTarget(self, action: #selector(addreviewBtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var notsubmitreviewBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Not now", for: .normal)
        btn.addTarget(self, action: #selector(bookBtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    var rate : Double = 0.0
    var appointment = appointdata()
    let manger = AddPatientReviewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.tintColor = .white
        ProvideinfoTF.delegate = self
        headerLbl.text = "Review"
        self.nameLbl.text  = appointment.doctor?.name ?? ""
        self.designationLbl.text = appointment.doctor?.hospital_name ?? ""
        self.dateLbl.text = appointment.slot?.date ?? ""
        self.timeLbl.text = appointment.slot?.start_time ?? ""
        
        if appointment.doctor?.url == nil
        {
            drImage.image = UIImage(named: "Profile_img")
        }
        else
        {
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + ( appointment.doctor?.url ?? ""))
            drImage.kf.setImage(with: url)
        }
        rattingView.didFinishTouchingCosmos = { rating in
              self.rate = rating
            }
        rattingView.didTouchCosmos = { rating in
              self.rate = rating
            }
        
        setup()
    }
    

    func setup()
    {
        childView.addSubview(mainView)
        mainView.addSubview(drImage)
        mainView.addSubview(drImage)
        mainView.addSubview(nameLbl)
        mainView.addSubview(designationLbl)
        mainView.addSubview(dateLbl)
        mainView.addSubview(timeLbl)
        childView.addSubview(rateexperiencetitleLbl)
        childView.addSubview(rattingView)
        childView.addSubview(ProvideinfoTF)
        childView.addSubview(submitreviewBtn)
        childView.addSubview(notsubmitreviewBtn)
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: childView.topAnchor,constant: 40 * appConstant.heightRatio),
            mainView.leadingAnchor.constraint(equalTo: childView.leadingAnchor,constant: 20 * appConstant.widthRatio),
            mainView.trailingAnchor.constraint(equalTo: childView.trailingAnchor,constant: -20 * appConstant.widthRatio),
            mainView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),

            drImage.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 6 * appConstant.heightRatio),
            drImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 6 * appConstant.widthRatio),
            drImage.widthAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
            drImage.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5 * appConstant.heightRatio),
//            drImage.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
                                              
            nameLbl.topAnchor.constraint(equalTo: mainView.topAnchor,constant: 20 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: drImage.trailingAnchor,constant: 18 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
            designationLbl.topAnchor.constraint(equalTo: nameLbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            designationLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            designationLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -4 * appConstant.widthRatio),
           
            dateLbl.bottomAnchor.constraint(equalTo: drImage.bottomAnchor,constant: 0 * appConstant.heightRatio),
            dateLbl.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor,constant: 0 * appConstant.widthRatio),
            
            timeLbl.centerYAnchor.constraint(equalTo: dateLbl.centerYAnchor,constant: 0 * appConstant.heightRatio),
            timeLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor,constant: -12 * appConstant.widthRatio),
            
            rateexperiencetitleLbl.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            rateexperiencetitleLbl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            rateexperiencetitleLbl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            rattingView.topAnchor.constraint(equalTo: rateexperiencetitleLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            rattingView.leadingAnchor.constraint(equalTo: rateexperiencetitleLbl.leadingAnchor),
            rattingView.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            ProvideinfoTF.topAnchor.constraint(equalTo: rattingView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            ProvideinfoTF.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            ProvideinfoTF.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            ProvideinfoTF.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),

//            submitreviewBtn.topAnchor.constraint(equalTo: ProvideinfoTF.bottomAnchor, constant: 50 * appConstant.heightRatio),
            submitreviewBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            submitreviewBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            submitreviewBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            notsubmitreviewBtn.topAnchor.constraint(equalTo: submitreviewBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            notsubmitreviewBtn.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            notsubmitreviewBtn.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            notsubmitreviewBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            notsubmitreviewBtn.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -40 * appConstant.heightRatio),

        
        ])
    }
    
    override func backbtn_press() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func bookBtn_press(){
     
        let vc = CustomTabBarController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    
    }
    
    @objc func addreviewBtn_press(){
        
        if rate == 0.0
        {
        let parameters: [String: Any] = ["doctor_id" : appointment.doctor?.id as Any,
                                         "description" : ProvideinfoTF.text ?? "",
                                               "stars" : rate as Double,
      ]
        DispatchQueue.main.async {
        ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        manger.addreview(params: parameters) { [self] msg, hasError in
            DispatchQueue.main.async {
            ActivityIndicator.shared.removeSpinner()
            }
        if hasError{
            print(hasError)
            alertWithMsg(vc: self, msg: msg, title: "Error!")
        }else{
            print(msg)
            let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)

               // Create the actions
            let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) {
                   UIAlertAction in
                
                ProvideinfoTF.text = ""
                rattingView.rating = 0
                let vc = CustomTabBarController()
                let rootNC = UINavigationController(rootViewController: vc)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                   NSLog("OK Pressed")
               }

               // Add the actions
               alertController.addAction(okAction)

               // Present the controller
            self.present(alertController, animated: true, completion: nil)
            
            
          
           
        }
    }
        }
        else{
            alertWithMsg(vc: self, msg: "Rate the Appointment First!", title: "Alert!")
        }
    
    }
    
}

extension AddDoctorreviewController : UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == ProvideinfoTF{
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
              return newText.count <= 150
        }
       return true
    }
    
}

//
//  SignupController.swift
//  HealthHub
//
//  Created by OBS on 24/12/2021.
//

import UIKit
import FlagPhoneNumber
import Alamofire
//import RSLoadingView


var imageName1 : UIImage?

class SignupController: BaseController {

    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.translatesAutoresizingMaskIntoConstraints = false
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var registerLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "Register your account"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PerimgView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(named: Colors.PrimaryAppColor1)?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 49 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Perimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "MaskIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var PerimgBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 15 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "MaskEdit"), for: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(PerimgBtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var nameTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Full Name"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var nameTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: Jon Snow"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var EmailTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Email"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var EmailTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: yourname@email.com"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.keyboardType  = .emailAddress
        tf.autocorrectionType = .no
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var PhonenumTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var phonenumTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Phone Number"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var PhoneNumbTF : FPNTextField = {
        let tf = FPNTextField()
        tf.placeholder = "000 - 000 - 0000"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var femaleBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(radiofbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var maleBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(radiombtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var DOBTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DOBtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Date of Birth"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DOBTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "dd/mm/yyyy"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var DOBBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.tintColor = .black
        btn.setImage(UIImage(named: "CalenderIcon"), for: .normal)
        btn.addTarget(self, action: #selector(dobbtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var Gendertitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Gender"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var radiofBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(radiofbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var fradiotitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Female"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var radiomBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "checkedIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(radiombtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var mradiotitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "Male"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var addressTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addressTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Address"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var addressTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "E,g: House#, Street#, City Name"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var TypeTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Typetitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "User Type"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var TypeTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Patient"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    lazy var passwordTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Password"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var passwordTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Atleast 8 alphabets and 1 special character"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var passwordIcon : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.tintColor =  UIColor(named: Colors.TextColor)
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "EyeIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(passhiddenbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var confirmpasswordTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var confirmpasswordTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Confirm Password"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var confirmpasswordTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Please enter matching password"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var confirmpasswordIcon : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.tintColor =  UIColor(named: Colors.TextColor)
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "EyeIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(confirmpasshiddenbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    
    lazy var requestoptmobileBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "checkedIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(radiomobilebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var requestoptptitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Request OTP on mobile"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var requestemailBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(radioemailbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var requestemailtitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Request OTP on email"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var SignupBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Sign up", for: .normal)
        btn.addTarget(self, action: #selector(signupbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var alreadyaccounttitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Already have an account?"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SigninBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont(name:"SFProDisplay-SemiBold", size: 13.0 * appConstant.heightRatio)
        btn.setTitle("Sign in", for: .normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(signinbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    //Create a DatePicker
    let datePicker: UIDatePicker = UIDatePicker()
    
    var radioF = "Male"
    var contact_method = "Email"
    var imgtoggle:Bool = true
    var imgtoggle1:Bool = false
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    let manager = signupManagers()
//    let loadingView = RSLoadingView()
    
    var tapChangeState: UITapGestureRecognizer!
    var imagePicker = UIImagePickerController() // instantiates an image picker controller.
    let calendar = Calendar(identifier: .gregorian)
    let currentDate = Date()
    var components = DateComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        backBtn.tintColor = .white
        childView.backgroundColor = UIColor(named: Colors.AppBGColor)
        containerView.backgroundColor = UIColor(named: Colors.AppBGColor)

        PhoneNumbTF.delegate = self
        nameTF.delegate = self
        EmailTF.delegate = self
        addressTF.delegate = self
        passwordTF.delegate = self
        confirmpasswordTF.delegate = self
    
        PhoneNumbTF.flagButton.isUserInteractionEnabled = true
     //   PhoneNumbTF.setCountries(including: [.FR, .ES, .IT, .BE, .LU, .DE])
     //   PhoneNumbTF.setCountries(excluding: [.AD, .AE, .AF])
      //  PhoneNumbTF.pickerView.showCountryPhoneCode = false // true by default
        listController.showCountryPhoneCode = false // true by default
       
        EmailTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .allEvents)
        nameTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .allEvents)
        PhoneNumbTF.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .allEvents)
        
        
        imagePicker.delegate  = self // setup the view controller as the image picker delegate.
        imagePicker.allowsEditing = false // disable image editing by the user
      //  imagePicker.sourceType = UIImagePickerController.SourceType.camera // set source as camera
      //  imagePicker.cameraDevice = UIImagePickerController.CameraDevice.rear // use rear camera

               // setting up gesture recognizer
//        tapChangeState.numberOfTouchesRequired = 0 // number of fingers required for change state detection
//        tapChangeState.numberOfTapsRequired = 1

        
        view.backgroundColor = .white
        headerLbl.text = "Sign up"
        createdatepicker()
        setup()
        initializeHideKeyboard()
        
        //
        passwordIcon.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        passwordTF.isSecureTextEntry = true
        confirmpasswordIcon.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        confirmpasswordTF.isSecureTextEntry = true
        
        TypeTF.text = "Patient"
        TypeTF.isUserInteractionEnabled = false
    }
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(registerLbl)
       
        containerView.addSubview(PerimgView)
        PerimgView.addSubview(Perimg)
        containerView.addSubview(PerimgBtn)
        
        containerView.addSubview(nameTextFieldView)
        containerView.addSubview(nameTftitlelbl)
        containerView.addSubview(nameTF)
        
        containerView.addSubview(EmailTextFieldView)
        containerView.addSubview(emailTftitlelbl)
        containerView.addSubview(EmailTF)
        
        containerView.addSubview(PhonenumTextFieldView)
        containerView.addSubview(phonenumTftitlelbl)
        containerView.addSubview(PhoneNumbTF)
        
        containerView.addSubview(DOBTextFieldView)
        containerView.addSubview(DOBtitlelbl)
       
        containerView.addSubview(DOBBtn)
        containerView.addSubview(DOBTF)
        
        containerView.addSubview(Gendertitlelbl)
        //
        containerView.addSubview(radiofBtn)
        containerView.addSubview(fradiotitlelbl)
        containerView.addSubview(radiomBtn)
        containerView.addSubview(mradiotitlelbl)
        containerView.addSubview(maleBtn)
        containerView.addSubview(femaleBtn)
        containerView.addSubview(addressTextFieldView)
        containerView.addSubview(addressTftitlelbl)
        containerView.addSubview(addressTF)
        
        containerView.addSubview(TypeTextFieldView)
        containerView.addSubview(Typetitlelbl)
        containerView.addSubview(TypeTF)
        
        containerView.addSubview(passwordTextFieldView)
        containerView.addSubview(passwordTftitlelbl)
        containerView.addSubview(passwordTF)
        containerView.addSubview(passwordIcon)
        
        
        
        containerView.addSubview(confirmpasswordTextFieldView)
        containerView.addSubview(confirmpasswordTftitlelbl)
        containerView.addSubview(confirmpasswordTF)
        containerView.addSubview(confirmpasswordIcon)
        
        containerView.addSubview(requestoptmobileBtn)
        containerView.addSubview(requestoptptitlelbl)
        
        containerView.addSubview(requestemailBtn)
        containerView.addSubview(requestemailtitlelbl)
        
        containerView.addSubview(SignupBtn)
        containerView.addSubview(alreadyaccounttitlelbl)
        containerView.addSubview(SigninBtn)
        
        
        
        NSLayoutConstraint.activate([
        
            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: childView.topAnchor),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            registerLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 59 * appConstant.heightRatio),
            registerLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 21 * appConstant.heightRatio),
            registerLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            PerimgView.topAnchor.constraint(equalTo: registerLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PerimgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 139 * appConstant.widthRatio),
         //   PerimgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -139 * appConstant.widthRatio),
            PerimgView.heightAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            PerimgView.widthAnchor.constraint(equalToConstant: 98 * appConstant.heightRatio),
            
            
            Perimg.topAnchor.constraint(equalTo: PerimgView.topAnchor, constant: 0 * appConstant.heightRatio),
            Perimg.leadingAnchor.constraint(equalTo: PerimgView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.trailingAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            Perimg.bottomAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            
            PerimgBtn.centerYAnchor.constraint(equalTo: PerimgView.centerYAnchor, constant: 28 * appConstant.heightRatio),
            PerimgBtn.centerXAnchor.constraint(equalTo: PerimgView.trailingAnchor,constant: -7 * appConstant.widthRatio),
            PerimgBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            PerimgBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            
            
            nameTextFieldView.topAnchor.constraint(equalTo: PerimgView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            nameTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            nameTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            nameTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            nameTftitlelbl.topAnchor.constraint(equalTo: nameTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            nameTftitlelbl.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            nameTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            nameTF.topAnchor.constraint(equalTo: nameTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            nameTF.leadingAnchor.constraint(equalTo: nameTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            nameTF.trailingAnchor.constraint(equalTo: nameTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),

            nameTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            

            EmailTextFieldView.topAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            EmailTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            EmailTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            EmailTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            emailTftitlelbl.topAnchor.constraint(equalTo: EmailTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            emailTftitlelbl.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            emailTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            EmailTF.topAnchor.constraint(equalTo: emailTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            EmailTF.leadingAnchor.constraint(equalTo: EmailTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            EmailTF.trailingAnchor.constraint(equalTo: EmailTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),

            EmailTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            
            PhonenumTextFieldView.topAnchor.constraint(equalTo: EmailTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            PhonenumTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            PhonenumTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            PhonenumTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            phonenumTftitlelbl.topAnchor.constraint(equalTo: PhonenumTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            phonenumTftitlelbl.leadingAnchor.constraint(equalTo: PhonenumTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            phonenumTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            PhoneNumbTF.topAnchor.constraint(equalTo: phonenumTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            PhoneNumbTF.leadingAnchor.constraint(equalTo: PhonenumTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            PhoneNumbTF.trailingAnchor.constraint(equalTo: PhonenumTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            PhoneNumbTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            DOBTextFieldView.topAnchor.constraint(equalTo: PhonenumTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DOBTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DOBTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            DOBtitlelbl.topAnchor.constraint(equalTo: DOBTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            DOBtitlelbl.leadingAnchor.constraint(equalTo: DOBTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBtitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            

            DOBTF.topAnchor.constraint(equalTo: DOBtitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            DOBTF.leadingAnchor.constraint(equalTo: DOBTextFieldView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DOBTF.trailingAnchor.constraint(equalTo: DOBTextFieldView.trailingAnchor, constant: -10 * appConstant.widthRatio),

            DOBTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            DOBBtn.topAnchor.constraint(equalTo: DOBTextFieldView.topAnchor, constant: 30 * appConstant.heightRatio),
            DOBBtn.trailingAnchor.constraint(equalTo: DOBTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DOBBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            DOBBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            Gendertitlelbl.topAnchor.constraint(equalTo: DOBTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            Gendertitlelbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 39 * appConstant.widthRatio),
            Gendertitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
           
            //
            radiofBtn.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            radiofBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            radiofBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            radiofBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            
            fradiotitlelbl.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            fradiotitlelbl.leadingAnchor.constraint(equalTo: radiofBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            fradiotitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            fradiotitlelbl.centerYAnchor.constraint(equalTo: radiofBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            
            // the male cre
            
            radiomBtn.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            radiomBtn.leadingAnchor.constraint(equalTo: fradiotitlelbl.trailingAnchor, constant: 90 * appConstant.widthRatio),
            radiomBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            radiomBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            
            femaleBtn.topAnchor.constraint(equalTo: radiofBtn.topAnchor, constant: 4 * appConstant.heightRatio),
            femaleBtn.leadingAnchor.constraint(equalTo: radiofBtn.leadingAnchor, constant: 4 * appConstant.widthRatio),
            femaleBtn.trailingAnchor.constraint(equalTo: fradiotitlelbl.trailingAnchor, constant: 4 * appConstant.heightRatio),
            femaleBtn.bottomAnchor.constraint(equalTo: radiofBtn.bottomAnchor, constant: 4 * appConstant.widthRatio),
            
            maleBtn.topAnchor.constraint(equalTo: radiomBtn.topAnchor, constant: 4 * appConstant.heightRatio),
            maleBtn.leadingAnchor.constraint(equalTo: radiomBtn.leadingAnchor, constant: 4 * appConstant.widthRatio),
            maleBtn.trailingAnchor.constraint(equalTo: mradiotitlelbl.trailingAnchor, constant: 4 * appConstant.heightRatio),
            maleBtn.bottomAnchor.constraint(equalTo: radiomBtn.bottomAnchor, constant: 4 * appConstant.widthRatio),
            
            mradiotitlelbl.topAnchor.constraint(equalTo: Gendertitlelbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            mradiotitlelbl.leadingAnchor.constraint(equalTo: radiomBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            mradiotitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            mradiotitlelbl.centerYAnchor.constraint(equalTo: radiomBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            

            //
            addressTextFieldView.topAnchor.constraint(equalTo: radiofBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            addressTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            addressTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            addressTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            addressTftitlelbl.topAnchor.constraint(equalTo: addressTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            addressTftitlelbl.leadingAnchor.constraint(equalTo: addressTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            addressTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            addressTF.topAnchor.constraint(equalTo: addressTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            addressTF.leadingAnchor.constraint(equalTo: addressTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            addressTF.trailingAnchor.constraint(equalTo: addressTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),

            addressTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            
            TypeTextFieldView.topAnchor.constraint(equalTo: addressTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            TypeTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            TypeTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            TypeTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            Typetitlelbl.topAnchor.constraint(equalTo: TypeTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            Typetitlelbl.leadingAnchor.constraint(equalTo: TypeTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            Typetitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            TypeTF.topAnchor.constraint(equalTo: Typetitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            TypeTF.leadingAnchor.constraint(equalTo: TypeTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            TypeTF.trailingAnchor.constraint(equalTo: TypeTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),

            TypeTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
//
            passwordTextFieldView.topAnchor.constraint(equalTo: TypeTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            passwordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            passwordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            passwordTftitlelbl.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            passwordTftitlelbl.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            passwordTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            passwordTF.topAnchor.constraint(equalTo: passwordTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            passwordTF.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            passwordTF.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -40 * appConstant.heightRatio),
            passwordTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            passwordIcon.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            passwordIcon.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            passwordIcon.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
            passwordIcon.widthAnchor.constraint(equalToConstant: 22 * appConstant.widthRatio),

            
            //
            confirmpasswordTextFieldView.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            confirmpasswordTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            confirmpasswordTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            confirmpasswordTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            confirmpasswordTftitlelbl.topAnchor.constraint(equalTo: confirmpasswordTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
            confirmpasswordTftitlelbl.leadingAnchor.constraint(equalTo: confirmpasswordTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            confirmpasswordTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            confirmpasswordTF.topAnchor.constraint(equalTo: confirmpasswordTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            confirmpasswordTF.leadingAnchor.constraint(equalTo: confirmpasswordTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            confirmpasswordTF.trailingAnchor.constraint(equalTo: confirmpasswordTextFieldView.trailingAnchor, constant: -40 * appConstant.heightRatio),

            confirmpasswordTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            
            confirmpasswordIcon.centerYAnchor.constraint(equalTo: confirmpasswordTextFieldView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            confirmpasswordIcon.trailingAnchor.constraint(equalTo: confirmpasswordTextFieldView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            confirmpasswordIcon.heightAnchor.constraint(equalToConstant: 22 * appConstant.heightRatio),
            confirmpasswordIcon.widthAnchor.constraint(equalToConstant: 22 * appConstant.widthRatio),


            
            
            requestoptmobileBtn.topAnchor.constraint(equalTo: confirmpasswordTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            requestoptmobileBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            requestoptmobileBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            requestoptmobileBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            
            
            requestoptptitlelbl.leadingAnchor.constraint(equalTo: requestoptmobileBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            requestoptptitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            requestoptptitlelbl.centerYAnchor.constraint(equalTo: requestoptmobileBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
//            requestoptptitlelbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
            //
            requestemailBtn.topAnchor.constraint(equalTo: requestoptmobileBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            requestemailBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40 * appConstant.widthRatio),
            requestemailBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            requestemailBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            //
            
            
            requestemailtitlelbl.leadingAnchor.constraint(equalTo: requestemailBtn.trailingAnchor, constant: 10 * appConstant.widthRatio),
            requestemailtitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            requestemailtitlelbl.centerYAnchor.constraint(equalTo: requestemailBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            
            SignupBtn.topAnchor.constraint(equalTo: requestemailtitlelbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            SignupBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            SignupBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SignupBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
//            SignupBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio ),
            
            
//
            alreadyaccounttitlelbl.topAnchor.constraint(equalTo: SignupBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            alreadyaccounttitlelbl.leadingAnchor.constraint(equalTo: SignupBtn.leadingAnchor, constant: 50 * appConstant.widthRatio),
            alreadyaccounttitlelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            SigninBtn.centerYAnchor.constraint(equalTo: alreadyaccounttitlelbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SigninBtn.leadingAnchor.constraint(equalTo: alreadyaccounttitlelbl.trailingAnchor, constant: 2 * appConstant.heightRatio),
//            SigninBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -90 * appConstant.heightRatio),
            alreadyaccounttitlelbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio ),
            
        ])
        
        
    }
    
    func createtoolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace,btn], animated: true)
        
        return toolbar
    }
    
    @objc func donepressed()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        DOBTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func createdatepicker()
    {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        var minDateComponent = calendar.dateComponents([.day,.month,.year], from: Date())
        minDateComponent.day = 01
        minDateComponent.month = 01
        minDateComponent.year = 1900

        let minDate = calendar.date(from: minDateComponent)

        datePicker.minimumDate = minDate
        datePicker.maximumDate = currentDate
        DOBTF.inputView = datePicker
        DOBTF.inputAccessoryView = createtoolbar()
        
       
    }
    
    
    @objc func dobbtn_press(_ sender: UIButton)
    {
        
        createdatepicker()
        DOBTF.inputView = datePicker
        DOBTF.inputAccessoryView = createtoolbar()
    
    }
    
    func initializeHideKeyboard(){
    //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(
    target: self,
    action: #selector(dismissMyKeyboard))
    //Add this tap gesture recognizer to the parent view
    containerView.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissMyKeyboard(){
    //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
    //In short- Dismiss the active keyboard.
    view.endEditing(true)
    }
    
    
    @objc func passhiddenbtn_press(){

        imgtoggle1 = !imgtoggle1
           if imgtoggle1 {
               passwordIcon.setImage(UIImage(named: "EyeIcon"), for: .normal)
               passwordTF.isSecureTextEntry = false

           } else {
               passwordIcon.setImage(UIImage(systemName: "eye.slash"), for: .normal)
               passwordTF.isSecureTextEntry = true
           }
        
    }
    

    
    @objc func confirmpasshiddenbtn_press(){

        imgtoggle1 = !imgtoggle1
           if imgtoggle1 {
               confirmpasswordIcon.setImage(UIImage(named: "EyeIcon"), for: .normal)
               confirmpasswordTF.isSecureTextEntry = false

           } else {
               confirmpasswordIcon.setImage(UIImage(systemName: "eye.slash"), for: .normal)
               confirmpasswordTF.isSecureTextEntry = true
           }
        
    }
    
    
    @objc func radiofbtn_press(){

        imgtoggle = !imgtoggle
           if imgtoggle {
            radioF = "Female"
            radiofBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiomBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)


           } else {
            radioF = "Male"
            radiomBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiofBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)

           }
        
        print("The Selected Gender is\(radioF)")

    }
    

    
    
    @objc func radiombtn_press(){
        
        imgtoggle = !imgtoggle
           if imgtoggle {
            radioF = "Female"
            radiofBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiomBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)


           } else {
            radioF = "Male"
            radiomBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            radiofBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)

           }
        
        print("The Selected Gender is\(radioF)")

    }
    
    
    
    
    
    @objc func radiomobilebtn_press(){
        
        imgtoggle = !imgtoggle
           if imgtoggle {
            contact_method = "Phone"
            requestoptmobileBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            requestemailBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)


           } else {
            contact_method = "Email"
//            requestemailBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            requestoptmobileBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)

           }
        
        print("The Selected Gender is\(contact_method)")

    }
    
    @objc func radioemailbtn_press(){
        
        imgtoggle = !imgtoggle
           if imgtoggle {
            contact_method = "Phone"
//            requestoptmobileBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
            requestemailBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)


           } else {
            contact_method = "Email"
            requestemailBtn.setImage(UIImage(named: "checkedIcon"), for: .normal)
//            requestoptmobileBtn.setImage(UIImage(named: "UnCheckedIcon"), for: .normal)

           }
        
        print("The Selected Gender is\(contact_method)")

    }
   
    
    @objc func signupbtn_press()
    {
       // self.navigationController?.pushViewController(DoctorCategoryController(), animated: true)
        SignupRequest()
    }
    @objc func PerimgBtn_press()
    {
//        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
//        imagePicker.delegate = self
//        self.present(imagePicker, animated: true)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
          imagePicker.delegate = self
          imagePicker.sourceType = .photoLibrary
          imagePicker.allowsEditing = false

          present(imagePicker, animated: true, completion: nil)
          }
    }
    
    @objc func signinbtn_press()
    {
        self.navigationController?.pushViewController(SigninController(), animated: true)

    }
    
    func SignupRequest()
    {
        let valid = validate()
        if !valid.1{
            alertWithMsg(vc: self, msg: valid.0 ?? "All fields requird", title: "Error!")
        }
        else
        {
        let parameters: [String: AnyObject] = ["name" : nameTF.text as AnyObject,
          "email" : EmailTF.text as AnyObject,
          "password" : passwordTF.text as AnyObject,
          "password_confirmation" : confirmpasswordTF.text as AnyObject,
          "contact" : PhoneNumbTF.text as AnyObject,
          "gender" : radioF as AnyObject,
          "address" : addressTF.text as AnyObject,
          "date_of_birth" : DOBTF.text as AnyObject,
          "type" : "Patient" as AnyObject
       //   "image" : name as AnyObject?
      ]
       //     loadingView.show(on: view)
            ActivityIndicator.shared.showSpinner(onView: self.view)
      //  let headers: [String: AnyObject] = ["Accept": "application/json"]
        
        manager.signup(params: parameters) { msg, hasError in
            ActivityIndicator.shared.removeSpinner()
         //   RSLoadingView.hide(from: self.view)
            if hasError{

                alertWithMsg(vc: self, msg: msg, title: "Alert!")
               
            }else{
              //  alertWithMsg(vc: self, msg: msg, title: "Alert!")
                let vc = SigninController()
//                vc.isfromdoctorSignup = "DoctorSignup"
                vc.type = "Patient"
                self.navigationController?.pushViewController(vc, animated: true)

            }
        }
            
    }
        
           
     }
    
}
    
   
    



extension SignupController: FPNTextFieldDelegate {

   /// The place to present/push the listController if you choosen displayMode = .list
   func fpnDisplayCountryList() {
//      let navigationViewController = UINavigationController(rootViewController: listController)
//
//      listController.title = "Countries"
//      present(navigationViewController, animated: true, completion: nil)
   }

   /// Lets you know when a country is selected
   func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
      print(name, dialCode, code) // Output "France", "+33", "FR"
   }

   /// Lets you know when the phone number is valid or not. Once a phone number is valid, you can get it in severals formats (E164, International, National, RFC3966)
   func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
      if isValid {
         // Do something...
//         textField.getFormattedPhoneNumber(format: .E164)           // Output "+33600000001"
//         textField.getFormattedPhoneNumber(format: .International)  // Output "+33 6 00 00 00 01"
//         textField.getFormattedPhoneNumber(format: .National)       // Output "06 00 00 00 01"
//         textField.getFormattedPhoneNumber(format: .RFC3966)        // Output "tel:+33-6-00-00-00-01"
//         textField.getRawPhoneNumber()                               // Output "600000001"
      } else {
         // Do something...
//          PhoneNumbTF.displayMode = .list // .picker by default
//
//          listController.setup(repository: textField.countryRepository)
//          listController.didSelect = { [weak self] country in
//          self?.PhoneNumbTF.setFlag(countryCode: country.code)

//      }
   }
    
    
   }
    
}


//textfield delegates
extension SignupController:UITextFieldDelegate{
    
    @objc
    func textFieldDidChange(textField: UITextField) {
       if textField == nameTF
        {
           if textField.text!.count > 3{
             //  NameValidationIcon.isHidden = false
           }
           else
           {
             //  NameValidationIcon.isHidden = true
           }
       }
        else if textField == EmailTF
        {
            if Helper.validateEmail(EmailTF.text!) {
            }
            else
            {
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTF{
            EmailTF.becomeFirstResponder()
        }
        else if textField == EmailTF{
            PhoneNumbTF.becomeFirstResponder()
        }
        else if textField == PhoneNumbTF{
            DOBTF.becomeFirstResponder()
        }
        else if textField == DOBTF{
            addressTF.becomeFirstResponder()
        }
        else if textField == addressTF{
            passwordTF.becomeFirstResponder()
        }
        else if textField == passwordTF{
            confirmpasswordTF.becomeFirstResponder()
        }
        
        else{
            view.endEditing(true)
        }
       return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.reloadInputViews()
        return true
    }
    
}


extension SignupController
{
    func validate() -> (String?, Bool) {
        let name = nameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = EmailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phonenumber = PhoneNumbTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let DOB = DOBTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let addres = addressTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
      //  let type = TypeTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)

        let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let conpassword = confirmpasswordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)



        if name!.count  == 0 {
            return("Name is required.", false)
        }
        
        if email?.count == 0 {
            return("Email is required.", false)
        }
        if !Helper.validateEmail(EmailTF.text!) {
            return("Please enter correct email.", false)
        }
        if phonenumber!.count  == 0  {
            return("phone Number is required.", false)
        }
//        if phonenumber!.count  <= 9  {
//            return("Enter the Correct phone Number.", false)
//        }
        if DOB?.count == 0 {
            return("Date of Birth is required.", false)
        }
        if addres?.count == 0 {
            return("Address Field is required.", false)
        }
//        if type?.count == 0 {
//            return("Type Field is required.", false)
//        }
        if password?.count == 0 {
            return("Password is required.", false)
        }
        if conpassword?.count == 0 {
            return("Confirm Password is required.", false)
        }
        
        if imageName1 == nil {
            return("Please Add image ", false)
        }
        return(nil,true)
    }
    
}



extension SignupController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - ImagePicker Delegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           picker.dismiss(animated: true, completion: nil)
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
               Perimg.image = image

           //    let imageURL = info[UIImagePickerController.InfoKey.referenceURL] as! NSURL
               imageName1 = image
               if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                       editimagenameof = url.lastPathComponent
                     //  fileType = url.pathExtension
                   }
               
           }

       }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}

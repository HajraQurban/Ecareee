//
//  CompleteProfileController.swift
//  HealthHub
//
//  Created by OBS on 14/01/2022.
//

import UIKit

class CompleteProfileController: BaseController {
    
    lazy var heading : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Congrats Richard !"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var descLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 24)
        lbl.text = "We are all set! You can go on book  an appointment"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Homelogo : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Onboarding2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var SearchDocView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    lazy var SearchTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var searchBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "SearchIcon"), for: .normal)
        btn.isHidden = true
    //    btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var searchTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search doctor, symptom, etc"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isHidden = true
        tf.isUserInteractionEnabled = false
        return tf
    }()
    
    lazy var voiceBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.10
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowRadius = 18 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "Micbtn"), for: .normal)
        btn.isHidden = true
   //     btn.addTarget(self, action: #selector(croosbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var DocTypeCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentMode = .scaleToFill
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        return  collectionView
    }()
    
    var DoctypeArray : [String] = ["Dental care","Urology","Oftalmology","Oncology"]
    
    lazy var getstartedBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Home", for: .normal)
        btn.addTarget(self, action: #selector(homehbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var signinBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(named: Colors.AppColor), for: .normal)
        btn.titleLabel?.font = bold(size: 15)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.setTitle("Cancel", for: .normal)
        btn.layer.borderWidth = 1  * appConstant.heightRatio
        btn.layer.borderColor =  UIColor(named:Colors.AppColor)?.cgColor
        btn.addTarget(self, action: #selector(cancelbtn_press), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    
    var EmerData = symptopdata
    let manager = PostSypmtopsDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLbl.text = "Profile"
        heading.text = "Congrats \(AppUserDefault.shared.username ?? "")!"
        setupofUI()
        DocTypeCV.delegate = self
        DocTypeCV.dataSource = self
        DocTypeCV.register(DocTypeCVCell.self, forCellWithReuseIdentifier: DocTypeCVCell.identifier)
       
    }
    
    func setupofUI(){
        let margin = view.layoutMarginsGuide
        view.addSubview(heading)
        view.addSubview(descLbl)
        view.addSubview(Homelogo)
        view.addSubview(SearchDocView)
        view.addSubview(SearchTextFieldView)
        view.addSubview(searchBtn)
        view.addSubview(searchTF)
        view.addSubview(voiceBtn)
        view.addSubview(DocTypeCV)
        view.addSubview(getstartedBtn)
        view.addSubview(signinBtn)
    
    
        NSLayoutConstraint.activate([
            
            
            heading.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 40 * appConstant.heightRatio),
            heading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21 * appConstant.heightRatio),
            heading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21 * appConstant.heightRatio),

            heading.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            descLbl.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 10 * appConstant.heightRatio),
            descLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21 * appConstant.heightRatio),
            descLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19 * appConstant.heightRatio),
            
            
            Homelogo.topAnchor.constraint(equalTo: descLbl.bottomAnchor, constant: 15 * appConstant.heightRatio),
            Homelogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31 * appConstant.heightRatio),
            Homelogo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31 * appConstant.heightRatio),
            Homelogo.heightAnchor.constraint(equalToConstant: 180 * appConstant.heightRatio),

            
            SearchDocView.topAnchor.constraint(equalTo: Homelogo.topAnchor, constant: 100 * appConstant.heightRatio),
            SearchDocView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.heightRatio),
            SearchDocView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SearchDocView.heightAnchor.constraint(equalToConstant: 159 * appConstant.heightRatio),
            
            SearchTextFieldView.topAnchor.constraint(equalTo: SearchDocView.topAnchor, constant: 30 * appConstant.heightRatio),
            SearchTextFieldView.leadingAnchor.constraint(equalTo: SearchDocView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            SearchTextFieldView.trailingAnchor.constraint(equalTo: SearchDocView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SearchTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            searchBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            searchBtn.leadingAnchor.constraint(equalTo: SearchTextFieldView.leadingAnchor, constant: 10 * appConstant.heightRatio),
            searchBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            searchBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            searchTF.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            searchTF.leadingAnchor.constraint(equalTo: searchBtn.trailingAnchor, constant: 8 * appConstant.heightRatio),
            searchTF.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -136 * appConstant.heightRatio),
            searchTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
          //  CrossBtn.centerYAnchor.constraint(equalTo: searchTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
            voiceBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 0 * appConstant.heightRatio),
            voiceBtn.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: 15 * appConstant.heightRatio),
            voiceBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            voiceBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            DocTypeCV.topAnchor.constraint(equalTo: SearchTextFieldView.bottomAnchor, constant: 14 * appConstant.heightRatio),
            DocTypeCV.leadingAnchor.constraint(equalTo: SearchDocView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DocTypeCV.trailingAnchor.constraint(equalTo: SearchDocView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            DocTypeCV.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
        
            
            getstartedBtn.topAnchor.constraint(equalTo: SearchDocView.bottomAnchor, constant: 19 * appConstant.heightRatio),
            getstartedBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 21 * appConstant.widthRatio),
            getstartedBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -19 * appConstant.widthRatio),
            getstartedBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            signinBtn.topAnchor.constraint(equalTo: getstartedBtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
            signinBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            signinBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            signinBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            ])
        
        
    }
    
    @objc func homehbtn_press(){
        let vc = CustomTabBarController()
        let rootNC = UINavigationController(rootViewController: vc)
        rootNC.navigationBar.isHidden = true
        UIApplication.shared.windows.first?.rootViewController = rootNC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
//         self.navigationController?.pushViewController(CustomTabBarController(), animated: true)
    }
    
    @objc func cancelbtn_press(){
        
    }
    
    
    func postsymptop(){
        
        let parameters: [String: AnyObject] = ["symptom_id" : EmerData![0].symptom_id as AnyObject,
                                               "complaint_name" : EmerData![0].complaint_name as AnyObject,
                                               "starting_date" : EmerData![0].starting_date as AnyObject,
                                               "description" : EmerData![0].description1 as AnyObject,
                                               "doctor_id" : EmerData![0].doctor_id as AnyObject,
                                               "slots_id" : slootid as AnyObject,
                                               "appoinment_type" : appointtype as AnyObject,
                                               
          "smoke" : smoke as AnyObject,
          "diabetes" : diabetes as AnyObject,
          "asthma" : epilepsy as AnyObject,
          "allergic" :  allergy as AnyObject,
         "diagnosed_diabetes" :  diabetes2 as AnyObject,
        "diagnosed_heart" :  heart as AnyObject,
        "diagnosed_kidney" :  kindny as AnyObject,
        "diagnosed_arthritis" :  arthistics as AnyObject,
        "diagnosed_pulmonary" :  pulmonary as AnyObject,
        "diagnosed_eating" :  eatingdisorder as AnyObject,
      ]
        
        ActivityIndicator.shared.showSpinner(onView: self.view)
    manager.postsymptopdata(params: parameters) { msg, hasError in
        ActivityIndicator.shared.removeSpinner()
        if hasError{
            print(hasError)
            ActivityIndicator.shared.removeSpinner()
            alertWithMsg(vc: self, msg: msg, title: "Error!")
        }else{
            print(msg)
            ActivityIndicator.shared.removeSpinner()
           
            print("Success")
            // Create the alert controller
            let alertController = UIAlertController(title: "Alert", message: "Appointment Created Successfully", preferredStyle: .alert)
               // Create the actions
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
                   UIAlertAction in
                ActivityIndicator.shared.removeSpinner()
                let vc1 = CustomTabBarController()
                let rootNC = UINavigationController(rootViewController: vc1)
                rootNC.navigationBar.isHidden = true
                UIApplication.shared.windows.first?.rootViewController = rootNC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
               }
               // Add the actions
               alertController.addAction(okAction)

               // Present the controller
            self.present(alertController, animated: true, completion: nil)
            ActivityIndicator.shared.removeSpinner()
        }
    }
        
    }
    

}


extension CompleteProfileController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return DoctypeArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = DocTypeCV.dequeueReusableCell(withReuseIdentifier: DocTypeCVCell.identifier, for: indexPath) as! DocTypeCVCell
        cell.illnesstitlelbl.text = DoctypeArray[indexPath.row]
    //    cell.backgroundColor = .filterUnSelect
        return cell
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.navigationController?.pushViewController(EditProfileController(), animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let size: CGSize = DoctypeArray[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.0 * appConstant.widthRatio)])
        return CGSize(width:(size.width + 20 * appConstant.heightRatio) , height: 30 * appConstant.heightRatio)
   
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      
        return 8 * appConstant.widthRatio
    
    }
    
    
}

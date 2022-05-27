//
//  DoctorCategoryVSbController.swift
//  HealthHub
//
//  Created by OBS on 14/01/2022.
//

import UIKit

class DoctorCategoryVSbController: UIViewController {

    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.translatesAutoresizingMaskIntoConstraints = false
        
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius  = 25 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Categorylogo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var findspecilisttitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .left
        lbl.font = bold(size: 36)
        lbl.text = "Find your specialist"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
      //  btn.setTitle("Get Started", for: .normal)
     //   btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var SearchTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var searchBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "SearchIcon"), for: .normal)
  //      btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var diseaseTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Pulmonology"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var CrossBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "ClearIcon"), for: .normal)
    //    btn.addTarget(self, action: #selector(croosbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var SearchdocView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
//        view.layer.cornerRadius  = 18 * appConstant.heightRatio
//         view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.25
//        view.layer.shadowOffset = CGSize(width: 0, height: 4)
//        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    
    
    
    lazy var FindDocCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.contentMode = .scaleToFill
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return  collectionView
    }()
    
    var selectedCategory: String?
//    let pickerView = UIPickerView()
    
    lazy var pickerView: UIPickerView = {
       
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        
        return pv
    }()
    
    
    
    var categoryList = ["Allergy and Immunology","Anesthesiology","Biochemical Genetics","Colon and Rectal Surgery","Dermatology", "Emergency medicine", "Family medicine", "Internal medicine", "Neurological surgery","Nuclear medicine","Obstetrics and Gynechology","Ophthalmology","Orthopaedic Surgery","Otolaryngology","Pathology","Pediatricks","Physical Medicine and Rehabilitations","Plastic Surgery","Preventive Medicine","Psychiatry and Neurology","Radiology","Surgery","Thoracic Surgery","Urology"]
    
    
    var getcatlist = GetDocData()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
        pickerView.delegate = self
       

    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(logoImage)
        view.addSubview(scrollview)
        view.addSubview(containerView)
        
        containerView.addSubview(findspecilisttitleLbl)
        containerView.addSubview(SearchdocView)
        SearchdocView.addSubview(backBtn)
        SearchdocView.addSubview(SearchTextFieldView)
        SearchTextFieldView.addSubview(searchBtn)
        SearchTextFieldView.addSubview(diseaseTF)
        SearchTextFieldView.addSubview(CrossBtn)
       
        
        containerView.addSubview(pickerView)
        
       
        
        
        
        NSLayoutConstraint.activate([

            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: margin.topAnchor,constant: 70 * appConstant.heightRatio),
            logoImage.heightAnchor.constraint(equalToConstant: 283 * appConstant.heightRatio),
            logoImage.widthAnchor.constraint(equalToConstant: 313 * appConstant.heightRatio),
//
//            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
//            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
//            scrollview.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 13 * appConstant.heightRatio),
//            scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
//            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
//
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 24 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
//
            
            findspecilisttitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32 * appConstant.heightRatio),
            findspecilisttitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26 * appConstant.widthRatio),
            findspecilisttitleLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            SearchdocView.topAnchor.constraint(equalTo: findspecilisttitleLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            SearchdocView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            SearchdocView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            SearchdocView.heightAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            
            backBtn.topAnchor.constraint(equalTo: SearchdocView.topAnchor, constant: 10 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: SearchdocView.leadingAnchor, constant: 26 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            SearchTextFieldView.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SearchTextFieldView.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 27 * appConstant.heightRatio),
            SearchTextFieldView.trailingAnchor.constraint(equalTo: SearchdocView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            SearchTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            searchBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            searchBtn.leadingAnchor.constraint(equalTo: SearchTextFieldView.leadingAnchor, constant: 10 * appConstant.heightRatio),
            searchBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            searchBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            diseaseTF.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            diseaseTF.leadingAnchor.constraint(equalTo: searchBtn.trailingAnchor, constant: 8 * appConstant.heightRatio),
            diseaseTF.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -80 * appConstant.heightRatio),
            diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            CrossBtn.centerYAnchor.constraint(equalTo: diseaseTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
            CrossBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
            CrossBtn.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -18 * appConstant.heightRatio),
            CrossBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            CrossBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),

            

            pickerView.topAnchor.constraint(equalTo: SearchdocView.bottomAnchor, constant: 10 * appConstant.heightRatio),
            pickerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            pickerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            pickerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -35 * appConstant.heightRatio),
            pickerView.heightAnchor.constraint(equalToConstant: 300)
            
            
        
        ])
        
    }
    


}


extension DoctorCategoryVSbController:  UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1 // number of session
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return categoryList.count // number of dropdown items
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return categoryList[row] // dropdown item
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedCategory = categoryList[row] // selected item
      //  pickerView.backgroundColor = UIColor(named: Colors.AppColor)
        
    }
    
}

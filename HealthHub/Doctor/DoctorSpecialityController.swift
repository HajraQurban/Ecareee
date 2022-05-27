//
//  DoctorSpecialityController.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit
import SwiftUI

class DoctorSpecialityController: BaseController,UIPopoverPresentationControllerDelegate {
    
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
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 3, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var logoImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "HistLogo2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var findspecilisttitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Add New Speciality"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var plusBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "Plusicon"), for: .normal)
        //  btn.setTitle("Get Started", for: .normal)
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.addTarget(self, action: #selector(createdateIllnesspicker), for: .touchUpInside)
        
        return btn
    }()
    
    //    lazy var backBtn : CustomButton = {
    //        let btn = CustomButton()
    //        btn.translatesAutoresizingMaskIntoConstraints = false
    //        btn.backgroundColor = UIColor.clear
    //        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
    //      //  btn.setTitle("Get Started", for: .normal)
    //     //   btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
    //
    //        return btn
    //    }()
    
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
    
    lazy var noSpecialityLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 15)
        lbl.text = "No Doctor Specialities Right Now"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var sub_cat_id : Int = 0
    
    var arrFilterData = GetDocData()
    
    var isSearch : Bool!
    var ids = [Int]()
    let manager = DocCategoryManagers()
    let sManager = SpecialtyManager()
    let Dmanager = DoctoragtSpeciality()
    //    let loadingView = RSLoadingView()
    var DocTypeImages = ["Toothimg","Eyeimg","lungimg","Pregnancyimg","Crutchimg","Toothimg","Plasterimg","Therometerimg","Stethoscopeimg"]
    var DocTypeArray : [String] = ["Dental","Oftalmology","Pulmonology","Obstetrician","Orthopedia","Counseling","Dermathology","Pediatrician","GP"]
    var specialtyListArray = SpecialtyModel()
    var getcatlist = SpecialtyModel()
    
    
    //    var tbr = CustomTabBarController()
    var diseasePicker = UIPickerView()
    var toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIData()
        headerLbl.text = "Speciality"
        backBtn.isHidden = false
        backBtn.tintColor = .white
        isSearch = false
        //        tbr.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        FindDocCV.delegate = self
        FindDocCV.dataSource = self
        FindDocCV.register(FindSpecialistCVCell.self, forCellWithReuseIdentifier: FindSpecialistCVCell.identifier)
        setup()
        getAllSpec()
        //        getdoctorcategorylist()
//        self.arrFilterData.data = self.getcatlist.data
//
//        self.diseaseTF.addTarget(self, action: #selector(searchWorkersAsPerText(_ :)), for: .editingChanged)
        
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(logoImage)
        view.addSubview(scrollview)
        view.addSubview(containerView)
        
        containerView.addSubview(findspecilisttitleLbl)
        containerView.addSubview(plusBtn)
        //        containerView.addSubview(SearchdocView)
        //        SearchdocView.addSubview(backBtn)
        //        SearchdocView.addSubview(SearchTextFieldView)
        //        SearchTextFieldView.addSubview(searchBtn)
        //        SearchTextFieldView.addSubview(diseaseTF)
        //        SearchTextFieldView.addSubview(CrossBtn)
        
        containerView.addSubview(FindDocCV)
        containerView.addSubview(noSpecialityLbl)
        
        
        NSLayoutConstraint.activate([
            
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 20 * appConstant.heightRatio),
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
            containerView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 5 * appConstant.heightRatio),
            containerView.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            //
            
            findspecilisttitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32 * appConstant.heightRatio),
            findspecilisttitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26 * appConstant.widthRatio),
            findspecilisttitleLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            //            plusBtn.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32 * appConstant.heightRatio),
            plusBtn.centerYAnchor.constraint(equalTo: findspecilisttitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            plusBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32 * appConstant.heightRatio),
            plusBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            plusBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            
         
            
            FindDocCV.topAnchor.constraint(equalTo: findspecilisttitleLbl.bottomAnchor, constant: 13 * appConstant.heightRatio),
            FindDocCV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            FindDocCV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            FindDocCV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            FindDocCV.heightAnchor.constraint(equalToConstant: 400),
            
            
            noSpecialityLbl.topAnchor.constraint(equalTo: FindDocCV.topAnchor, constant: 50 * appConstant.heightRatio),
            noSpecialityLbl.centerXAnchor.constraint(equalTo: FindDocCV.centerXAnchor, constant: 0 * appConstant.heightRatio),
            noSpecialityLbl.leadingAnchor.constraint(equalTo: FindDocCV.leadingAnchor, constant: 24 * appConstant.widthRatio),
            noSpecialityLbl.trailingAnchor.constraint(equalTo: FindDocCV.trailingAnchor, constant: -24 * appConstant.widthRatio),
            
        ])
        
    }
    
    
    @objc func addbtn_press(_ sender:UIButton){
        
        let popoverVC =  AddSpecialtyPopupController()
        popoverVC.delegate = self
        popoverVC.idsList  = self.ids
        popoverVC.preferredContentSize = CGSize(width: 220.0 * appConstant.heightRatio , height: 200 * appConstant.widthRatio)
        
        popoverVC.modalPresentationStyle = .popover
        
        popoverVC.popoverPresentationController?.permittedArrowDirections = .up
        
        
        popoverVC.popoverPresentationController?.delegate = self
        
        popoverVC.popoverPresentationController?.sourceView = sender
        
        self.present(popoverVC, animated: true, completion: nil)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return UIModalPresentationStyle.none
        
    }
    
    @objc func createdateIllnesspicker()
    {
        if getcatlist.data?.count == 0 {
            alertWithMsg(vc: self, msg: "No speciality available", title: "Attention")
            return
        }
        diseasePicker = UIPickerView.init()
        diseasePicker.delegate = self
        diseasePicker.dataSource = self
        diseasePicker.backgroundColor = UIColor.white
        diseasePicker.setValue(UIColor.black, forKey: "textColor")
        diseasePicker.autoresizingMask = .flexibleWidth
        diseasePicker.contentMode = .center
        diseasePicker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(diseasePicker)
                
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed1))
        let dateFlexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([dateFlexSpace,btn], animated: true)

        self.view.addSubview(toolBar)
        
    }
    
    @objc func donepressed1()
    {
        if getcatlist.data?.count == 0{
            self.view.endEditing(true)
            toolBar.removeFromSuperview()
            diseasePicker.removeFromSuperview()
            return
        }
        let row = diseasePicker.selectedRow(inComponent: 0)
        for id in ids {
            if id == getcatlist.data?[row].id ?? 0{
                diseasePicker.reloadAllComponents()
                self.view.endEditing(true)
                toolBar.removeFromSuperview()
                diseasePicker.removeFromSuperview()
                return
            }
        }
        
        self.ids.append(getcatlist.data?[row].id ?? 0)
//        getillnesslist.data?"".remove(at: row)
        diseasePicker.reloadAllComponents()
        self.view.endEditing(true)
        toolBar.removeFromSuperview()
        diseasePicker.removeFromSuperview()
        addSpecialty()
       
       
    }
    
    
    @objc override func backbtn_press(){
        self.dismiss(animated: true)
    }
    
    func getAPIData(){
        DispatchQueue.main.async {
            ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        
        Dmanager.docOwnspecialitylist { specList, msg, hasError in
            DispatchQueue.main.async {
                ActivityIndicator.shared.removeSpinner()
            }
            
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Error")
            }else{
                guard let list = specList else{
                    return
                }
                
                if list.data?.count ?? 0 > 0
                {
                    for objc in list.data ?? [] {
                        self.ids.append(objc.id!)
                    }
                    self.specialtyListArray = list
                    self.FindDocCV.reloadData()
                    self.noSpecialityLbl.isHidden = true
                }
                else
                {
                    self.noSpecialityLbl.isHidden = false
                }
                
                //                for objc in list.data ?? [] {
                //                    self.ids.append(objc.id!)
                //                }
                //                self.specialtyListArray = list
                //                self.FindDocCV.reloadData()
                
            }
            
            
        }
    }
    
    // MARK:- textfield
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        var searchText  = diseaseTF.text! + string
        
        if string  == "" {
            searchText = (searchText as String).substring(to: searchText.index(before: searchText.endIndex))
        }
        
        if searchText == "" {
            isSearch = false
            FindDocCV.reloadData()
        }
        else{
            // getSearchArrayContains(searchText)
        }
        
        return true
    }
    
    // Predicate to filter data
    //   func getSearchArrayContains(_ text : String) {
    //   var predicate : NSPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", text)
    //  arrFilterData = (getcatlist.data).filtered(using: predicate)
//    @objc func searchWorkersAsPerText(_ textfield:UITextField) {
//        self.arrFilterData.data?.removeAll()
//        isSearch = true
//        if textfield.text?.count != 0 {
//
//            let alldata = getcatlist.data
//            for dicData in alldata! {
//                let isMachingWorker : NSString = (dicData.name!) as NSString
//                let range = isMachingWorker.lowercased.range(of: textfield.text!, options: NSString.CompareOptions.caseInsensitive, range: nil,   locale: nil)
//                arrFilterData.data =  getcatlist.data!.filter{($0.name?.localizedCaseInsensitiveContains( textfield.text ?? ""))!}
//                //            let matchword = diseaseTF.text!
//                //            if matchword == (dicData.name! as String)
//                //            {
//                //                arrFilterData.data?.append(dicData)
//                //            }
//                if range != nil {
//                    //  arrFilterData.append(dicData)
//                    arrFilterData.data?.append(dicData)
//                    FindDocCV.reloadData()
//                }
//            }
//        }
//        else
//        {
//            self.arrFilterData.data = getcatlist.data
//
//        }
//        //   arrFilterData = getcatlist.data?.filter(predicate)
//        //        isSearch = false
//        FindDocCV.reloadData()
//    }
    
    
    
}

extension DoctorSpecialityController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return specialtyListArray.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = FindDocCV.dequeueReusableCell(withReuseIdentifier: FindSpecialistCVCell.identifier, for: indexPath) as! FindSpecialistCVCell
        let spec = specialtyListArray.data?[indexPath.row]
        //        let doctorcategory = getcatlist.data?[indexPath.row]
        //        let base = "http://192.168.18.106:8000/"//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        //        let url = URL(string: base + (doctorcategory?.url ?? ""))
        
        cell.TypeImage.image = UIImage(named: "Categorylogo")
        cell.TypetitleLbl.text = spec?.name ?? ""
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        sub_cat_id = 3
        //        let vc = SearchDoctorController()
        //        vc.modalPresentationStyle = .fullScreen
        //        self.navigationController?.pushViewController(vc, animated: true)
        //        self.navigationController?.pushViewController(EditProfileController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.FindDocCV.frame.width/3.0) - 5 , height:135 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  3
    }
    
    
    
    
}


extension DoctorSpecialityController:AddSpecialtyProtocol{
    func setSym() {
        self.getAPIData()
    }
    
    func getAllSpec()
    {
//        DispatchQueue.main.async {
//            ActivityIndicator.shared.showSpinner(onView: self.view)
//        }
        
        sManager.allSpecialty() { specData,msg, hasError in
//            DispatchQueue.main.async {
//                ActivityIndicator.shared.removeSpinner()
//            }
            if hasError{
           //     RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                guard let list  = specData else {
                    return
                }
                self.getcatlist = list
                self.diseasePicker.reloadAllComponents()
            }
        }
    }
    
    func addSpecialty(){
       
            ActivityIndicator.shared.showSpinner(onView: self.view)
        
        sManager.addSpecialty(ids: self.ids) { specList, msg, hasError in
            DispatchQueue.main.async {
               
                    ActivityIndicator.shared.removeSpinner()
                
                if hasError{
                    alertWithMsg(vc: self, msg: msg, title: "Error!")
                    self.dismiss(animated: true, completion: nil)
                }else{
                    self.setSym()
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
            
        }
    }
    
}

extension DoctorSpecialityController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (getcatlist.data?.count ?? 0)
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return getcatlist.data![row].name
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {


    }
    
    
}


//
//  DoctorCategoryController.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//


import UIKit
import Alamofire
import Kingfisher
//import RSLoadingView


class DoctorCategoryController: UIViewController,  UITextFieldDelegate {

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
        lbl.font =  bold(size: 36)
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
    
    var arrFilterData = GetDocData()
    
    var isSearch : Bool!
    
    let manager = DocCategoryManagers()
//    let loadingView = RSLoadingView()
    var DocTypeImages = ["Toothimg","Eyeimg","lungimg","Pregnancyimg","Crutchimg","Toothimg","Plasterimg","Therometerimg","Stethoscopeimg"]
    var DocTypeArray : [String] = ["Dental","Oftalmology","Pulmonology","Obstetrician","Orthopedia","Counseling","Dermathology","Pediatrician","GP"]
    
    var getcatlist = GetDocData()
//    var tbr = CustomTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isSearch = false
//        tbr.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        FindDocCV.delegate = self
        FindDocCV.dataSource = self
        FindDocCV.register(FindSpecialistCVCell.self, forCellWithReuseIdentifier: FindSpecialistCVCell.identifier)
        setup()
        getdoctorcategorylist()
        self.arrFilterData.data = self.getcatlist.data

        self.diseaseTF.addTarget(self, action: #selector(searchWorkersAsPerText(_ :)), for: .editingChanged)

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
        
        containerView.addSubview(FindDocCV)
        
        
        
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
            SearchdocView.heightAnchor.constraint(equalToConstant: 65 * appConstant.heightRatio),
            
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

            FindDocCV.topAnchor.constraint(equalTo: SearchdocView.bottomAnchor, constant: 13 * appConstant.heightRatio),
            FindDocCV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            FindDocCV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            FindDocCV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12 * appConstant.heightRatio),
            FindDocCV.heightAnchor.constraint(equalToConstant: 400)
            
            
        
        ])
        
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
    @objc func searchWorkersAsPerText(_ textfield:UITextField) {
        self.arrFilterData.data?.removeAll()
        isSearch = true
        if textfield.text?.count != 0 {
           
        let alldata = getcatlist.data
        for dicData in alldata! {
                   let isMachingWorker : NSString = (dicData.name!) as NSString
                   let range = isMachingWorker.lowercased.range(of: textfield.text!, options: NSString.CompareOptions.caseInsensitive, range: nil,   locale: nil)
            arrFilterData.data =  getcatlist.data!.filter{($0.name?.localizedCaseInsensitiveContains( textfield.text ?? ""))!}
//            let matchword = diseaseTF.text!
//            if matchword == (dicData.name! as String)
//            {
//                arrFilterData.data?.append(dicData)
//            }
                   if range != nil {
                     //  arrFilterData.append(dicData)
                       arrFilterData.data?.append(dicData)
                       FindDocCV.reloadData()
                   }
               }
        }
        else
        {
            self.arrFilterData.data = getcatlist.data

        }
     //   arrFilterData = getcatlist.data?.filter(predicate)
//        isSearch = false
        FindDocCV.reloadData()
    }
    


}

extension DoctorCategoryController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if isSearch! {
               return arrFilterData.data?.count ?? 0
           }
           else{
//               print("The Doctor Count From Server\(getcatlist.data?.count ?? "")")
               return getcatlist.data?.count ?? 0
           }
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = FindDocCV.dequeueReusableCell(withReuseIdentifier: FindSpecialistCVCell.identifier, for: indexPath) as! FindSpecialistCVCell
        if isSearch! {
            
            let doctorcategory = arrFilterData.data?[indexPath.row]
            cell.TypetitleLbl.text = doctorcategory?.name
           
        }
        else
        {
        let doctorcategory = getcatlist.data?[indexPath.row]
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + (doctorcategory?.url ?? ""))
       
        cell.TypeImage.kf.setImage(with: url)
        cell.TypetitleLbl.text = doctorcategory?.name
       
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let doctorcategory = getcatlist.data?[indexPath.row]
        let vc = SearchDoctorController()
        vc.modalPresentationStyle = .fullScreen
        vc.cat_id = doctorcategory?.id!
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func getdoctorcategorylist()
    {
       // loadingView.show(on: view)
        ActivityIndicator.shared.showSpinner(onView: self.view)
        manager.categorylist { docdata, msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
               // RSLoadingView.hide(from: self.view)
                ActivityIndicator.shared.removeSpinner()
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data!.count > 0
                {
                //    RSLoadingView.hide(from: self.view)
                    self.getcatlist =  docdata!
                self.FindDocCV.reloadData()
                    ActivityIndicator.shared.removeSpinner()
                }
                else
                {
                
                alertWithMsg(vc: self, msg: msg, title: "Alert!")
                    ActivityIndicator.shared.removeSpinner()
                }
            }
        }
        
    }
    
    
    
}

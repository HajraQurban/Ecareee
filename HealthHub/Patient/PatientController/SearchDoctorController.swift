//
//  SearchDoctorController.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//


import UIKit
import Alamofire
//import RSLoadingView

class SearchDoctorController: UIViewController, UISearchBarDelegate {

    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 46 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor//UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
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
        btn.tintColor = UIColor.white
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
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
        btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
      
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
        btn.addTarget(self, action: #selector(croosbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var SearchdocView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 0 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 0 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    lazy var DoctitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 24)
        lbl.text = "Doctors"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SearchBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Search", for: .normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var DoctorcategoryTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    lazy var nullLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = semiBold(size: 24)
        lbl.text = "No Doctors avalible"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden  = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var sub_cat_id : Int = 0
//    let loadingView = RSLoadingView()
    var cat_id : Int?
    var getsubcatlist = GetSubCatDocData()
    
    var arrFilterData = GetSubCatDocData()
    
    var isSearch : Bool!
    var selectedIndex = -1
    
    let manager = GetSubDocCategory()
    var DocTypeArray : [String] = ["Pulmonology","Pulmonaryedema","Pulmonaryfibrosis","Pulmonaryhypertension"]
    var DocnumArray : [String] = ["236","104","87","45"]
//    var tbr = CustomTabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isSearch = false
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
//        var tbr = CustomTabBarController()
//        tbr.tabBarController?.tabBar.isHidden = true
        DoctorcategoryTV.delegate = self
        DoctorcategoryTV.dataSource = self
        DoctorcategoryTV.register(DoctorCategoryTVCell.self, forCellReuseIdentifier: DoctorCategoryTVCell.cellidentifier)
        setup()
        docsubcategory()
        
        self.arrFilterData.data = self.getsubcatlist.data

        self.diseaseTF.addTarget(self, action: #selector(searchWorkersAsPerText(_ :)), for: .editingChanged)

    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
       
        headerView.addSubview(backBtn)
        headerView.addSubview(SearchTextFieldView)
        headerView.addSubview(searchBtn)
        headerView.addSubview(diseaseTF)
        headerView.addSubview(CrossBtn)
        view.addSubview(SearchdocView)
        view.addSubview(headerView)
        headerView.addSubview(DoctitleLbl)
        view.addSubview(SearchBtn)
        view.addSubview(DoctorcategoryTV)
        view.addSubview(nullLbl)
        
        
        
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -48 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -4  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 4  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            
            SearchdocView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            SearchdocView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            SearchdocView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            SearchdocView.heightAnchor.constraint(equalToConstant: 364 * appConstant.heightRatio),
            
            backBtn.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            SearchTextFieldView.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SearchTextFieldView.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 27 * appConstant.heightRatio),
            SearchTextFieldView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
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

            
            DoctitleLbl.topAnchor.constraint(equalTo: SearchdocView.topAnchor, constant: 60 * appConstant.heightRatio),
            DoctitleLbl.leadingAnchor.constraint(equalTo: SearchdocView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            DoctitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            SearchBtn.topAnchor.constraint(equalTo: SearchdocView.bottomAnchor, constant: 63 * appConstant.heightRatio),
            SearchBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            SearchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            SearchBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
         //   SearchBtn.bottomAnchor.constraint(equalTo: SearchdocView.bottomAnchor, constant: 300 * appConstant.heightRatio ),
            
            DoctorcategoryTV.topAnchor.constraint(equalTo: DoctitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            DoctorcategoryTV.leadingAnchor.constraint(equalTo: SearchdocView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DoctorcategoryTV.trailingAnchor.constraint(equalTo: SearchdocView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DoctorcategoryTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 * appConstant.widthRatio),
            
            nullLbl.centerXAnchor.constraint(equalTo: DoctorcategoryTV.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: DoctorcategoryTV.centerYAnchor),
        ])
    }
    
    
    @objc func backbtn_press(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func searchbtn_press(){
    
        let vc = ChooseDoctorController()
        vc.modalPresentationStyle = .fullScreen
        vc.sub_cat_id = sub_cat_id
        self.navigationController?.pushViewController(vc, animated: true)
  //  self.navigationController?.pushViewController(ChooseDoctorController(), animated: true)
        
    }
    
    @objc func croosbtn_press(){
        diseaseTF.text = ""
        self.selectedIndex = -1
        self.DoctorcategoryTV.reloadData()
    }

    func docsubcategory()
    {
      //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
     //   loadingView.show(on: view)
        ActivityIndicator.shared.showSpinner(onView: self.view)
        manager.subcategorylist(id: cat_id ?? 0) { docdata,msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
           //     RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                if docdata!.data?.count ?? 0 > 0
                {
                    self.SearchBtn.isUserInteractionEnabled = true
                    self.nullLbl.isHidden = true
          //      RSLoadingView.hide(from: self.view)
                self.getsubcatlist =  docdata!
                self.DoctorcategoryTV.reloadData()
                }
                else
                {
                    self.nullLbl.isHidden = false
                    self.SearchBtn.isUserInteractionEnabled = false
                    
            //    RSLoadingView.hide(from: self.view)
//                alertWithMsg(vc: self, msg: "No Doctor SubCategory Found", title: "Alert!")

                }
            }
        }
    }
    
    @objc func searchWorkersAsPerText(_ textfield:UITextField) {
        self.arrFilterData.data?.removeAll()
        isSearch = true
        if textfield.text?.count != 0 {
           
        let alldata = getsubcatlist.data
        for dicData in alldata! {
                   let isMachingWorker : NSString = (dicData.name!) as NSString
                   let range = isMachingWorker.lowercased.range(of: textfield.text!, options: NSString.CompareOptions.caseInsensitive, range: nil,   locale: nil)
            arrFilterData.data =  getsubcatlist.data!.filter{($0.name?.localizedCaseInsensitiveContains( textfield.text ?? ""))!}
//            let matchword = diseaseTF.text!
//            if matchword == (dicData.name! as String)
//            {
//                arrFilterData.data?.append(dicData)
//            }
                   if range != nil {
                     //  arrFilterData.append(dicData)
                       arrFilterData.data?.append(dicData)
                       DoctorcategoryTV.reloadData()
                   }
               }
        }
        else
        {
            self.arrFilterData.data = getsubcatlist.data

        }
     //   arrFilterData = getcatlist.data?.filter(predicate)
//        isSearch = false
        DoctorcategoryTV.reloadData()
    }
    
    
        
}

extension SearchDoctorController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch! {
               return arrFilterData.data?.count ?? 0
           }
           else{
//               print("The Doctor Count From Server\(getcatlist.data?.count ?? "")")
               return getsubcatlist.data?.count ?? 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DoctorcategoryTV.dequeueReusableCell(withIdentifier: DoctorCategoryTVCell.cellidentifier, for: indexPath) as! DoctorCategoryTVCell
        if self.selectedIndex == indexPath.row{
            cell.totaldocLbl.backgroundColor = .white
            cell.topView.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
            
        }else{
            cell.topView.backgroundColor = .white
            cell.totaldocLbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        }
        if isSearch! {
            let doctorcategory = arrFilterData.data?[indexPath.row]
            cell.doctypenameLbl.text = doctorcategory!.name
            let tot = doctorcategory?.totaldoctors
            cell.totaldocLbl.text = String(tot!)
            return cell
        }
        else
        {
        
        let doctorcategory = getsubcatlist.data?[indexPath.row]
       // self.sub_cat_id =  getsubcatlist.data?[indexPath.row].id
        cell.doctypenameLbl.text = doctorcategory!.name
        let tot = doctorcategory?.totaldoctors
        cell.totaldocLbl.text = String(tot!) 
        return cell
        }
        
        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var  doctorcategory = subdata()
    
        
        if isSearch! {
            doctorcategory = arrFilterData.data![indexPath.row]
        }
        else
        {
            doctorcategory = getsubcatlist.data![indexPath.row]
       // self.sub_cat_id =  getsubcatlist.data?[indexPath.row].id
        }
        
        
//        let doctorcategory = getsubcatlist.data?[indexPath.row]
        self.selectedIndex = indexPath.row
        sub_cat_id = doctorcategory.id!
        diseaseTF.text = doctorcategory.name
        DoctorcategoryTV.reloadData()
        if getsubcatlist.data?[indexPath.row].totaldoctors ?? 0 > 0
        {
        let vc = ChooseDoctorController()
        vc.modalPresentationStyle = .fullScreen
        vc.sub_cat_id = sub_cat_id
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 * appConstant.heightRatio
    }
}

//
//  ChooseDoctorController.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//

import UIKit
import Foundation
//import RSLoadingView
import Alamofire
import Kingfisher


var selectedDate = Date()


class ChooseDoctorController: BaseController {

    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor(named: Colors.AppBGColor)
        SV.translatesAutoresizingMaskIntoConstraints = false
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var DocDateDayCV: UICollectionView = {
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
        return  collectionView
    }()
    
    var DateArray : [String] = ["18","19","20","21","22","23"]
    var DayArray : [String] = ["mon","tue","wed","thu","fri","sat"]
    ///save the indexPath of last selected cell
    private var lastSelectedIndexPath: IndexPath?
   
    
    lazy var previousWeekBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.addTarget(self, action: #selector(dobbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var MonthtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = semiBold(size: 15)
        lbl.textColor = UIColor.black
        lbl.text = "January"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var nextWeekBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.addTarget(self, action: #selector(nextWeekbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var YeartitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = semiBold(size: 15)
        lbl.textColor = UIColor.black
        lbl.text = "2021"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    //
    
    
    
    lazy var AvailibiltydocLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Available Doctors"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DoctorTableview : UITableView = {
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
    
    lazy var bottomView : UIView = {
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
    
    lazy var optionBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "optionIcon"), for: .normal)
        btn.addTarget(self, action: #selector(optionbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var bookmarkBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "BookmarkIcon"), for: .normal)
        btn.addTarget(self, action: #selector(bookmarkbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var nullLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = semiBold(size: 15)
        lbl.text = "No Doctors avalible"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden  = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let date1 = Date()
    let calendar = Calendar.current
    var getsubcatlist = GetDocAgainstSubCatData()
    let manager = GetSubCategoryDoctors()
//    let loadingView = RSLoadingView()
    var sub_cat_id : Int = 0
    var docImages : [UIImage] = [#imageLiteral(resourceName: "Doc1")]
    var docnameArray : [String] = ["Dr. Jeffrey James","Dr. Anna Nicholas","Dr. Thomas Milton"]
    
    var date = ""
    
    var totalSquares = [Date]()
    
    var appenddates = [String]()
    
    var DayDict = [[String:Any]]()
    
    var week = [Date]()
    var selectedDate = Date()

    var days = [String]()
    //Create a DatePicker
    var datePicker: UIDatePicker = UIDatePicker()
    var toolBar = UIToolbar()
    
    var allDays = Date().getAllDays()
    var dateOfOpt = Date()
//    var tbr = CustomTabBarController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getavailabeslotlist()
        backBtn.tintColor = .white
        var calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = 2 // Start on Monday (or 1 for Sunday)
        let today = calendar.startOfDay(for: Date())
       
        if let weekInterval = calendar.dateInterval(of: .weekOfMonth, for: today) {
            for i in 0...6 {
                if let day = calendar.date(byAdding: .day, value: i, to: weekInterval.start) {
                    week += [day]
                }
            }
        }
        // Calculate start and end of the current year (or month with `.month`):
    //    let interval = calendar.dateInterval(of: .month, for: date1)!

        // Compute difference in days:
//        days = String(calendar.dateComponents([.weekday], from: interval.start, to: interval.end).day!) as? [String] ?? [""]
//        for d in days
//        {
//            let dd = d
//            print(dd)
//        }
//
//        print(days)
        YeartitleLbl1.isHidden = false
        MonthtitleLbl1.isHidden = false
        
        view.backgroundColor = UIColor(named: Colors.AppBGColor)

        DoctorTableview.delegate = self
        DoctorTableview.dataSource = self
        DoctorTableview.register(ChooseDoctorCell.self, forCellReuseIdentifier: ChooseDoctorCell.cellidentifier)
        headerLbl.text = "Choose Doctor"
     //   docagainstsubcategory()
        setup()
        MonthYearView.isHidden = false
        DateView.isHidden = false
        DocDateDayCV.delegate = self
        DocDateDayCV.dataSource = self
        DocDateDayCV.register(AvailDocDateDayCVCell.self, forCellWithReuseIdentifier: AvailDocDateDayCVCell.identifier)
        
        bottomView.isHidden = true
        
        previousWeekBtn.isHidden = true
        
        //self.CustomTabBarController?.tabBar.isHidden = true
        
      //  tbr.tabBarController?.tabBar.isHidden = true
        
//        //
//        let format = DateFormatter()
//        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let formattedDate = format.string(from: date1)
//        print(formattedDate)
//
//
//        let year = calendar.component(.year, from: date1)
//        let month = calendar.component(.month, from: date1)
//        let days = calendar.component(.day, from: date1)
//        print("\(days)")
        
        
        
        MonthtitleLbl1.text =  CalendarHelper().monthString(date: date1)
        YeartitleLbl1.text =  CalendarHelper().yearString(date: date1)
        
        
        setWeekView()
//        let date2 = allDays[indexPath.item]
//
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.string(from: date1)
//        print(formattedDate)
//
//        YeartitleLbl1.isHidden = false
//        MonthtitleLbl1.isHidden = false
//
//        MonthtitleLbl1.text =  CalendarHelper().monthString(date: date2)
//        YeartitleLbl1.text =  CalendarHelper().yearString(date: date2)
//
        date = formattedDate
//        dateOfOpt = date2
//        DocDateDayCV.reloadData()
        docagainstsubcategory()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.getavailabeslotlist()
        }
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        
//        childView.addSubview(scrollview)
//        scrollview.addSubview(containerView)
        MonthYearView.addSubview(previousWeekBtn)
        MonthYearView.addSubview(MonthtitleLbl1)
        MonthYearView.addSubview(nextWeekBtn)
        MonthYearView.addSubview(YeartitleLbl1)
        DateView.addSubview(DocDateDayCV)
        
        
        childView.addSubview(AvailibiltydocLbl)
        childView.addSubview(DoctorTableview)
        childView.addSubview(bottomView)
        bottomView.addSubview(optionBtn)
        bottomView.addSubview(bookmarkBtn)
        childView.addSubview(nullLbl)
        
        
        
        NSLayoutConstraint.activate([
            
//            scrollview.leadingAnchor.constraint(equalTo: childView.leadingAnchor),
//            scrollview.trailingAnchor.constraint(equalTo: childView.trailingAnchor),
//            scrollview.topAnchor.constraint(equalTo: childView.topAnchor),
//            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
//            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
//
//            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
//            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
//            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
//            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
           
            
            //
            
            previousWeekBtn.topAnchor.constraint(equalTo: MonthYearView.topAnchor, constant: 30 * appConstant.heightRatio),
            previousWeekBtn.leadingAnchor.constraint(equalTo: MonthYearView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            previousWeekBtn.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            previousWeekBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.widthRatio),

            
            MonthtitleLbl1.bottomAnchor.constraint(equalTo: MonthYearView.bottomAnchor, constant: -16 * appConstant.heightRatio),
            MonthtitleLbl1.leadingAnchor.constraint(equalTo: MonthYearView.leadingAnchor, constant: 87 * appConstant.widthRatio),
            MonthtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            nextWeekBtn.centerYAnchor.constraint(equalTo: MonthtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            nextWeekBtn.topAnchor.constraint(equalTo: MonthYearView.topAnchor, constant: 30 * appConstant.heightRatio),
            nextWeekBtn.leadingAnchor.constraint(equalTo: MonthtitleLbl1.trailingAnchor, constant: 50 * appConstant.widthRatio),
            nextWeekBtn.heightAnchor.constraint(equalToConstant: 70 * appConstant.heightRatio),
            nextWeekBtn.widthAnchor.constraint(equalToConstant: 150 * appConstant.widthRatio),
            
//            YeartitleLbl1.centerYAnchor.constraint(equalTo: MonthtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            YeartitleLbl1.bottomAnchor.constraint(equalTo: MonthYearView.bottomAnchor, constant: -16 * appConstant.heightRatio),
            YeartitleLbl1.leadingAnchor.constraint(equalTo: MonthtitleLbl1.trailingAnchor, constant: 111 * appConstant.widthRatio),
            YeartitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            DocDateDayCV.bottomAnchor.constraint(equalTo: DateView.bottomAnchor, constant: -8 * appConstant.heightRatio),
            DocDateDayCV.leadingAnchor.constraint(equalTo: DateView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocDateDayCV.trailingAnchor.constraint(equalTo: DateView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocDateDayCV.heightAnchor.constraint(equalToConstant: 52 * appConstant.heightRatio),
            
            
            AvailibiltydocLbl.topAnchor.constraint(equalTo: DateView.bottomAnchor, constant: 20 * appConstant.heightRatio),
            AvailibiltydocLbl.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AvailibiltydocLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            DoctorTableview.topAnchor.constraint(equalTo: AvailibiltydocLbl.bottomAnchor, constant: 10 * appConstant.heightRatio),
            DoctorTableview.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            
            DoctorTableview.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DoctorTableview.heightAnchor.constraint(equalToConstant: 500 * appConstant.heightRatio),

            
            bottomView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 20 * appConstant.heightRatio),
            bottomView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0  * appConstant.heightRatio),
            bottomView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0  * appConstant.heightRatio),
            bottomView.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
            
            optionBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 35 * appConstant.heightRatio),
            optionBtn.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 84 * appConstant.widthRatio),
            optionBtn.heightAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            optionBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),

            bookmarkBtn.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 35 * appConstant.heightRatio),
            bookmarkBtn.leadingAnchor.constraint(equalTo: optionBtn.trailingAnchor, constant: 168 * appConstant.widthRatio),
            bookmarkBtn.heightAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            bookmarkBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),

            nullLbl.centerXAnchor.constraint(equalTo: DoctorTableview.centerXAnchor),
            nullLbl.centerYAnchor.constraint(equalTo: DoctorTableview.centerYAnchor,constant: -100 * appConstant.heightRatio),
            
        ])
    }
    
    
    @objc func previousWeekbtn_press(){
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    @objc func nextWeekbtn_press(){
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
        
    }
    
    
    
    
    @objc func optionbtn_press(){

    }
    
    @objc func bookmarkbtn_press(){

    }
    
    func docagainstsubcategory()
    {
      //  let auth_token = "2|zqu10yeEA9LVkyj7z4a0aTPkkoAjeXGfg8nkFaja"
        ActivityIndicator.shared.showSpinner(onView: self.view)
      //  loadingView.show(on: view)
        let parameters: [String: AnyObject] = [
          "date" : date as AnyObject,
          "subcat_id" : sub_cat_id  as AnyObject
      ]
       
        manager.subcategorydoclist(params: parameters) { docdata,msg, hasError in
            ActivityIndicator.shared.removeSpinner()
            if hasError{
          //      RSLoadingView.hide(from: self.view)
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }else{
                
                if docdata!.status == "200"
                {
          //      RSLoadingView.hide(from: self.view)
                self.getsubcatlist =  docdata!
                    if self.getsubcatlist.doctor?.count ?? 0 > 0{
                        self.nullLbl.isHidden = true
                        self.DoctorTableview.reloadData()
                    }else{
                        self.nullLbl.isHidden = false
                    }
                    self.DoctorTableview.reloadData()
                    
                }
                else
                {
                    self.nullLbl.isHidden = false
         //       RSLoadingView.hide(from: self.view)
//                alertWithMsg(vc: self, msg: "No data", title: "Alert")
                }
            }
        }
    }
    
//    func getavailabeslotlist()
//    {
//        appenddates.removeAll()
//        manager.getavailableslotslist(id: sub_cat_id) { data,msg, hasError in
//            if hasError{
//                alertWithMsg(vc: self, msg: msg, title: "Error!")
//            }
//            else
//            {
//                if data.doctordata?.count ?? 0 > 0
//                {
//                    for dat in data.doctordata ?? []
//                    {
//
//                        for da in self.allDays
//                        {
//                            let formatter = DateFormatter()
//                            formatter.dateFormat = "yyyy-MM-dd"
//                            // again convert your date to string
//                            let myStringDate = formatter.string(from: da)
//
//                            if dat == myStringDate
//                            {
//                                self.appenddates.append(dat)
//                            }
//                        else
//                        {
//                            print("nothing")
//                        }
//
//                    }
//
//                }
//
//            }
//
//    }
//
//}
//
//
//}
    
    
    func getavailabeslotlist()
    {
        var selectedDa = ""
        appenddates.removeAll()
        manager.getavailableslotslist(id: sub_cat_id) { data,msg, hasError in
            if hasError{
                alertWithMsg(vc: self, msg: msg, title: "Error!")
            }
            else
            {
                if data.doctordata?.count ?? 0 > 0
                {
                    self.DayDict.removeAll()
                    for da in self.allDays
                    {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd"
                        // again convert your date to string
                        let myStringDate = formatter.string(from: da)
                        for dat in data.doctordata ?? []
                        {
                            
                            
                            if dat == myStringDate
                            {
                                var dict : [String:Any] = [:]
                                dict["Doc"] = true
                                dict["Date"] = dat
                                self.DayDict.append(dict)
                                selectedDa = dat
                                break
                            }
                        else
                        {
                            
                            print("nothing")
                        }
                   
                    }
                        if selectedDa != myStringDate{
                            var dict : [String:Any] = [:]
                            dict["Doc"] = false
                            dict["Date"] = myStringDate
                            self.DayDict.append(dict)
                        }
                       
                        
                }
                    self.DocDateDayCV.reloadData()
            
            }
          
    }
     
}
        
        
}
    
    
    
    
    //
    func setWeekView()
    {
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
//        MonthtitleLbl1.text = CalendarHelper().monthString(date: selectedDate)
//        YeartitleLbl1.text = CalendarHelper().yearString(date: selectedDate)
        DocDateDayCV.reloadData()
        
//        tableView.reloadData()
    }
}

extension ChooseDoctorController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getsubcatlist.doctor?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DoctorTableview.dequeueReusableCell(withIdentifier: ChooseDoctorCell.cellidentifier, for: indexPath) as! ChooseDoctorCell
        
        let doctorcategory = getsubcatlist.doctor?[indexPath.row]
  //      cell.docimg.image = docImages[indexPath.row]
        let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
        let url = URL(string: base + (doctorcategory?.url ?? ""))
        cell.docimg.kf.setImage(with: url)
        
        cell.docnameLbl.text = doctorcategory?.name
        //"Pulmonologist | Queens Hospital"
        cell.hospitalnamelbl.text = "\(doctorcategory?.category?.name ?? "") | \(doctorcategory?.hospital_name ?? "")"
        cell.docavailibiltyBtn.setTitle("Today Available", for: .normal)
        cell.docfeeLbl.text = "$\(doctorcategory?.fees ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  self.navigationController?.pushViewController(DoctorDetail_ScheduleController(), animated: true)
        let vc = DoctorDetail_ScheduleController()
        vc.modalPresentationStyle = .fullScreen
        //vc.cat_id = doctorcategory?.id!
        vc.dateofsel = date
        vc.getsubcatlist = getsubcatlist.doctor![indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114 * appConstant.heightRatio
    }
    
    
}



extension ChooseDoctorController:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return DayDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DocDateDayCV.dequeueReusableCell(withReuseIdentifier: AvailDocDateDayCVCell.identifier, for: indexPath) as! AvailDocDateDayCVCell

        
        let date = DayDict[indexPath.item]

        let rdaaformatter = DateFormatter()
        rdaaformatter.dateFormat = "yyyy-MM-dd"
        let cdd = rdaaformatter.date(from: date["Date"] as? String ?? "")
//        let resultne = rdaaformatter.string(from: date["Date"] as? String)
        let resultne = date["Date"] as? String ?? ""
        
        if date["Doc"] as? Bool ?? false{
            cell.circleView.backgroundColor = .yellow
        }else{
            cell.circleView.backgroundColor = .clear
        }
        
//        let last2 = String(a.characters.suffix(4))
//        let resultdate = Date()
//        let resultformatter = DateFormatter()
//        resultformatter.dateFormat = "dd"
        let dictDate = date["Date"] as? String ?? ""
        let result2 = String(dictDate.suffix(2))

//
        let currentdate = dateOfOpt
        let currentformatter = DateFormatter()
        currentformatter.dateFormat = "dd"
        let result = currentformatter.string(from: currentdate)
        cell.daytitleLbl.text = String(CalendarHelper().getTodayWeekDay(date: cdd! ))
        cell.datetitleLbl.text = String(CalendarHelper().dayOfMonth(date: cdd!))
//
//
//
//            //update last select state from lastSelectedIndexPath
////            cell.isSelected = (lastSelectedIndexPath == indexPath)
//
        if( result == result2)
        {

            cell.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
            cell.daytitleLbl.textColor = UIColor.white
            cell.datetitleLbl.textColor = UIColor.white
            cell.daytitleLbl.font = semiBold(size: 24)
            cell.datetitleLbl.font = semiBold(size: 24)
//            cell.isSelected = (lastSelectedIndexPath == indexPath)

        }
        else
        {
            cell.backgroundColor = UIColor.clear
            cell.daytitleLbl.textColor = UIColor.gray
            cell.datetitleLbl.textColor = UIColor.gray
            cell.daytitleLbl.font = semiBold(size: 24)
            cell.datetitleLbl.font = semiBold(size: 24)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
          //      date = "date"
        let date2 = DayDict[indexPath.item]
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.date(from: date2["Date"] as? String ?? "")
        print(formattedDate)
    
        
        YeartitleLbl1.isHidden = false
        MonthtitleLbl1.isHidden = false
        
        MonthtitleLbl1.text =  CalendarHelper().monthString(date: formattedDate ?? Date())
        YeartitleLbl1.text =  CalendarHelper().yearString(date: formattedDate ?? Date())
        
        date = date2["Date"] as? String ?? ""
        dateOfOpt = formattedDate ?? Date()
        DocDateDayCV.reloadData()
        docagainstsubcategory()
     //   self.navigationController?.pushViewController(ChooseDocDateTimeController(), animated: true)

    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 50 * appConstant.widthRatio , height: 50 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
        return 8 * appConstant.widthRatio
   }
    
}



extension ChooseDoctorController
{
    
    
    func createtoolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let btn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donepressed))
        toolbar.setItems([btn], animated: true)
        
        return toolbar
    }
    
    @objc func donepressed()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
      //  DOBTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func createdatepicker()
    {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
//        DOBTF.inputView = datePicker
//        DOBTF.inputAccessoryView = createtoolbar()
        
       
    }
    
    
    @objc func dobbtn_press()
    {
            datePicker = UIDatePicker.init()
            datePicker.backgroundColor = UIColor.white
                    
            datePicker.autoresizingMask = .flexibleWidth
            datePicker.datePickerMode = .date
                    
            datePicker.addTarget(self, action: #selector(self.dateChanged(_:)), for: .valueChanged)
            datePicker.frame = CGRect(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
            self.view.addSubview(datePicker)
                    
            toolBar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
            toolBar.barStyle = .blackTranslucent
            toolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
            toolBar.sizeToFit()
            self.view.addSubview(toolBar)
        
        
    }
    
    @objc func dateChanged(_ sender: UIDatePicker?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
            
        if let date = sender?.date {
            print("Picked the date \(dateFormatter.string(from: date))")
            let day =  CalendarHelper().dayOfMonth(date: date)
            MonthtitleLbl1.text =  CalendarHelper().monthString(date: date)
            YeartitleLbl1.text =  CalendarHelper().yearString(date: date)
        }
    }

    @objc func onDoneButtonClick() {
        toolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    
}

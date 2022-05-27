//
//  AvailDoc&DateController.swift
//  HealthHub
//
//  Created by OBS on 16/12/2021.
//

import UIKit

class AvailDoc_DateController: TabbarController {

    
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
    
    lazy var AvailtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 18)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "Check other available doctors"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var MonthtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = regular(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "January"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var YeartitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = regular(size: 13)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.text = "2021"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var AvailDoctorTableview : UITableView = {
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
    
    lazy var SaveBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonColor)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    ///save the indexPath of last selected cell
    private var lastSelectedIndexPath: IndexPath?
    var docImages : [UIImage] = [#imageLiteral(resourceName: "Doc1")]
    var docnameArray : [String] = ["Dr. Jeffrey James","Dr. Anna Nicholas","Dr. Thomas Milton"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLbl.text = "Available time sloth w. Dr.Anna Nichols"
        view.backgroundColor = .white
        MonthYearView.isHidden = false
        DateView.isHidden = false
        AvailDoctorTableview.delegate = self
        AvailDoctorTableview.dataSource = self
        AvailDoctorTableview.register(AvailDoctorTVCell.self, forCellReuseIdentifier: AvailDoctorTVCell.cellidentifier)
        DocDateDayCV.delegate = self
        DocDateDayCV.dataSource = self
        DocDateDayCV.register(AvailDocDateDayCVCell.self, forCellWithReuseIdentifier: AvailDocDateDayCVCell.identifier)
        
        setupU()
    }
    
    func setupU(){
        
   
        view.addSubview(AvailtitleLbl1)
        MonthYearView.addSubview(MonthtitleLbl1)
        MonthYearView.addSubview(YeartitleLbl1)
        DateView.addSubview(DocDateDayCV)
        
        view.addSubview(AvailDoctorTableview)
        view.addSubview(SaveBtn)
        
        
        NSLayoutConstraint.activate([
            
            AvailtitleLbl1.topAnchor.constraint(equalTo: DateView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            AvailtitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            AvailtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            MonthtitleLbl1.topAnchor.constraint(equalTo: MonthYearView.topAnchor, constant: 60 * appConstant.heightRatio),
            MonthtitleLbl1.leadingAnchor.constraint(equalTo: MonthYearView.leadingAnchor, constant: 87 * appConstant.widthRatio),
            MonthtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            YeartitleLbl1.centerYAnchor.constraint(equalTo: MonthtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            YeartitleLbl1.topAnchor.constraint(equalTo: MonthYearView.topAnchor, constant: 60 * appConstant.heightRatio),
            YeartitleLbl1.leadingAnchor.constraint(equalTo: MonthtitleLbl1.trailingAnchor, constant: 111 * appConstant.widthRatio),
            YeartitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            DocDateDayCV.topAnchor.constraint(equalTo: DateView.topAnchor, constant: 50 * appConstant.heightRatio),
            DocDateDayCV.leadingAnchor.constraint(equalTo: DateView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocDateDayCV.trailingAnchor.constraint(equalTo: DateView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocDateDayCV.heightAnchor.constraint(equalToConstant: 52 * appConstant.heightRatio),
            
            
            AvailDoctorTableview.topAnchor.constraint(equalTo: AvailtitleLbl1.bottomAnchor, constant: 2 * appConstant.heightRatio),
            AvailDoctorTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
            
            AvailDoctorTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            AvailDoctorTableview.heightAnchor.constraint(equalToConstant: 223 * appConstant.heightRatio),
            
            SaveBtn.topAnchor.constraint(equalTo: AvailDoctorTableview.bottomAnchor, constant: 25 * appConstant.heightRatio),
            SaveBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22 * appConstant.widthRatio),
            SaveBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18 * appConstant.widthRatio),
            SaveBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
        ])
        
    }
    
    
    @objc func searchbtn_press(){
        
    }
    
}

extension AvailDoc_DateController:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DateArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DocDateDayCV.dequeueReusableCell(withReuseIdentifier: AvailDocDateDayCVCell.identifier, for: indexPath) as! AvailDocDateDayCVCell
        cell.datetitleLbl.text = DateArray[indexPath.row]
        cell.daytitleLbl.text = DayArray[indexPath.row]
    //    cell.backgroundColor = .filterUnSelect
        if indexPath.row == 0 {
                lastSelectedIndexPath = indexPath
                cell.isSelected = true
            }
        else{
            print("No Color")
        }
            
            //update last select state from lastSelectedIndexPath
            cell.isSelected = (lastSelectedIndexPath == indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(ChooseDocDateTimeController(), animated: true)

    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let size: CGSize = DateArray[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21.0 * appConstant.widthRatio)])
        return CGSize(width:(size.width + 24) , height: 50 * appConstant.heightRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
        return 8 * appConstant.widthRatio
   }
    
}

extension AvailDoc_DateController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docnameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AvailDoctorTableview.dequeueReusableCell(withIdentifier: AvailDoctorTVCell.cellidentifier, for: indexPath) as! AvailDoctorTVCell
        
  //      cell.docimg.image = docImages[indexPath.row]
        cell.docnameLbl.text = docnameArray[indexPath.row]
        cell.hospitalnamelbl.text = "Pulmonologist | Queens Hospital"
        cell.docavailibiltyBtn.setTitle("Today Available", for: .normal)
        cell.docfeeLbl.text = "$70"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  self.navigationController?.pushViewController(DoctorDetail_ScheduleController(), animated: true)
        let DocPage = DoctorDetail_ScheduleController()
        self.present(DocPage, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114 * appConstant.heightRatio
    }
    
}

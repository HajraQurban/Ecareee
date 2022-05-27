//
//  ChooseDocDateTimeController.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class ChooseDocDateTimeController: TabbarController {

    lazy var MonthtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = regular(size: 13)
        lbl.textColor = UIColor.black
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
        lbl.textColor = UIColor.black
        lbl.text = "2021"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var DateexpView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var DatecenView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
//        view.layer.cornerRadius  = 36 * appConstant.heightRatio
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.25
//        view.layer.shadowOffset = CGSize(width: 0, height: 4)
//        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
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
    
    
    
    
    
    lazy var DocTimeCV: UICollectionView = {
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
    
    var TimeArray : [String] = ["7:30","8:45","9:30","2:00","6:45"]
    var TimeSpanArray : [String] = ["AM","AM","AM","PM","PM"]
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        headerLbl.text = "Available time sloth w. Dr.Anna Nichols"
        MonthYearView.isHidden = false
        DateView.isHidden = false
        
        
        DocDateDayCV.delegate = self
        DocDateDayCV.dataSource = self
        DocDateDayCV.register(AvailDocDateDayCVCell.self, forCellWithReuseIdentifier: AvailDocDateDayCVCell.identifier)
        
        DocTimeCV.delegate = self
        DocTimeCV.dataSource = self
        DocTimeCV.register(AvailDocDateDayCVCell.self, forCellWithReuseIdentifier: AvailDocDateDayCVCell.identifier)
        
        setupcredentials()
    }
    func setupcredentials()
    {
        
        MonthYearView.addSubview(MonthtitleLbl1)
        MonthYearView.addSubview(YeartitleLbl1)
        DateView.addSubview(DateexpView)
        DateView.addSubview(DatecenView)
        DatecenView.addSubview(DocDateDayCV)
        DateexpView.addSubview(DocTimeCV)
        
        view.addSubview(SaveBtn)
        
        NSLayoutConstraint.activate([
        
            DateView.heightAnchor.constraint(equalToConstant: 371 * appConstant.heightRatio),
            
            MonthtitleLbl1.topAnchor.constraint(equalTo: MonthYearView.topAnchor, constant: 60 * appConstant.heightRatio),
            MonthtitleLbl1.leadingAnchor.constraint(equalTo: MonthYearView.leadingAnchor, constant: 87 * appConstant.widthRatio),
            MonthtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            YeartitleLbl1.centerYAnchor.constraint(equalTo: MonthtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            YeartitleLbl1.topAnchor.constraint(equalTo: MonthYearView.topAnchor, constant: 60 * appConstant.heightRatio),
            YeartitleLbl1.leadingAnchor.constraint(equalTo: MonthtitleLbl1.trailingAnchor, constant: 111 * appConstant.widthRatio),
            YeartitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            DateexpView.topAnchor.constraint(equalTo: DateView.bottomAnchor, constant: -30 * appConstant.heightRatio),
            DateexpView.leadingAnchor.constraint(equalTo: DateView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            DateexpView.trailingAnchor.constraint(equalTo: DateView.trailingAnchor, constant: -0 * appConstant.widthRatio),

            DateexpView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            //
            DatecenView.topAnchor.constraint(equalTo: DateView.topAnchor, constant: -10 * appConstant.heightRatio),
            DatecenView.leadingAnchor.constraint(equalTo: DateView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            DatecenView.trailingAnchor.constraint(equalTo: DateView.trailingAnchor, constant: -0 * appConstant.widthRatio),

            DatecenView.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
            
          //
            DocDateDayCV.topAnchor.constraint(equalTo: DatecenView.topAnchor, constant: 90 * appConstant.heightRatio),
            DocDateDayCV.leadingAnchor.constraint(equalTo: DatecenView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocDateDayCV.trailingAnchor.constraint(equalTo: DatecenView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocDateDayCV.heightAnchor.constraint(equalToConstant: 52 * appConstant.heightRatio),
            //
            
            DocTimeCV.topAnchor.constraint(equalTo: DateexpView.topAnchor, constant: 90 * appConstant.heightRatio),
            DocTimeCV.leadingAnchor.constraint(equalTo: DateexpView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            DocTimeCV.trailingAnchor.constraint(equalTo: DateexpView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DocTimeCV.heightAnchor.constraint(equalToConstant: 52 * appConstant.heightRatio),
            
            
            SaveBtn.topAnchor.constraint(equalTo: DateexpView.bottomAnchor, constant: 85 * appConstant.heightRatio),
            SaveBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22 * appConstant.widthRatio),
            SaveBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18 * appConstant.widthRatio),
            SaveBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            
            
            
            
            
            
        
        ])
        
    }
    
    
    @objc func searchbtn_press(){
        
    }
    
}


extension ChooseDocDateTimeController:  UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == DocTimeCV
        {
        return TimeArray.count
        }
        else
        {
            return DateArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == DocTimeCV
        {
        let cell = DocTimeCV.dequeueReusableCell(withReuseIdentifier: AvailDocDateDayCVCell.identifier, for: indexPath) as! AvailDocDateDayCVCell
        cell.datetitleLbl.text = TimeArray[indexPath.row]
        cell.daytitleLbl.text = TimeSpanArray[indexPath.row]
    //    cell.backgroundColor = .filterUnSelect
        return cell
        }
        else
        {
        let cell = DocDateDayCV.dequeueReusableCell(withReuseIdentifier: AvailDocDateDayCVCell.identifier, for: indexPath) as! AvailDocDateDayCVCell
        cell.datetitleLbl.text = DateArray[indexPath.row]
        cell.daytitleLbl.text = DayArray[indexPath.row]
    //    cell.backgroundColor = .filterUnSelect
        return cell
        }
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(HomeController(), animated: true)

    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        if collectionView == DocTimeCV
        {
        let size: CGSize = TimeArray[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21.0 * appConstant.widthRatio)])
        return CGSize(width:(size.width + 24) , height: 50 * appConstant.heightRatio)
        }
        else
        {
        let size: CGSize = DateArray[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21.0 * appConstant.widthRatio)])
        return CGSize(width:(size.width + 24) , height: 50 * appConstant.heightRatio)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == DocTimeCV
        {
        return 4 * appConstant.widthRatio
        }
        else
        {
        return 14 * appConstant.widthRatio
        }
   }
    
}

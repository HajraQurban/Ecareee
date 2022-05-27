//
//  SymptomsTV.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import Foundation
import AVKit

protocol DoctorCatProtocol {
    func setSym(symtoms : String, id: Int)
}

class AddDoctorCategoryPopUpView: UIViewController {

    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
     }()
    
//    lazy var headView : UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
//        view.layer.cornerRadius = 18 * appConstant.heightRatio
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//     }()
    
//    lazy var bodytitleLbl : UILabel = {
//        let lbl = UILabel()
//        lbl.clipsToBounds = true
//        lbl.textColor = UIColor(named: Colors.TextColor)
//        lbl.textAlignment = .center
//        lbl.font = bold(size: 18)
//        lbl.text = "Chest"
//        lbl.numberOfLines = 0
//        lbl.adjustsFontSizeToFitWidth = true
//        lbl.sizeToFit()
//        lbl.translatesAutoresizingMaskIntoConstraints = false
//        return lbl
//    }()
//
    lazy var selectionTable : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = true
        tv.backgroundColor = UIColor.white
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var delegate : DoctorCatProtocol?
    let manager = DocCategoryManagers()
//    let loadingView = RSLoadingView()
    
    var getcatlist = GetDocData()
    
    var btnsArray = ["Chest pain","Chest pain, spreading to the left upper limb","Heartburn","Palpitations","Fast heartbeat","Slow heartbeat"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        selectionTable.delegate = self
        selectionTable.dataSource = self
        selectionTable.register(SelectionTVCell.self, forCellReuseIdentifier: SelectionTVCell.cellidentifier)
        setup()
        getdoctorcategorylist()
        
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(containerView)
      //  containerView.addSubview(headView)
       // headView.addSubview(bodytitleLbl)

        containerView.addSubview(selectionTable)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 1 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: margin.topAnchor,constant: 1 * appConstant.heightRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -1 * appConstant.widthRatio),
            containerView.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: -1 * appConstant.heightRatio),
            
//            headView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0 * appConstant.widthRatio),
//            headView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 0 * appConstant.heightRatio),
//            headView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -0 * appConstant.widthRatio),
//            headView.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
//            bodytitleLbl.centerYAnchor.constraint(equalTo: headView.centerYAnchor, constant: 0 * appConstant.heightRatio),
//            bodytitleLbl.leadingAnchor.constraint(equalTo: headView.leadingAnchor, constant: 10 * appConstant.widthRatio),
//            bodytitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            selectionTable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 1 * appConstant.widthRatio),
            selectionTable.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 1 * appConstant.heightRatio),
            selectionTable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -1 * appConstant.widthRatio),
            selectionTable.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -1 * appConstant.heightRatio),
        ])
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
                self.selectionTable.reloadData()
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

extension AddDoctorCategoryPopUpView: UITableViewDelegate,UITableViewDataSource{
   
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return getsymtopmslist.data!.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let spec = getcatlist.data else{
            
            return 0
        }
        return spec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectionTable.dequeueReusableCell(withIdentifier: SelectionTVCell.cellidentifier, for: indexPath) as! SelectionTVCell
        let symptopname = getcatlist.data![indexPath.row]
        cell.titleLbl.text = symptopname.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.setSym(symtoms: getcatlist.data![indexPath.row].name ?? "", id: getcatlist.data![indexPath.row].id ?? 0)
        self.dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 * appConstant.heightRatio
    }
    

}

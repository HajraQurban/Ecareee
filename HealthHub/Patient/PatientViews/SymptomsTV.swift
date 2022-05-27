//
//  SymptomsTV.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import Foundation
import AVKit

protocol SetSymtomsProtocol {
    func setSym(symtoms : String, id: Int, list : GetAllSymptoms)
}

class SymptomsTV: UIViewController {

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
    
    var delegate : SetSymtomsProtocol?
    let manager = GetSymtopslistManagers()
    var getsymtopmslist = GetAllSymptoms()
    
    var btnsArray = ["Chest pain","Chest pain, spreading to the left upper limb","Heartburn","Palpitations","Fast heartbeat","Slow heartbeat"]
    
    // the constraint we'll use for myView's height
    var myViewHeightConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        selectionTable.delegate = self
        selectionTable.dataSource = self
        selectionTable.register(SelectionTVCell.self, forCellReuseIdentifier: SelectionTVCell.cellidentifier)
        setup()
//        getdoctorcategorylist()
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(containerView)
      //  containerView.addSubview(headView)
       // headView.addSubview(bodytitleLbl)

        containerView.addSubview(selectionTable)
        
        myViewHeightConstraint = selectionTable.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio)
        myViewHeightConstraint.isActive = true

        
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
//
//    func getdoctorcategorylist()
//    {
//      //  loadingView.show(on: view)
//        ActivityIndicator.shared.showSpinner(onView: self.view)
//        manager.symtopmslist{ docdata, msg, hasError in
//            ActivityIndicator.shared.removeSpinner()
//            if hasError{
//             //   RSLoadingView.hide(from: self.view)
//                alertWithMsg(vc: self, msg: msg, title: "Error!")
//            }else{
//                if docdata!.data!.count > 0
//                {
//                //    RSLoadingView.hide(from: self.view)
//                    self.getsymtopmslist =  docdata!
//                    self.selectionTable.reloadData()
//                }
//                else
//                {
//
//                alertWithMsg(vc: self, msg: msg, title: "Alert!")
//
//                }
//            }
//        }
//    }

}

extension SymptomsTV: UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let spec = getsymtopmslist.data else{
            
            return 0
        }
        if spec.count >= 3
        {
            myViewHeightConstraint.isActive = false
            myViewHeightConstraint = selectionTable.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio)
            myViewHeightConstraint.isActive = true
       
        }
            return spec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectionTable.dequeueReusableCell(withIdentifier: SelectionTVCell.cellidentifier, for: indexPath) as! SelectionTVCell
            cell.clipsToBounds = true
        let symptopname = getsymtopmslist.data![indexPath.row]
        cell.titleLbl.text = symptopname.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = getsymtopmslist.data![indexPath.row].name
        let id = getsymtopmslist.data![indexPath.row].id
        getsymtopmslist.data?.remove(at: indexPath.row)
        selectionTable.reloadData()
        
        self.delegate?.setSym(symtoms: name ?? "", id: id ?? 0 , list: getsymtopmslist)
        self.dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 * appConstant.heightRatio
    }
    
}

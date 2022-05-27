//
//  HeadPainPopUpController.swift
//  HealthHub
//
//  Created by OBS on 24/01/2022.
//

import UIKit

class HeadPainPopUpController: UIViewController {
    
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bodytitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Head"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var selectionTable : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var btnsArray = ["Head pain","Head pain, Primary muscle contraction headaches","episodic","chromic","Primary migraine headaches with aura","stabbing headache"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .clear
        selectionTable.delegate = self
        selectionTable.dataSource = self
        selectionTable.register(SelectionTVCell.self, forCellReuseIdentifier: SelectionTVCell.cellidentifier)
        setup()
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(containerView)
        containerView.addSubview(headView)
        headView.addSubview(bodytitleLbl)
        
        containerView.addSubview(selectionTable)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 1 * appConstant.widthRatio),
            containerView.topAnchor.constraint(equalTo: margin.topAnchor,constant: 1 * appConstant.heightRatio),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -1 * appConstant.widthRatio),
            containerView.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: -1 * appConstant.heightRatio),
            
            headView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0 * appConstant.widthRatio),
            headView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 0 * appConstant.heightRatio),
            headView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -0 * appConstant.widthRatio),
            headView.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
            
            bodytitleLbl.centerYAnchor.constraint(equalTo: headView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            bodytitleLbl.leadingAnchor.constraint(equalTo: headView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            bodytitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            selectionTable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 1 * appConstant.widthRatio),
            selectionTable.topAnchor.constraint(equalTo: headView.bottomAnchor,constant: 1 * appConstant.heightRatio),
            selectionTable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -1 * appConstant.widthRatio),
            selectionTable.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -1 * appConstant.heightRatio),
        ])
    }
    
    
}

extension HeadPainPopUpController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectionTable.dequeueReusableCell(withIdentifier: SelectionTVCell.cellidentifier, for: indexPath) as! SelectionTVCell
        cell.clipsToBounds = true
        cell.titleLbl.text = btnsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 * appConstant.heightRatio
    }
    
}

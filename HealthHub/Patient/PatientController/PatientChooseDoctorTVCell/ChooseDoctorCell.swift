//
//  ChooseDoctorCell.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//

import UIKit
import Foundation
import Cosmos

class ChooseDoctorCell: UITableViewCell {
    
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 10 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Doc1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var docnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Available Doctors"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var rattingView:CosmosView = {
        let rating = CosmosView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.backgroundColor = .clear
        rating.rating = 0
        rating.settings.updateOnTouch = false
        rating.settings.starSize = 18
        rating.settings.totalStars = 1
        rating.settings.starMargin = 1
        rating.settings.filledColor = UIColor(named: Colors.PrimaryAppColor1)!
        rating.settings.emptyBorderColor = UIColor.lightGray
        rating.settings.emptyColor = .lightGray
        rating.settings.filledBorderColor = UIColor.orange
        return rating
    }()
    
    
    lazy var docrateLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "4.5"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var hospitalnamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        lbl.font = regular(size: 12)
        lbl.text = "Pulmonologist | Queens Hospital"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docfeeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = bold(size: 15)
        lbl.text = "$70"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docavailibiltyBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.TextfieldBG)
        btn.layer.shadowOpacity = 0
        //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonColor)?.cgColor
        btn.titleLabel?.font = bold(size: 12)
        btn.setTitleColor(UIColor(named: Colors.PrimaryAppColor1), for: .normal)
        btn.setTitle("Today Available", for: .normal)
        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    
    static var cellidentifier = "choosedocCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.docimg.image = nil
        self.docnameLbl.text = ""
        self.docrateLbl.text = ""
        self.hospitalnamelbl.text = ""
        self.docfeeLbl.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func chnagebtn_press(){
        
    }
    
    func setupCell(){
        
        contentView.addSubview(topView)
        topView.addSubview(docimg)
        topView.addSubview(docnameLbl)
        topView.addSubview(rattingView)
        
        topView.addSubview(docrateLbl)
        topView.addSubview(hospitalnamelbl)
        
        topView.addSubview(docavailibiltyBtn)
        topView.addSubview(docfeeLbl)
        
        
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            docimg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 16 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 14 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            docnameLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20 * appConstant.heightRatio),
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            docnameLbl.trailingAnchor.constraint(equalTo: rattingView.leadingAnchor, constant: -4 * appConstant.widthRatio),
            //  docnameLbl.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            
            rattingView.centerYAnchor.constraint(equalTo: docnameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            rattingView.trailingAnchor.constraint(equalTo: docrateLbl.leadingAnchor, constant: -5 * appConstant.widthRatio),
            rattingView.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
//            rattingView.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            docrateLbl.centerYAnchor.constraint(equalTo: rattingView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            docrateLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            docrateLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            docrateLbl.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            
            hospitalnamelbl.topAnchor.constraint(equalTo: docnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            hospitalnamelbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
            hospitalnamelbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            hospitalnamelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            docavailibiltyBtn.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 7 * appConstant.heightRatio),
            docavailibiltyBtn.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 12 * appConstant.widthRatio),
            docavailibiltyBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            docavailibiltyBtn.widthAnchor.constraint(equalToConstant: 100 * appConstant.widthRatio),
            
            docfeeLbl.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            docfeeLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            docfeeLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        ])
        
        
        
    }
    
    
}

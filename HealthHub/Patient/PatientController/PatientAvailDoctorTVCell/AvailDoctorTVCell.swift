//
//  AvailDoctorTVCell.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class AvailDoctorTVCell: UITableViewCell {
    
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
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
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Available Doctors"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docrateLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .center
        lbl.font = regular(size: 11)
        lbl.text = "4.5"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var hospitalnamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .center
        lbl.font = regular(size: 11)
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
        lbl.textColor = UIColor(named: Colors.TextColor)
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
        btn.titleLabel?.font = bold(size: 11)
        btn.setTitleColor(UIColor(named: Colors.ButtonColor), for: .normal)
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
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 26 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //  docnameLbl.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            docrateLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 25 * appConstant.heightRatio),
            docrateLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -28 * appConstant.widthRatio),
            docrateLbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            hospitalnamelbl.topAnchor.constraint(equalTo: docnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            hospitalnamelbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 26 * appConstant.widthRatio),
            hospitalnamelbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            hospitalnamelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            docavailibiltyBtn.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 7 * appConstant.heightRatio),
            docavailibiltyBtn.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 26 * appConstant.widthRatio),
            docavailibiltyBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            docfeeLbl.topAnchor.constraint(equalTo: hospitalnamelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            docfeeLbl.leadingAnchor.constraint(equalTo: docavailibiltyBtn.trailingAnchor, constant: 77 * appConstant.widthRatio),
            docfeeLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        ])
        
        
        
    }
    
    
}

//
//  DoctorCategoryTVCell.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//

import UIKit

class DoctorCategoryTVCell: UITableViewCell {
    
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 10 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowRadius = 3 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var doctypenameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.font = medium(size: 15)
        lbl.text = "Pulmonology"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var totaldocLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.layer.cornerRadius = 4 * appConstant.heightRatio
        lbl.textAlignment = .center
        lbl.font = bold(size: 15)
        lbl.text = "236"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        topView.addSubview(doctypenameLbl)
        topView.addSubview(totaldocLbl)
        
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            doctypenameLbl.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            doctypenameLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 11 * appConstant.widthRatio),
            doctypenameLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            totaldocLbl.centerYAnchor.constraint(equalTo: doctypenameLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            totaldocLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 5 * appConstant.heightRatio),
            totaldocLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            totaldocLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            totaldocLbl.widthAnchor.constraint(equalToConstant: 41 * appConstant.widthRatio),
            
            
        ])
        
    }
    
}

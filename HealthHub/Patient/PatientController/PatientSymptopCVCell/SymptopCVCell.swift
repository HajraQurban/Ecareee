//
//  SymptopCVCell.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

import UIKit

class SymptopCVCell: UICollectionViewCell {
    
    var selectLbl : UILabel = {
        let textLbl = UILabel()
        textLbl.textColor = .white
        textLbl.layer.cornerRadius = 12 * appConstant.heightRatio
        textLbl.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        textLbl.font = regular(size: 15)
        textLbl.textAlignment = .center
        textLbl.numberOfLines = 1
        textLbl.layer.cornerRadius = 8 * appConstant.heightRatio
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        return textLbl
    }()
    
    lazy var crossBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "CrossIcon"), for: .normal)
        //  btn.setTitle("Get Started", for: .normal)
        //    btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    static var identifier: String = "filter"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 8 * appConstant.heightRatio
        contentView.layer.cornerRadius = 8 * appConstant.heightRatio
        contentView.clipsToBounds = true
        //        selectLbl.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        //        selectLbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func setupCell(){
        self.contentView.addSubview(selectLbl)
        self.contentView.addSubview(crossBtn)
        
        
        NSLayoutConstraint.activate([
            
            selectLbl.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0 * appConstant.widthRatio),
            selectLbl.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            selectLbl.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            selectLbl.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -0 * appConstant.widthRatio),
            
            selectLbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            crossBtn.centerYAnchor.constraint(equalTo: selectLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
            crossBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            crossBtn.heightAnchor.constraint(equalToConstant: 15 * appConstant.heightRatio),
            crossBtn.widthAnchor.constraint(equalToConstant: 15 * appConstant.heightRatio),
            
            
        ])
        
    }
    
}

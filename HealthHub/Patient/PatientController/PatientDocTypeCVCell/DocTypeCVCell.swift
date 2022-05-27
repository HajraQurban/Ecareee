//
//  DocTypeCVCell.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class DocTypeCVCell: UICollectionViewCell {
    
    lazy var illnesstitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.layer.cornerRadius = 5 * appConstant.heightRatio
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "Dental care"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        contentView.addSubview(illnesstitlelbl)
        
        NSLayoutConstraint.activate([
            
            illnesstitlelbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            illnesstitlelbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            illnesstitlelbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            illnesstitlelbl.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            //  datetitleLbl.widthAnchor.constraint(equalToConstant: 76 * appConstant.widthRatio),
            
        ])
        
    }
}

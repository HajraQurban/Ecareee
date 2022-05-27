//
//  DocTimeCVCell.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

import UIKit

class DocTimeCVCell: UICollectionViewCell {
    
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 5 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowRadius = 0 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var selectLbl : UILabel = {
        let textLbl = UILabel()
        textLbl.textColor = UIColor(named: Colors.TextColor)
        textLbl.font = semiBold(size: 24)
        textLbl.textAlignment = .center
        textLbl.numberOfLines = 1
        textLbl.layer.cornerRadius = 8 * appConstant.heightRatio
        textLbl.sizeToFit()
        textLbl.adjustsFontSizeToFitWidth = true
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        return textLbl
    }()
    
    static var identifier: String = "filter"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 8 * appConstant.heightRatio
        contentView.layer.cornerRadius = 8 * appConstant.heightRatio
        contentView.clipsToBounds = true
        selectLbl.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        selectLbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
//    override var isSelected: Bool {
//        didSet {
//            print("isSelected,",isSelected)
//            //  contentView.backgroundColor =  isSelected ? UIColor(named: Colors.ButtonBG) : .white
//            selectLbl.textColor = isSelected ? UIColor(named: Colors.AppColor) : .gray
//            selectLbl.font = isSelected ? semiBold(size: 24) :  regular(size: 13)
//        }
//    }
    
    func setupCell(){
        self.contentView.addSubview(topView)
        self.topView.addSubview(selectLbl)
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            selectLbl.leadingAnchor.constraint(equalTo: self.topView.leadingAnchor, constant: 4 * appConstant.widthRatio),
            selectLbl.trailingAnchor.constraint(equalTo: self.topView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            selectLbl.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 4 * appConstant.widthRatio),
            selectLbl.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: -4 * appConstant.widthRatio),
            
        ])
        
        
    }
}

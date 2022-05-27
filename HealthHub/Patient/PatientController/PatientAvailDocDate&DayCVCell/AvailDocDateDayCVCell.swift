//
//  AvailDocDateDayCVCell.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class AvailDocDateDayCVCell: UICollectionViewCell {
    
    
    lazy var datetitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .center
        lbl.font = medium(size: 21)
        lbl.text = "18"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var daytitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "mon"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var circleView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 4 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        datetitleLbl.text = ""
        daytitleLbl.text = ""
        circleView.backgroundColor = .clear
    }
    
    override var isSelected: Bool {
        didSet {
            //  contentView.backgroundColor =  isSelected ? UIColor(named: Colors.ButtonBG) : .white
            datetitleLbl.textColor = isSelected ? UIColor.white : .gray
            datetitleLbl.font = isSelected ? semiBold(size: 24) : regular(size: 13)
            daytitleLbl.textColor = isSelected ? UIColor.white : .gray
            daytitleLbl.font = isSelected ? semiBold(size: 24) : regular(size: 13)
            contentView.backgroundColor = isSelected ? UIColor(named: Colors.PrimaryAppColor1) : .clear
            
        }
    }
    
    func setupCell(){
        contentView.addSubview(datetitleLbl)
        contentView.addSubview(daytitleLbl)
        contentView.addSubview(circleView)
        
        NSLayoutConstraint.activate([
            
            datetitleLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0 * appConstant.heightRatio),
            datetitleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            datetitleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            datetitleLbl.heightAnchor.constraint(equalToConstant: 27 * appConstant.heightRatio),
            
            //
            daytitleLbl.topAnchor.constraint(equalTo: datetitleLbl.bottomAnchor, constant: 2),
            daytitleLbl.centerXAnchor.constraint(equalTo: datetitleLbl.centerXAnchor, constant: 0 * appConstant.heightRatio),
            
            daytitleLbl.heightAnchor.constraint(equalToConstant: 15 * appConstant.heightRatio),
            
            
            circleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            circleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            circleView.heightAnchor.constraint(equalToConstant: 8 * appConstant.heightRatio),
            circleView.widthAnchor.constraint(equalToConstant: 8 * appConstant.heightRatio),
            
            
        ])
        
    }
}

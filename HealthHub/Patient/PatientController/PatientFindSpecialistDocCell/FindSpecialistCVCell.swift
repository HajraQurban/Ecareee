//
//  FindSpecialistCVCell.swift
//  HealthHub
//
//  Created by OBS on 14/12/2021.
//

import UIKit

class FindSpecialistCVCell: UICollectionViewCell {
    
    lazy var CellView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 12 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var TypeImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Categorylogo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var TypetitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = semiBold(size: 13)
        lbl.text = "Dental"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    
    static var identifier: String = "Finddoc"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 0 * appConstant.heightRatio
        contentView.layer.cornerRadius = 0 * appConstant.heightRatio
        contentView.clipsToBounds = false
        setupCell()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.TypeImage.image = nil
        self.TypetitleLbl.text = ""
    }
    
    func setupCell(){
        
        contentView.addSubview(CellView)
        CellView.addSubview(TypeImage)
        CellView.addSubview(TypetitleLbl)
        
        NSLayoutConstraint.activate([
            
            CellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5 * appConstant.heightRatio),
            CellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5 * appConstant.widthRatio),
            CellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            CellView.heightAnchor.constraint(equalToConstant: 107 * appConstant.heightRatio),
            CellView.widthAnchor.constraint(equalToConstant: 98 * appConstant.widthRatio),
            
            TypeImage.topAnchor.constraint(equalTo: CellView.topAnchor, constant: 15 * appConstant.heightRatio),
            TypeImage.leadingAnchor.constraint(equalTo: CellView.leadingAnchor, constant: 32 * appConstant.widthRatio),
            TypeImage.trailingAnchor.constraint(equalTo: CellView.trailingAnchor, constant: -32 * appConstant.widthRatio),
            TypeImage.heightAnchor.constraint(equalToConstant: 50 * appConstant.heightRatio),
//            TypeImage.widthAnchor.constraint(equalToConstant: 50 * appConstant.widthRatio),
            
            TypetitleLbl.topAnchor.constraint(equalTo: TypeImage.bottomAnchor, constant: 6 * appConstant.heightRatio),
            TypetitleLbl.leadingAnchor.constraint(equalTo: CellView.leadingAnchor, constant: 6.5 * appConstant.widthRatio),
            TypetitleLbl.trailingAnchor.constraint(equalTo: CellView.trailingAnchor, constant: -6.5 * appConstant.widthRatio),
            TypetitleLbl.centerXAnchor.constraint(equalTo: TypeImage.centerXAnchor, constant: 0 * appConstant.heightRatio),
            TypetitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        ])
        
        
    }
    
}

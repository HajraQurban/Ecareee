//
//  PatientReviewsTVCell.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

import UIKit
import Cosmos


class PatientReviewsTVCell: UITableViewCell {
    
    lazy var patnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.font = medium(size: 15)
        lbl.text = "Joseph Hill"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var DocImg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Doc1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var rattingView:CosmosView = {
        let rating = CosmosView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.backgroundColor = .clear
        rating.rating = 0
        rating.settings.updateOnTouch = false
        rating.settings.starSize = 18
        rating.settings.starMargin = 3
        rating.settings.filledColor = UIColor(named: Colors.PrimaryAppColor1) ?? .gray
        rating.settings.emptyBorderColor = UIColor.lightGray
        rating.settings.emptyColor = .lightGray
        rating.settings.filledBorderColor = UIColor.orange
        return rating
    }()
    
    
    lazy var patreviewdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.backgroundColor = .clear
        lbl.textAlignment = .left
        lbl.font = regular(size: 15)
        lbl.text = "I love the doctor! She’s very petient in explnaing things and presenting benefits and sideffects of the treatments. She also presentedmultipel options. there is lot of doctor but this doctor have a extra abilities to set the patient health."
        lbl.numberOfLines = 3
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    static var cellidentifier = "choosedocCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 8
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(){
        contentView.addSubview(DocImg)
        contentView.addSubview(patnameLbl)
        contentView.addSubview(rattingView)
        contentView.addSubview(patreviewdescLbl)
        contentView.addSubview(lineView)
        
        NSLayoutConstraint.activate([
            
            DocImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            DocImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3 * appConstant.widthRatio),
            DocImg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            DocImg.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            patnameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8 * appConstant.heightRatio),
            patnameLbl.leadingAnchor.constraint(equalTo: DocImg.trailingAnchor, constant: 10 * appConstant.widthRatio),
            patnameLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            rattingView.topAnchor.constraint(equalTo: patnameLbl.bottomAnchor, constant: 2 * appConstant.heightRatio),
            rattingView.leadingAnchor.constraint(equalTo: DocImg.trailingAnchor, constant: 8 * appConstant.widthRatio),
            rattingView.heightAnchor.constraint(equalToConstant: 15 * appConstant.heightRatio),
                        
            patreviewdescLbl.topAnchor.constraint(equalTo: DocImg.bottomAnchor, constant: 4 * appConstant.heightRatio),
            patreviewdescLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5 * appConstant.widthRatio),
            patreviewdescLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            //  patreviewdescLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8 * appConstant.heightRatio),
            
            lineView.topAnchor.constraint(equalTo: patreviewdescLbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            lineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
//            lineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -2 * appConstant.heightRatio),

            
            
        ])
        
    }
}

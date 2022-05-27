//
//  SeeAllPatientAvailableRequestCell.swift
//  HealthHub
//
//  Created by OBS on 27/01/2022.
//

import UIKit

class SeeAllPatientAvailableRequestCell: UITableViewCell {

    
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
    
    
    
    lazy var patnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.font = medium(size: 16)
        lbl.text = "Peter parker"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var patImg : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "NA1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
 
    
    lazy var patdiseasenameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.backgroundColor = .clear
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Migrane |  Asthma"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var patientavailibiltyLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.layer.cornerRadius = 6 * appConstant.heightRatio
        lbl.textAlignment = .center
        lbl.font = regular(size: 11)
        lbl.text = "Today Available"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    static var cellidentifier = "choosedocCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .white
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
        
        contentView.addSubview(topView)
        topView.addSubview(patImg)
        topView.addSubview(patnameLbl)
        topView.addSubview(patdiseasenameLbl)
        topView.addSubview(patientavailibiltyLbl)
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            patImg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10 * appConstant.heightRatio),
            patImg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            patImg.heightAnchor.constraint(equalToConstant: 78 * appConstant.heightRatio),
            patImg.widthAnchor.constraint(equalToConstant: 78 * appConstant.heightRatio),
            
            patnameLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20 * appConstant.heightRatio),
            patnameLbl.leadingAnchor.constraint(equalTo: patImg.trailingAnchor, constant: 10 * appConstant.widthRatio),
            patnameLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            patdiseasenameLbl.topAnchor.constraint(equalTo: patnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            patdiseasenameLbl.leadingAnchor.constraint(equalTo: patImg.trailingAnchor, constant: 10 * appConstant.widthRatio),
            patdiseasenameLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            patdiseasenameLbl.heightAnchor.constraint(equalToConstant: 15 * appConstant.heightRatio),
                        
            patientavailibiltyLbl.topAnchor.constraint(equalTo: patdiseasenameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            patientavailibiltyLbl.leadingAnchor.constraint(equalTo: patdiseasenameLbl.leadingAnchor),
            patientavailibiltyLbl.widthAnchor.constraint(equalToConstant: 140 * appConstant.widthRatio),
//            patientavailibiltyLbl.trailingAnchor.constraint(equalTo: patdiseasenameLbl.trailingAnchor),
          //  patientavailibiltyLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8 * appConstant.heightRatio),
        
        ])
        
    }

}

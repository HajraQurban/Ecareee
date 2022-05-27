//
//  ReviewListTVCell.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit

class ReviewListTVCell: UITableViewCell {

    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.layer.cornerRadius  = 10
//        view.layer.shadowColor = UIColor(named: Colors.Textcolormedialbl)?.cgColor
//        view.layer.shadowRadius = 3
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Patienttitlename : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Patient Name"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var Patientname : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "Mary jane"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 29 * appConstant.heightRatio
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "NA1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var Reviewtitlename : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
        lbl.text = "Review"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var Reviewdesc : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "Doctor was really nice. He is very patient in explaining things and presenting benefits and sideeffects of treatments."
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    lazy var Calanderimg : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Calendar")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var appointmentdatelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "01/21/2022"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    

    lazy var editBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowRadius = 0
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "EditIcon"), for: .normal)
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var deleteBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "DeleteIcon"), for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowRadius = 0
        btn.layer.shadowOpacity = 0
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    static var cellidentifier = "chooseReviewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        editBtn.isHidden = true
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
        topView.addSubview(Patienttitlename)
        topView.addSubview(Patientname)
        topView.addSubview(docimg)
        topView.addSubview(Reviewtitlename)
        topView.addSubview(Reviewdesc)
        topView.addSubview(lineView)
        topView.addSubview(Calanderimg)
        topView.addSubview(appointmentdatelbl)
        topView.addSubview(editBtn)
        topView.addSubview(deleteBtn)
        
        NSLayoutConstraint.activate([
        
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            Patienttitlename.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12 * appConstant.heightRatio),
            Patienttitlename.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            Patienttitlename.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            Patientname.topAnchor.constraint(equalTo: Patienttitlename.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Patientname.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            Patientname.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),


            docimg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 13 * appConstant.heightRatio),
            docimg.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 58 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 58 * appConstant.widthRatio),


            Reviewtitlename.topAnchor.constraint(equalTo: Patientname.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Reviewtitlename.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            Reviewtitlename.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            Reviewdesc.topAnchor.constraint(equalTo: Reviewtitlename.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Reviewdesc.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            Reviewdesc.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -21 * appConstant.widthRatio),

            Reviewdesc.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            lineView.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 21 * appConstant.heightRatio),
            lineView.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -21 * appConstant.heightRatio),
            lineView.topAnchor.constraint(equalTo: Reviewdesc.bottomAnchor,constant: 5 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),

            Calanderimg.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5 * appConstant.heightRatio),
            Calanderimg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            Calanderimg.heightAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            Calanderimg.widthAnchor.constraint(equalToConstant: 18 * appConstant.widthRatio),


            appointmentdatelbl.centerYAnchor.constraint(equalTo: Calanderimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            appointmentdatelbl.leadingAnchor.constraint(equalTo: Calanderimg.trailingAnchor, constant: 5 * appConstant.widthRatio),
            appointmentdatelbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),



            editBtn.centerYAnchor.constraint(equalTo: deleteBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            editBtn.leadingAnchor.constraint(equalTo: deleteBtn.leadingAnchor, constant: -25 * appConstant.widthRatio),
            editBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            deleteBtn.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5 * appConstant.heightRatio),
            deleteBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -21 * appConstant.widthRatio),
            deleteBtn.heightAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            deleteBtn.widthAnchor.constraint(equalToConstant: 18 * appConstant.widthRatio),
            deleteBtn.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10 * appConstant.heightRatio),

            
          
           
        
        ])
        
        
        
    }
    

}

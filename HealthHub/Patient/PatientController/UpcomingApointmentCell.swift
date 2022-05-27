//
//  UpcomingApointmentCell.swift
//  HealthHub
//
//  Created by OBS on 20/01/2022.
//

import UIKit

class UpcomingApointmentCell: UITableViewCell {

    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 10 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowRadius = 5 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var datetimehospitaltitleLbl : UILabel = {
        let lbl = EdgeInsetLabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.layer.cornerRadius = 5 * appConstant.heightRatio
        lbl.textAlignment = .center
        lbl.font = medium(size: 11)
        lbl.text = "20 Jan 2021, 9:30  AM, St. Patrick Hospital "
        lbl.numberOfLines = 0
       // let label = PaddingLabel(withInsets: 8 * appConstant.heightRatio, 8 * appConstant.heightRatio, 16 * appConstant.widthRatio, -16 * appConstant.widthRatio)
        lbl.textInsets = UIEdgeInsets(top: 2 * appConstant.heightRatio, left: 6 * appConstant.widthRatio, bottom: 2 * appConstant.heightRatio, right: 6 * appConstant.widthRatio)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var doctypetitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor.clear
        lbl.textColor = UIColor.black
        lbl.layer.cornerRadius = 5 * appConstant.heightRatio
        lbl.textAlignment = .left
        lbl.font = bold(size: 16)
        lbl.text = "PULMONOLOGY: Yearly scan"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docnametitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor.clear
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.layer.cornerRadius = 5 * appConstant.heightRatio
        lbl.textAlignment = .left
        lbl.font = medium(size: 13)
        lbl.text = "Dr. Anna Nicholas"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
//        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8 * appConstant.heightRatio
        iv.backgroundColor = UIColor(named: Colors.TextfieldBG)
        iv.image = UIImage(named: "MsgIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    

    
    static var cellidentifier = "UpcomingappointCell"
    
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
        topView.addSubview(datetimehospitaltitleLbl)
        topView.addSubview(docimg)
       
        
        topView.addSubview(doctypetitleLbl)
        topView.addSubview(docnametitleLbl)
        
       
        
        
        NSLayoutConstraint.activate([
        
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            docimg.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -14 * appConstant.widthRatio),
            docimg.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
          //  docimg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20 * appConstant.heightRatio),
            docimg.heightAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 38 * appConstant.heightRatio),
          //  docimg.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20 * appConstant.heightRatio),

            
            datetimehospitaltitleLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12 * appConstant.heightRatio),
            datetimehospitaltitleLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            datetimehospitaltitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            //
            doctypetitleLbl.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            doctypetitleLbl.trailingAnchor.constraint(equalTo: docimg.leadingAnchor, constant: -8 * appConstant.heightRatio),
            doctypetitleLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            doctypetitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            //
            
            docnametitleLbl.topAnchor.constraint(equalTo: doctypetitleLbl.bottomAnchor, constant: 3 * appConstant.heightRatio),
            docnametitleLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            docnametitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            docnametitleLbl.trailingAnchor.constraint(equalTo: docimg.leadingAnchor, constant: -8 * appConstant.heightRatio),

        
        ])
        
        
        
    }
    


}

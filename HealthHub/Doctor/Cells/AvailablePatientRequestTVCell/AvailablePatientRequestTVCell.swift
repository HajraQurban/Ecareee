//
//  AvailablePatientRequestTVCell.swift
//  HealthHub
//
//  Created by OBS on 27/01/2022.
//

import UIKit

class AvailablePatientRequestTVCell: UITableViewCell {

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
    
    lazy var patientimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "NA1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var patientnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = bold(size: 18)
        lbl.text = "Natasha"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    
    lazy var patientcircleimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "PatientCircleImg")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isHidden = true
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
    
    lazy var creditLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.systemGray
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "25 credits"
        lbl.isHidden  = true
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docavailibiltyBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.shadowOpacity = 0
      //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonColor)?.cgColor
        btn.titleLabel?.font = bold(size: 11)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Accept", for: .normal)
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    lazy var rejectBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.buttonRed)
        btn.layer.shadowOpacity = 0
      //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.buttonRed)?.cgColor
        btn.titleLabel?.font = bold(size: 11)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Reject", for: .normal)
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    

    
    static var cellidentifier = "choosepatientCell"
    
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
        topView.addSubview(patientimg)
        topView.addSubview(patientnameLbl)
    
        topView.addSubview(appointmentdatelbl)
        topView.addSubview(patientcircleimg)
        topView.addSubview(creditLbl)
        topView.addSubview(docavailibiltyBtn)
        topView.addSubview(rejectBtn)
       
        
        
        NSLayoutConstraint.activate([
        
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            patientimg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 22 * appConstant.heightRatio),
            patientimg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 5 * appConstant.widthRatio),
            patientimg.heightAnchor.constraint(equalToConstant: 73 * appConstant.heightRatio),
            patientimg.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            patientnameLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 25 * appConstant.heightRatio),
            patientnameLbl.leadingAnchor.constraint(equalTo: patientimg.trailingAnchor, constant: 5 * appConstant.widthRatio),
            patientnameLbl.trailingAnchor.constraint(equalTo: docavailibiltyBtn.leadingAnchor, constant: -4 * appConstant.widthRatio),
            patientnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
          //  docnameLbl.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
        
    
            
            appointmentdatelbl.topAnchor.constraint(equalTo: patientnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            appointmentdatelbl.leadingAnchor.constraint(equalTo: patientimg.trailingAnchor, constant: 5 * appConstant.widthRatio),
            appointmentdatelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            
            
            patientcircleimg.centerYAnchor.constraint(equalTo: patientimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            patientcircleimg.trailingAnchor.constraint(equalTo: creditLbl.leadingAnchor, constant: -10 * appConstant.widthRatio),
            patientcircleimg.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            creditLbl.centerYAnchor.constraint(equalTo: patientcircleimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            creditLbl.trailingAnchor.constraint(equalTo: docavailibiltyBtn.leadingAnchor, constant: -10 * appConstant.widthRatio),
            creditLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),

            
            docavailibiltyBtn.topAnchor.constraint(equalTo: patientimg.topAnchor, constant: 0 * appConstant.heightRatio),
            docavailibiltyBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            docavailibiltyBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            docavailibiltyBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.widthRatio),

            rejectBtn.bottomAnchor.constraint(equalTo: patientimg.bottomAnchor, constant: 0 * appConstant.heightRatio),
            rejectBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            rejectBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            rejectBtn.widthAnchor.constraint(equalToConstant: 50 * appConstant.widthRatio),
        
        ])
        
        
        
    }
    


}

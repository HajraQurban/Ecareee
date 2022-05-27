//
//  AvailableSlotTVCell.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit

class AvailableSlotTVCell: UITableViewCell {

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
    
    lazy var Slotnumber : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = medium(size: 12)
        lbl.text = "Slot # 1"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SlotStartTime : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.backgroundColor = .white
        lbl.layer.cornerRadius = 8 * appConstant.heightRatio
        lbl.font = medium(size: 10)
        lbl.text = "Start time: 16:24 am"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var SlotEndTime : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.backgroundColor = .white
        lbl.layer.cornerRadius = 8 * appConstant.heightRatio
        lbl.font =  medium(size: 10)
        lbl.text = "End time: 17:24 am"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docavailibiltyBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.shadowOpacity = 0
      //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 16 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonColor)?.cgColor
        btn.titleLabel?.font = bold(size: 16)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Available", for: .normal)
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var descTF : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "Description: Any sort of description will be added as required"
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
        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
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
        btn.tintColor = UIColor(named: Colors.PrimaryAppColor1)
//        btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    static var cellidentifier = "chooseSlotCell"
    
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
        topView.addSubview(Slotnumber)
        topView.addSubview(SlotStartTime)
        topView.addSubview(SlotEndTime)
        topView.addSubview(docavailibiltyBtn)
        topView.addSubview(descTF)
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
            
            Slotnumber.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10 * appConstant.heightRatio),
            Slotnumber.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            Slotnumber.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            SlotStartTime.topAnchor.constraint(equalTo: Slotnumber.bottomAnchor, constant: 9 * appConstant.heightRatio),
            SlotStartTime.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21 * appConstant.widthRatio),
            SlotStartTime.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            SlotStartTime.widthAnchor.constraint(equalToConstant: 90 * appConstant.widthRatio),
            
            
            SlotEndTime.centerYAnchor.constraint(equalTo: SlotStartTime.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SlotEndTime.leadingAnchor.constraint(equalTo: SlotStartTime.trailingAnchor, constant: 15 * appConstant.widthRatio),
            SlotEndTime.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            SlotEndTime.widthAnchor.constraint(equalToConstant: 90 * appConstant.widthRatio),
            
        
            descTF.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 26 * appConstant.heightRatio),
            descTF.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -54 * appConstant.heightRatio),
            descTF.topAnchor.constraint(equalTo: SlotStartTime.bottomAnchor,constant: 5 * appConstant.heightRatio),
            descTF.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),

            lineView.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 21 * appConstant.heightRatio),
            lineView.trailingAnchor.constraint(equalTo: topView.trailingAnchor,constant: -21 * appConstant.heightRatio),
            lineView.topAnchor.constraint(equalTo: descTF.bottomAnchor,constant: 5 * appConstant.heightRatio),
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
            
            docavailibiltyBtn.topAnchor.constraint(equalTo: topView.topAnchor, constant: 13 * appConstant.heightRatio),
            docavailibiltyBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20 * appConstant.widthRatio),
            docavailibiltyBtn.heightAnchor.constraint(equalToConstant: 32 * appConstant.heightRatio),
            docavailibiltyBtn.widthAnchor.constraint(equalToConstant: 83 * appConstant.widthRatio),
        
        ])
        
    }
    
}

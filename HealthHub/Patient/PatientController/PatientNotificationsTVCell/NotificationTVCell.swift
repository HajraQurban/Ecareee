//
//  NotificationTVCell.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class NotificationTVCell: UITableViewCell {
    
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 10
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Profile_img")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var docnameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "HealthHUB Support"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 13)
        lbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ..."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var docavailibiltyBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.TextfieldBG)
        btn.layer.shadowOpacity = 0
        //  btn.layer.borderWidth = 1 * appConstant.heightRatio
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonColor)?.cgColor
        btn.titleLabel?.font = medium(size: 11)
        btn.setTitleColor(UIColor(named: Colors.ButtonColor), for: .normal)
        btn.setTitle("20 Jan", for: .normal)
        //      btn.addTarget(self, action: #selector(chnagebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var circleView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.ButtonBG)
        view.layer.cornerRadius = 6 * appConstant.heightRatio
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
        topView.addSubview(docimg)
        topView.addSubview(docnameLbl)
        topView.addSubview(docdescLbl)
        topView.addSubview(docavailibiltyBtn)
        topView.addSubview(circleView)
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            docimg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 25 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            docnameLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20 * appConstant.heightRatio),
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 20 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //  docnameLbl.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            
            docavailibiltyBtn.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20 * appConstant.heightRatio),
            docavailibiltyBtn.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -4 * appConstant.widthRatio),
            docavailibiltyBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
//            docavailibiltyBtn.widthAnchor.constraint(equalToConstant: 80 * appConstant.widthRatio),
            
            
            docdescLbl.topAnchor.constraint(equalTo: docnameLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            docdescLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 20 * appConstant.widthRatio),
            docdescLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -22 * appConstant.widthRatio),
            docdescLbl.heightAnchor.constraint(equalToConstant: 40 * appConstant.heightRatio),
            
            
            circleView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: -0),
            circleView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8),
            circleView.heightAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
            circleView.widthAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
            
            
        ])
        
        
    }
    
    
}

//
//  ChatMessageTVCell.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class ChatMessageTVCell: UITableViewCell {
    
    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius  = 10
        view.layer.shadowColor = UIColor.black.cgColor
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
    
    lazy var docdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .left
        lbl.layer.cornerRadius = 12 * appConstant.heightRatio
        lbl.font = regular(size: 13)
        lbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ..."
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var doctimeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.font = regular(size: 11)
        lbl.text = "14:20"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var clientimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "Profile_img")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var clientdescLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.layer.cornerRadius = 12 * appConstant.heightRatio
        lbl.backgroundColor = UIColor(named: Colors.AppColor)
        lbl.font = regular(size: 13)
        lbl.text = "I’m better, less fatigued, but still coughing"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var clienttimeLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.TextColor)
        lbl.textAlignment = .left
        lbl.font = regular(size: 11)
        lbl.text = "14:20"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
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
        topView.addSubview(docdescLbl)
        topView.addSubview(doctimeLbl)
        topView.addSubview(clientimg)
        topView.addSubview(clientdescLbl)
        topView.addSubview(clienttimeLbl)
        
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            topView.heightAnchor.constraint(equalToConstant: 270 * appConstant.heightRatio),
            
            
            
            docimg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            
            docdescLbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0 * appConstant.heightRatio),
            docdescLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 20 * appConstant.widthRatio),
            docdescLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            
            docdescLbl.heightAnchor.constraint(equalToConstant: 88 * appConstant.heightRatio),
            
            
            
            doctimeLbl.topAnchor.constraint(equalTo: docdescLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            doctimeLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 55 * appConstant.widthRatio),
            doctimeLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            clientimg.topAnchor.constraint(equalTo: docdescLbl.bottomAnchor, constant: 21 * appConstant.heightRatio),
            clientimg.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -0 * appConstant.widthRatio),
            clientimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            clientimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            
            clientdescLbl.topAnchor.constraint(equalTo: doctimeLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
            clientdescLbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            clientdescLbl.trailingAnchor.constraint(equalTo: clientimg.leadingAnchor, constant: -10 * appConstant.widthRatio),
            
            clientdescLbl.heightAnchor.constraint(equalToConstant: 88 * appConstant.heightRatio),
            clientdescLbl.centerYAnchor.constraint(equalTo: clientimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            
            
            
            clienttimeLbl.topAnchor.constraint(equalTo: clientdescLbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
            clienttimeLbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -55 * appConstant.widthRatio),
            clienttimeLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
        ])
        
    }
    
}

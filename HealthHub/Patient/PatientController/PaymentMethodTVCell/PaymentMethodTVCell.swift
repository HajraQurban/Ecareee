//
//  PaymentMethodTVCell.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class PaymentMethodTVCell: UITableViewCell {

    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 36 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.15
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
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "HealthHUB Support"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    static var cellidentifier = "choosepaymentCell"
    
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
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            docimg.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            docimg.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            docimg.widthAnchor.constraint(equalToConstant: 36 * appConstant.widthRatio),
            
            docnameLbl.centerYAnchor.constraint(equalTo: docimg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            docnameLbl.leadingAnchor.constraint(equalTo: docimg.trailingAnchor, constant: 20 * appConstant.widthRatio),
            docnameLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            //  docnameLbl.widthAnchor.constraint(equalToConstant: 73 * appConstant.widthRatio),
            
            
        ])
        
        
    }
    

}

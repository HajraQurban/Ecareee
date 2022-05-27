//
//  SideMenuTVCell.swift
//  HealthHub
//
//  Created by OBS on 31/01/2022.
//

import UIKit

class SideMenuTVCell: UITableViewCell {

    lazy var topView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
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
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()
    

    static var cellidentifier = "choosesideCell"
    
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
        
        contentView.addSubview(topView)
        topView.addSubview(patImg)
        topView.addSubview(patnameLbl)
       
        
        NSLayoutConstraint.activate([
            
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            patImg.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10 * appConstant.heightRatio),
            patImg.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20 * appConstant.widthRatio),
            patImg.heightAnchor.constraint(equalToConstant: 23 * appConstant.heightRatio),
            patImg.widthAnchor.constraint(equalToConstant: 23 * appConstant.heightRatio),
            
            patnameLbl.centerYAnchor.constraint(equalTo: patImg.centerYAnchor, constant: 0 * appConstant.heightRatio),
            patnameLbl.leadingAnchor.constraint(equalTo: patImg.trailingAnchor, constant: 10 * appConstant.widthRatio),
            patnameLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        
        ])
        
    }


}

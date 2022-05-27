//
//  SpecialistDocTVCell.swift
//  HealthHub
//
//  Created by OBS on 15/12/2021.
//

import UIKit

class SpecialistDocTVCell: UITableViewCell {
    
    lazy var doctypenameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.backgroundColor = .clear
        lbl.textAlignment = .center
        lbl.font = medium(size: 15)
        lbl.text = "Shortness of breath (dyspnea)"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var boldIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BoldIcon")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = UIColor(named: Colors.PrimaryAppColor1)
        iv.clipsToBounds = true
        return iv
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(){
        contentView.addSubview(doctypenameLbl)
        contentView.addSubview(boldIcon)
        
        NSLayoutConstraint.activate([
            
            
            boldIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10 * appConstant.heightRatio),
            boldIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0 * appConstant.widthRatio),
            boldIcon.heightAnchor.constraint(equalToConstant: 8 * appConstant.heightRatio),
            
            doctypenameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5 * appConstant.heightRatio),
            doctypenameLbl.leadingAnchor.constraint(equalTo: boldIcon.trailingAnchor, constant: 9 * appConstant.widthRatio),
            doctypenameLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        ])
        
    }
    
}

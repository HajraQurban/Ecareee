//
//  DeasesPopUp.swift
//  HealthHub
//
//  Created by OBS on 22/12/2021.
//

import Foundation
import UIKit


class SelectionTVCell: UITableViewCell {
    
    var titleLbl : UILabel = {
        let textLbl = UILabel()
        textLbl.textColor = .black
        textLbl.font = regular(size: 15)
        textLbl.textAlignment = .left
        textLbl.numberOfLines = 1
        textLbl.text = "Blockchain"
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        return textLbl
    }()
    
    
    
    static var cellidentifier = "selectionCell"
    override class func awakeFromNib() {
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier : reuseIdentifier)
        self.backgroundColor = .clear
        let cellBGView = UIView()
        cellBGView.backgroundColor = .clear
        self.selectedBackgroundView = cellBGView
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        contentView.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            titleLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10 * appConstant.widthRatio),
        ])
    }
    
}


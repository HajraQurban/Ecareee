//
//  Custome.swift
//  HealthHub
//
//  Created by mac on 10/12/2021.
//

import Foundation
import UIKit


class CustomButton: UIButton {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

       setup()
    }
    
    func setup(){
        self.layer.cornerRadius = 8 * appConstant.heightRatio
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.titleLabel?.font = UIFont(name:"Gill Sans", size: 20.0 * appConstant.heightRatio)
        self.setTitleColor(UIColor.white, for: .normal)
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = false
    }
}

//
//  AllInvoicesTVCell.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class AllInvoicesTVCell: UITableViewCell {

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
    
    lazy var drnamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 12)
        lbl.text = "Dr Anna Nicholes"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var drnamefeelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 12)
        lbl.text = "$90"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var drdatelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 12)
        lbl.text = "20 January 2020"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var drtimelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = regular(size: 12)
        lbl.text = "11:30 am"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var paymentmethodtype : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.layer.cornerRadius = 8 * appConstant.heightRatio
        lbl.font = regular(size: 10)
        lbl.text = "Credit Card payment"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var diseasenamelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.layer.cornerRadius = 8 * appConstant.heightRatio
        lbl.font =  regular(size: 10)
        lbl.text = "Fatigue | Dry Cough"
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
        btn.layer.cornerRadius = 8 * appConstant.heightRatio
        btn.layer.borderColor = UIColor(named:Colors.ButtonColor)?.cgColor
        btn.titleLabel?.font = regular(size: 13)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Video Consultation", for: .normal)
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
        descTF.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var drviewmorelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
        lbl.textAlignment = .left
        lbl.font = medium(size: 12)
        lbl.text = "view more"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    static var cellidentifier = "chooseinvoiceCell"
    
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
        topView.addSubview(drnamelbl)
        topView.addSubview(paymentmethodtype)
        topView.addSubview(diseasenamelbl)
        topView.addSubview(docavailibiltyBtn)
        topView.addSubview(drnamefeelbl)
        topView.addSubview(drdatelbl)
        topView.addSubview(drtimelbl)
        topView.addSubview(drviewmorelbl)
        topView.addSubview(lineView)
       
       
       
        
        
        NSLayoutConstraint.activate([
        
            topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5 * appConstant.heightRatio),
            topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -5 * appConstant.heightRatio),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5 * appConstant.heightRatio),
            topView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5 * appConstant.heightRatio),
            
            drnamelbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10 * appConstant.heightRatio),
            drnamelbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            drnamelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            paymentmethodtype.topAnchor.constraint(equalTo: drnamelbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            paymentmethodtype.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            paymentmethodtype.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            diseasenamelbl.topAnchor.constraint(equalTo: paymentmethodtype.bottomAnchor, constant: 4 * appConstant.heightRatio),
            diseasenamelbl.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10 * appConstant.widthRatio),
            diseasenamelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
        
            docavailibiltyBtn.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 10 * appConstant.widthRatio),
            docavailibiltyBtn.topAnchor.constraint(equalTo: diseasenamelbl.bottomAnchor,constant: 4 * appConstant.heightRatio),
            docavailibiltyBtn.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            docavailibiltyBtn.widthAnchor.constraint(equalToConstant: 120 * appConstant.heightRatio),
            docavailibiltyBtn.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8 * appConstant.heightRatio),

            drnamefeelbl.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10 * appConstant.heightRatio),
            drnamefeelbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            drnamefeelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            drdatelbl.topAnchor.constraint(equalTo: drnamefeelbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            drdatelbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            drdatelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            drtimelbl.topAnchor.constraint(equalTo: drdatelbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            drtimelbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            drtimelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            drviewmorelbl.topAnchor.constraint(equalTo: drtimelbl.bottomAnchor, constant: 4 * appConstant.heightRatio),
            drviewmorelbl.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10 * appConstant.widthRatio),
            drviewmorelbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            
            lineView.trailingAnchor.constraint(equalTo: drviewmorelbl.trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: drviewmorelbl.leadingAnchor),
            lineView.topAnchor.constraint(equalTo: drviewmorelbl.bottomAnchor,constant: -2 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 1 * appConstant.heightRatio),
//            lineView.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),

        
        ])
        
    }

}

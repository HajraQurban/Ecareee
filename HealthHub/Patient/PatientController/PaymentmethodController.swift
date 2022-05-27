//
//  PaymentmethodController.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class PaymentmethodController: UIViewController {
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)?.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 18 * appConstant.heightRatio
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.tintColor = .white
      //  btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    lazy var FirstIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Num3")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var SymptoptitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 16)
        lbl.textColor = UIColor.black
        lbl.text = "Payment Method"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextColor)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var SecondIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum4")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var methodtitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 16)
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.text = "Payment"
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    lazy var SecondlineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.clipsToBounds = false
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ThirdIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "DNum4")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var totallcosttitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Total Cost"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var totallcostdescLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 18)
        lbl.textColor = UIColor(named: Colors.AppColor)
        lbl.text = "$250"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    lazy var choosepaymenttitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = medium(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "Choose your payment method"
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        return lbl
    }()
    
    
    
    lazy var DataTableview : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.clear
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    lazy var buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.layer.borderWidth = 1
       // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font = bold(size: 15)
        lbl.text = "Proceed to Payment"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var backbtnIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
   //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    var payImages : [UIImage] = [#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "4")]
    var paynameArray : [String] = ["Credit card payment","Paypal"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        setup()
        DataTableview.delegate = self
        DataTableview.dataSource = self
        DataTableview.register(PaymentMethodTVCell.self, forCellReuseIdentifier: PaymentMethodTVCell.cellidentifier)
        // Do any additional setup after loading the view.
    }
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(headerView)
        headerView.addSubview(backBtn)
        headerView.addSubview(FirstIcon)
        headerView.addSubview(SymptoptitleLbl1)
        headerView.addSubview(lineView)
        headerView.addSubview(SecondIcon)
        headerView.addSubview(methodtitleLbl1)
        headerView.addSubview(SecondlineView)
        headerView.addSubview(ThirdIcon)
        view.addSubview(totallcosttitleLbl1)
        view.addSubview(totallcostdescLbl)
        view.addSubview(choosepaymenttitleLbl1)
        view.addSubview(DataTableview)
        view.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: margin.topAnchor, constant: -48 * appConstant.heightRatio),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0  * appConstant.heightRatio),
            headerView.heightAnchor.constraint(equalToConstant: 110 * appConstant.heightRatio),
            
            backBtn.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 55 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15 * appConstant.heightRatio),
            backBtn.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            backBtn.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            FirstIcon.centerYAnchor.constraint(equalTo: backBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            FirstIcon.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 15 * appConstant.heightRatio),
            FirstIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            FirstIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            SymptoptitleLbl1.centerYAnchor.constraint(equalTo: FirstIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SymptoptitleLbl1.leadingAnchor.constraint(equalTo: FirstIcon.trailingAnchor, constant: 5 * appConstant.heightRatio),
            SymptoptitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            lineView.centerYAnchor.constraint(equalTo: FirstIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            lineView.leadingAnchor.constraint(equalTo: SymptoptitleLbl1.trailingAnchor, constant: 10 * appConstant.heightRatio),
            lineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            lineView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),

            
            SecondIcon.centerYAnchor.constraint(equalTo: lineView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SecondIcon.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 10 * appConstant.heightRatio),
            SecondIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            SecondIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
            methodtitleLbl1.centerYAnchor.constraint(equalTo: SecondIcon.centerYAnchor, constant: 0 * appConstant.heightRatio),
            methodtitleLbl1.leadingAnchor.constraint(equalTo: SecondIcon.trailingAnchor, constant: 5 * appConstant.heightRatio),
            methodtitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            SecondlineView.centerYAnchor.constraint(equalTo: methodtitleLbl1.centerYAnchor, constant: 0 * appConstant.heightRatio),
            SecondlineView.leadingAnchor.constraint(equalTo: methodtitleLbl1.trailingAnchor, constant: 10 * appConstant.heightRatio),
            SecondlineView.heightAnchor.constraint(equalToConstant: 2 * appConstant.heightRatio),
            SecondlineView.widthAnchor.constraint(equalToConstant: 30 * appConstant.widthRatio),
            
            ThirdIcon.centerYAnchor.constraint(equalTo: SecondlineView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            ThirdIcon.leadingAnchor.constraint(equalTo: SecondlineView.trailingAnchor, constant: 10 * appConstant.heightRatio),
            ThirdIcon.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            ThirdIcon.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
            
        
            totallcosttitleLbl1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12 * appConstant.heightRatio),
            totallcosttitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.heightRatio),
//            chooseSymptoptitleLbl1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.heightRatio),
            totallcosttitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            totallcostdescLbl.topAnchor.constraint(equalTo: totallcosttitleLbl1.bottomAnchor, constant: 4 * appConstant.heightRatio),
        //    backBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            totallcostdescLbl.leadingAnchor.constraint(equalTo: totallcosttitleLbl1.leadingAnchor),
            totallcostdescLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            choosepaymenttitleLbl1.topAnchor.constraint(equalTo: totallcostdescLbl.bottomAnchor, constant: 12 * appConstant.heightRatio),
            choosepaymenttitleLbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38 * appConstant.heightRatio),
            choosepaymenttitleLbl1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38 * appConstant.heightRatio),
            choosepaymenttitleLbl1.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
            
            
            DataTableview.topAnchor.constraint(equalTo:  choosepaymenttitleLbl1.bottomAnchor, constant: 10 * appConstant.heightRatio),
            DataTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20  * appConstant.widthRatio),
            DataTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
            DataTableview.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -20 * appConstant.widthRatio),
            
            
            buttonView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20 * appConstant.heightRatio),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 * appConstant.widthRatio),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),

            
            nextBtn.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            buttonLbl.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            buttonLbl.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor,constant: 0 * appConstant.widthRatio),
          //  buttonLbl.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 10 * appConstant.widthRatio),
//            buttonLbl.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: -10 * appConstant.heightRatio),
            
            
            backbtnIcon.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backbtnIcon.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: -23 * appConstant.widthRatio),
            backbtnIcon.heightAnchor.constraint(equalToConstant: 17 * appConstant.heightRatio),
            backbtnIcon.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            
            
        ])
        
    }
    
    
    @objc func backbtn_press()
    {
    self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextBtn_press(){
            
       
    }

}

extension PaymentmethodController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paynameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = DataTableview.dequeueReusableCell(withIdentifier: PaymentMethodTVCell.cellidentifier, for: indexPath) as! PaymentMethodTVCell
        
        if indexPath.row == 0
        {
            cell.topView.backgroundColor = UIColor(named: Colors.AppColor)
            cell.docnameLbl.textColor = UIColor.white
        }
        else
        {
            cell.topView.backgroundColor = UIColor.white
        }
        
        cell.docimg.image = payImages[indexPath.row]
        cell.docnameLbl.text = paynameArray[indexPath.row]
        
        return cell

       
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 * appConstant.heightRatio
    }


}

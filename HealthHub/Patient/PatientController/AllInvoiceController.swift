//
//  AllInvoiceController.swift
//  HealthHub
//
//  Created by Mac on 14/03/2022.
//

import UIKit

class AllInvoiceController: BaseController {

    lazy var allinvoicestitleLbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = bold(size: 18)
        lbl.textColor = UIColor.black
        lbl.text = "All Invoices"
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
    
    var docnameArray : [String] = ["Credit card payment","Paypal"]
    
    var docnamearray : [String] = ["Dr. Ahmer Khan","Dr. Anna Nicholas","Dr. Boris Milton"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.tintColor = .white
        DataTableview.delegate = self
        DataTableview.dataSource = self
        DataTableview.register(AllInvoicesTVCell.self, forCellReuseIdentifier: AllInvoicesTVCell.cellidentifier)
        
        headerLbl.text = "Invoices"
        setup()
        // Do any additional setup after loading the view.
    }

    func setup()
    {
        childView.addSubview(allinvoicestitleLbl1)
        childView.addSubview(DataTableview)
        
        NSLayoutConstraint.activate([
        
            allinvoicestitleLbl1.topAnchor.constraint(equalTo: childView.topAnchor, constant: 30 * appConstant.heightRatio),
            allinvoicestitleLbl1.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            allinvoicestitleLbl1.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -52 * appConstant.heightRatio),
            allinvoicestitleLbl1.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            
            DataTableview.topAnchor.constraint(equalTo:  allinvoicestitleLbl1.bottomAnchor, constant: 10 * appConstant.heightRatio),
            DataTableview.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 15  * appConstant.widthRatio),
            DataTableview.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            DataTableview.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: -20 * appConstant.widthRatio),
            
        
        ])
        
    }
    
    @objc override func backbtn_press() {
        self.dismiss(animated: true)
    }
}



extension AllInvoiceController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docnamearray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = DataTableview.dequeueReusableCell(withIdentifier: AllInvoicesTVCell.cellidentifier, for: indexPath) as! AllInvoicesTVCell
        
        cell.drnamelbl.text = docnamearray[indexPath.row]
        
        return cell

       
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = InvoicedetailController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        // self.navigationController?.pushViewController(CustomTabBarController(), animated: true)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 * appConstant.heightRatio
    }


}

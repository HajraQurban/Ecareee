//
//  ChatMessageController.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.
//

import UIKit

class ChatMessageController: BaseController, UIPopoverPresentationControllerDelegate {

    lazy var scrollview : UIScrollView = {
        let SV = UIScrollView()
        SV.backgroundColor = UIColor.clear
        SV.translatesAutoresizingMaskIntoConstraints = false
        
        return SV
    }()
    
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var DaytitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor(named: Colors.Textcolormedialbl)
        lbl.textAlignment = .center
        lbl.font = bold(size: 13)
        lbl.text = "Today"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    lazy var chatTV : UITableView = {
        let  tv = UITableView()
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor.white
        tv.layer.cornerRadius = 18 * appConstant.heightRatio
        tv.clipsToBounds = true
        tv.separatorStyle = .none
        tv.separatorStyle = .none
        tv.isScrollEnabled = true
        tv.isUserInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var MessageTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var MessageTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Write your message"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var attachmentBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowOpacity = 0
        btn.setImage(UIImage(named: "AttachIcon"), for: .normal)
      //  btn.addTarget(self, action: #selector(facebookbtn_press), for: .touchUpInside)
      
        return btn
    }()
    
    
    lazy var sendmsgBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.ButtonBG)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.layer.shadowOpacity = 0.5
        btn.contentMode = .scaleToFill
        btn.setImage(UIImage(named: "Send"), for: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(popbtn_press), for: .touchUpInside)
        return btn
    }()
    
    
    var docImages : [UIImage] = [#imageLiteral(resourceName: "Doc1")]
    var docmessageArray1 : [String] = ["We have your results back, i will sed them as an attachmet. Hpw are you feeling? Still fatigued?","Dr. Anna Nicholas","Dr. Thomas Milton"]
    var docmessageArray2 : [String] = ["I’m better, less fatigued, but still coughing","Thak you, should we set up a meetig and talk it over?","Dr. Thomas Milton"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        headerLbl.text = "Chat"
        chatTV.delegate = self
        chatTV.dataSource = self
        chatTV.register(ChatMessageTVCell.self, forCellReuseIdentifier: ChatMessageTVCell.cellidentifier)
        setup()
    }
    
    func setup()
    {
        let margin = view.layoutMarginsGuide
        view.addSubview(scrollview)
        scrollview.addSubview(containerView)
        containerView.addSubview(DaytitleLbl)
        containerView.addSubview(chatTV)
        containerView.addSubview(MessageTextFieldView)
        MessageTextFieldView.addSubview(attachmentBtn)
        MessageTextFieldView.addSubview(MessageTF)
        containerView.addSubview(sendmsgBtn)
        
        
        
        
        NSLayoutConstraint.activate([
            
            scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollview.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 10 * appConstant.heightRatio),
            scrollview.bottomAnchor.constraint(equalTo: margin.bottomAnchor,constant: 0 * appConstant.heightRatio),
            scrollview.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
            containerView.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollview.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor,constant: 0 * appConstant.heightRatio),
       //     containerView.heightAnchor.constraint(equalToConstant: 650 * appConstant.heightRatio),
            containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
            
        
            DaytitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
            DaytitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 170 * appConstant.heightRatio),
            DaytitleLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -170 * appConstant.heightRatio),
            DaytitleLbl.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
            
            
            chatTV.topAnchor.constraint(equalTo: DaytitleLbl.bottomAnchor, constant: 30 * appConstant.heightRatio),
            chatTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
            chatTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
            chatTV.heightAnchor.constraint(equalToConstant: 200 * appConstant.heightRatio),
          //  chatTV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0 * appConstant.heightRatio),
            
            
            
            MessageTextFieldView.topAnchor.constraint(equalTo: chatTV.bottomAnchor, constant: 280 * appConstant.heightRatio),

        //    MessageTextFieldView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50 * appConstant.heightRatio),
            MessageTextFieldView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 21 * appConstant.widthRatio),
        //    MessageTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -21 * appConstant.widthRatio),
            MessageTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            MessageTextFieldView.widthAnchor.constraint(equalToConstant: 272 * appConstant.widthRatio),
            MessageTextFieldView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40 * appConstant.heightRatio),
            
            attachmentBtn.topAnchor.constraint(equalTo: MessageTextFieldView.topAnchor, constant: 15 * appConstant.heightRatio),
            attachmentBtn.leadingAnchor.constraint(equalTo: MessageTextFieldView.leadingAnchor, constant: 16 * appConstant.widthRatio),
            attachmentBtn.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
            attachmentBtn.widthAnchor.constraint(equalToConstant: 16 * appConstant.widthRatio),
            
            
            MessageTF.centerYAnchor.constraint(equalTo: attachmentBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
            MessageTF.leadingAnchor.constraint(equalTo: attachmentBtn.trailingAnchor, constant: 5 * appConstant.widthRatio),
            MessageTF.trailingAnchor.constraint(equalTo: MessageTextFieldView.trailingAnchor, constant: -5 * appConstant.widthRatio),
            MessageTF.heightAnchor.constraint(equalToConstant: 30 * appConstant.heightRatio),
            
            
            
            sendmsgBtn.centerYAnchor.constraint(equalTo: MessageTextFieldView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            sendmsgBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15 * appConstant.widthRatio),
            sendmsgBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            sendmsgBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.widthRatio),

        
        ])
        
    }
    
    
    @objc func popbtn_press(){
//       // sendmsgBtn.backgroundColor = .selectedBtn
//        sendmsgBtn.setTitleColor(.white, for: .normal)
//        let popoverVC =  AdddeasesPopupController()
//
//        popoverVC.preferredContentSize = CGSize(width: 220.0 * appConstant.heightRatio , height: 200 * appConstant.widthRatio)
//
//        popoverVC.modalPresentationStyle = .popover
//
//        popoverVC.popoverPresentationController?.permittedArrowDirections = .up
//
//
//        popoverVC.popoverPresentationController?.delegate = self
//
//        popoverVC.popoverPresentationController?.sourceView = sender
//
//        self.present(popoverVC, animated: true, completion: nil)
    }
    
   
    
    
}


extension ChatMessageController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docmessageArray1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTV.dequeueReusableCell(withIdentifier: ChatMessageTVCell.cellidentifier, for: indexPath) as! ChatMessageTVCell
        
      //  cell.docimg.image = docImages[indexPath.row]
   //     cell.docnameLbl.text = docnameArray[indexPath.row]
        cell.docdescLbl.text = docmessageArray1[indexPath.row]
        cell.clientdescLbl.text = docmessageArray2[indexPath.row]
    //    cell.docavailibiltyBtn.setTitle("20 Jan", for: .normal)
      //  cell.doctimeLbl.text = "12:40"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250 * appConstant.heightRatio
    }
    
}

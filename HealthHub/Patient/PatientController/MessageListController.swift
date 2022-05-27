//
//  MessageListController.swift
//  HealthHub
//
//  Created by OBS on 17/12/2021.

import UIKit
import InputBarAccessoryView
import PusherSwift
import IQKeyboardManager

class MessageListController: UIViewController {
  lazy var preBtn : CustomButton = {
    let btn = CustomButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.backgroundColor = .clear
    btn.layer.cornerRadius = 9 * appConstant.heightRatio
    btn.layer.shadowOpacity = 0.5
    btn.contentMode = .scaleToFill
   //  btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
    btn.clipsToBounds = true
   // btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
    return btn
  }()
  lazy var MymessagestitleLbl : UILabel = {
    let lbl = UILabel()
    lbl.clipsToBounds = true
    lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
    lbl.textAlignment = .center
    lbl.font = bold(size: 24)
    lbl.text = "My Messages"
    lbl.numberOfLines = 0
    lbl.adjustsFontSizeToFitWidth = true
    lbl.sizeToFit()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  lazy var messagebtn : UISegmentedControl = {
    let items = ["Notifications" , "Chat"]
    let segmentedControl = UISegmentedControl(items : items)
    segmentedControl.center = self.view.center
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.layer.cornerRadius = 12 * appConstant.heightRatio
    segmentedControl.backgroundColor = .white
    segmentedControl.tintColor = .black
    // Add function to handle Value Changed events
    segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    return segmentedControl
  }()
  lazy var segmentsView : UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var DataTableview : UITableView = {
    let tv = UITableView()
    tv.showsVerticalScrollIndicator = false
    tv.backgroundColor = UIColor(named: Colors.AppBGColor)
    tv.layer.cornerRadius = 18 * appConstant.heightRatio
    tv.clipsToBounds = true
    tv.separatorStyle = .none
    tv.separatorStyle = .none
    tv.isScrollEnabled = true
    tv.isUserInteractionEnabled = true
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  lazy var notificationTV : UITableView = {
    let tv = UITableView()
    tv.showsVerticalScrollIndicator = false
    tv.backgroundColor = UIColor(named: Colors.AppBGColor)
    tv.layer.cornerRadius = 18 * appConstant.heightRatio
    tv.clipsToBounds = true
    tv.separatorStyle = .none
    tv.separatorStyle = .none
    tv.isScrollEnabled = true
    tv.isUserInteractionEnabled = true
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  lazy var nullLbl : UILabel = {
    let lbl = UILabel()
    lbl.clipsToBounds = true
    lbl.textColor = UIColor.black
    lbl.textAlignment = .center
    lbl.font = semiBold(size: 15)
    lbl.text = "No Message Right Now"
    lbl.numberOfLines = 0
    lbl.adjustsFontSizeToFitWidth = true
    lbl.sizeToFit()
    lbl.isHidden = false
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  var NotifyList = [GetNotificationData]()
  var getAppointmnetList = appointdata()
  var isFromNotification = false
  var appointment = appointdata()
  var pusher: Pusher!
//  var docImages : [UIImage] = [ imageLiteral(resourceName: "Doc1")]
  var docnameArray : [String] = []
  let manager = InboxManager()
  var docnamearrayofdatatv : [String] = []
  var inboxArray = [ChatListData]()
  override func viewDidLoad() {
    super.viewDidLoad()
  //  headerView.isHidden = true
    view.backgroundColor = UIColor(named: Colors.AppBGColor)
    notificationTV.delegate = self
    notificationTV.dataSource = self
    notificationTV.register(NotificationTVCell.self, forCellReuseIdentifier: NotificationTVCell.cellidentifier)
    setupcre()
    DataTableview.delegate = self
    DataTableview.dataSource = self
    DataTableview.register(NotificationTVCell.self, forCellReuseIdentifier: NotificationTVCell.cellidentifier)
    Notificationsetup()
    pusherSetting()
    getnotification()
    getinboxList2()
    self.notificationTV.reloadData()
  }
  func setupcre()
  {
    let margin = view.layoutMarginsGuide
    view.addSubview(preBtn)
    view.addSubview(MymessagestitleLbl)
    view.addSubview(messagebtn)
   // view.addSubview(segmentsView)
   // view.addSubview(notificationTV)
    NSLayoutConstraint.activate([
      preBtn.topAnchor.constraint(equalTo: margin.topAnchor, constant: 12 * appConstant.heightRatio),
      preBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
      preBtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
      preBtn.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
      MymessagestitleLbl.centerYAnchor.constraint(equalTo: preBtn.centerYAnchor, constant: 0 * appConstant.heightRatio),
      MymessagestitleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0 * appConstant.widthRatio),
      MymessagestitleLbl.heightAnchor.constraint(equalToConstant: 28 * appConstant.heightRatio),
      messagebtn.topAnchor.constraint(equalTo: preBtn.bottomAnchor, constant: 12 * appConstant.heightRatio),
      messagebtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
      messagebtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
      messagebtn.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
//      notificationTV.topAnchor.constraint(equalTo: messagebtn.bottomAnchor, constant: 20 * appConstant.heightRatio),
//      notificationTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 * appConstant.widthRatio),
//      notificationTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20 * appConstant.widthRatio),
//
//      notificationTV.heightAnchor.constraint(equalToConstant: 350 * appConstant.heightRatio),
    ])
  }
  @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
      print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
      switch sender.selectedSegmentIndex {
        case 1:
         //  self.view.backgroundColor = UIColor.green
        Messagesetup()
          print("Green")
        case 2:
          self.view.backgroundColor = UIColor.blue
          print("Blue")
        default:
          // self.view.backgroundColor = UIColor.purple
        Notificationsetup()
          print("Purple")
        }
    }
  func Notificationsetup()
  {
    view.addSubview(notificationTV)
    notificationTV.addSubview(nullLbl)
    nullLbl.text = "No Notification Right Now"
    NSLayoutConstraint.activate([
      notificationTV.topAnchor.constraint(equalTo: self.messagebtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
      notificationTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10 * appConstant.widthRatio),
      notificationTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10 * appConstant.widthRatio),
      notificationTV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.widthRatio),
      nullLbl.centerXAnchor.constraint(equalTo: notificationTV.centerXAnchor),
      nullLbl.centerYAnchor.constraint(equalTo: notificationTV.centerYAnchor),
    ])
      getnotification()
  }
  func Messagesetup()
  {
    view.addSubview(DataTableview)
    DataTableview.addSubview(nullLbl)
    nullLbl.text = "No Message Right Now"
    NSLayoutConstraint.activate([
      DataTableview.topAnchor.constraint(equalTo: self.messagebtn.bottomAnchor, constant: 10 * appConstant.heightRatio),
      DataTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10 * appConstant.widthRatio),
      DataTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10 * appConstant.widthRatio),
      DataTableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50 * appConstant.widthRatio),
      nullLbl.centerXAnchor.constraint(equalTo: DataTableview.centerXAnchor),
      nullLbl.centerYAnchor.constraint(equalTo: DataTableview.centerYAnchor),
    ])
    getinboxList()
      getinboxList2()
  }
  func getinboxList(){
    ActivityIndicator.shared.showSpinner(onView: self.view)
    manager.getChatList { chatList, msg, hasError in
      ActivityIndicator.shared.removeSpinner()
      if hasError{
        print(msg)
      }else{
        guard let list = chatList?.contacts else {return}
        if list.count == 0{
          self.nullLbl.isHidden = false
        }else{
          self.nullLbl.isHidden = true
        }
        self.inboxArray = list
        self.DataTableview.reloadData()
      }
    }
  }
    
    func getinboxList2(){
//      ActivityIndicator.shared.showSpinner(onView: self.view)
      manager.getChatList { chatList, msg, hasError in
//        ActivityIndicator.shared.removeSpinner()
        if hasError{
          print(msg)
        }else{
          guard let list = chatList?.contacts else {return}
          if list.count == 0{
            self.nullLbl.isHidden = false
          }else{
            self.nullLbl.isHidden = true
          }
          self.inboxArray = list
          self.DataTableview.reloadData()
        }
      }
    }
    
    func getnotification(){
//      ActivityIndicator.shared.showSpinner(onView: self.view)
      manager.getnotification { notiList, msg, hasError in
//        ActivityIndicator.shared.removeSpinner()
        if hasError{
          print(msg)
        }else{
            guard let list = notiList?.data else {return}
          if list.count == 0{
            self.nullLbl.isHidden = false
          }else{
            self.nullLbl.isHidden = true
          }
            self.NotifyList = list
          self.notificationTV.reloadData()
        }
      }
    }
    
}
extension MessageListController : UITableViewDelegate, UITableViewDataSource
{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == notificationTV
    {
        return NotifyList.count ?? 0
    }
    else
    {
      return inboxArray.count
    // return docnamearrayofdatatv.count
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == notificationTV
    {
    let cell = notificationTV.dequeueReusableCell(withIdentifier: NotificationTVCell.cellidentifier, for: indexPath) as! NotificationTVCell
 //   cell.docimg.image = docImages[indexPath.row]
        let chat = NotifyList[indexPath.row]
        cell.docnameLbl.text = chat.title ?? ""
        
        cell.docdescLbl.text = chat.body ?? ""
    cell.docavailibiltyBtn.setTitle("20 Jan", for: .normal)
        cell.circleView.isHidden = true
    // cell.docfeeLbl.text = "$70"
    cell.docimg.image = UIImage(named: "DR")
    return cell
    }
    else
    {
    let cell = DataTableview.dequeueReusableCell(withIdentifier: NotificationTVCell.cellidentifier, for: indexPath) as! NotificationTVCell
      let chat = inboxArray[indexPath.row]
      cell.docnameLbl.text = chat.name ?? ""
        cell.docdescLbl.text = chat.lastMsg?.lastMsg ?? ""
        
            let formatter = DateFormatter()
            formatter.dateFormat = "E : hh:mm a"
            formatter.dateStyle = .medium
        
        let dateString = formatter.string(from: formatter.date(from: chat.created_at ?? "") ?? Date())
//        let dd = NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption2)])
        cell.docavailibiltyBtn.setTitle(dateString , for: .normal)
      cell.docavailibiltyBtn.isHidden = false
        
        if chat.lastMsg?.Seen == 0
        {
            cell.circleView.backgroundColor = UIColor(named: Colors.ButtonBG)
        }
        else
        {
            cell.circleView.backgroundColor = .clear
        }
        
    if chat.url == nil || chat.url == ""
    {
    cell.docimg.image = UIImage(named: "Profile_img")
    }
    else
    {
      let base = URLConstants.BASE_File//"http://certiflyapi.massolabs.com/Doctor.uk/public/"
      let url = URL(string: base + (chat.url ?? ""))
      cell.docimg.kf.setImage(with: url)
        }
    // cell.docfeeLbl.text = "$70"
    return cell
    }
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      if tableView == DataTableview
      {
      let vc = MessgeViewController()
      let chat = inboxArray[indexPath.row]
      vc.title = chat.name ?? ""
      vc.userID = chat.id ?? 0
      vc.username = chat.name ?? ""
      vc.navigationController?.navigationBar.prefersLargeTitles = true
//    self.navigationController?.pushViewController(vc, animated: true)
    self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
      }
      else
      {
          print("Nothing")
      }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if tableView == notificationTV
    {
    return 114 * appConstant.heightRatio
    }
    else
    {
    return 114 * appConstant.heightRatio
    }
  }
}



extension MessageListController: PusherDelegate{
  func pusherSetting(){
//    let options = PusherClientOptions(authMethod:
//                        .endpoint(authEndpoint:"http://192.168.18.56:8000"),attemptToReturnJSONObject: true, autoReconnect: true, host: .cluster("us2"), activityTimeout: 10)
//    let options = PusherClientOptions(
//      authMethod: .endpoint(authEndpoint: "/chatify/api/chat/auth"),
//        host: .cluster("us2"),
//        path: "http://192.168.18.56:8000"
//       )
    let options = PusherClientOptions(
      authMethod: AuthMethod.authRequestBuilder(authRequestBuilder: AuthRequestBuilder()),
      host: .cluster("us2")
    )
       pusher = Pusher(
        key: "eaadcab1651278656dda",
        options: options
       )
//  http://192.168.18.56:8000/chatify/api/chat/auth
    pusher.delegate = self
    let channel = pusher.subscribe("private-chatify")
//    let channel2 = pusher.subscribe("presence-activeStatus")
    let _ = channel.bind(eventName: "messaging", eventCallback: { (data: Any?) -> Void in
      self.getinboxList2()
    })
    let _ = channel.bind(eventName: "client-typing", eventCallback: { (data: Any?) -> Void in
      print("Client typing")
    })
    let _ = channel.bind(eventName: "client-seen", eventCallback: { (data: Any?) -> Void in
      print("Client seen")
    })
    let _ = channel.bind(eventName: "client-contactItem", eventCallback: { (data: Any?) -> Void in
      print("client-contactItem")
    })
    pusher.connect()
  }
  func receivedError(error: PusherError) {
    print("Puser Error",error)
  }
  func debugLog(message: String) {
     print(message)
  }
}

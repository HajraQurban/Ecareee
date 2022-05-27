//
//  MessgeViewController.swift
//  ChatbotTestApp
//
//  Created by OBS on 02/03/2022.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import PusherSwift
import IQKeyboardManager


struct Member {
  let name: String
//  let image: UIImage
}


struct sender: SenderType{
  var senderId: String
  var displayName: String
}
struct Message : MessageType{
  var sender: SenderType
  var messageId: String
  var sentDate: Date
  var kind: MessageKind
}
class MessgeViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
  let currentUser = Sender(senderId: "5", displayName: "OBS Technolgia")
  let otherUser = Sender(senderId: "1", displayName: "Ahmer Shahzad")
  var pusher: Pusher!
  var messages = [Message]()
  var manager = InboxManager()
  var userID = Int()
  var chatID = Int()
  var username = ""
  var chatList = [UserChatData]()
    
  
    
    var section = 0
    
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = false
    self.tabBarController?.navigationController?.navigationBar.isHidden = false
//    self.inputToolbar?.contentView.rightBarButtonItem?.setImage(UIImage(named: "send"), for: .normal)
    view.backgroundColor = .white
//    messages.append(Message(sender: otherUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-26100), kind: .text("Hey there thanks for checking out DoctorUK!")))
//    messages.append(Message(sender: otherUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-26120), kind: .text("How can I assist you today?")))
    messagesCollectionView.messagesDataSource = self
    messagesCollectionView.messagesLayoutDelegate = self
    messagesCollectionView.messagesDisplayDelegate = self
    messageInputBar.delegate = self
    pusherSetting()
    getChatHistory()
    make_seen()
      
      scrollsToLastItemOnKeyboardBeginsEditing = true // default false
      maintainPositionOnKeyboardFrameChanged = true // default false
      
//    self.messagesCollectionView.scrollToLastItem()
//      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
 
//    @objc func keyboardWillShow(sender: NSNotification) {
//        self.view.frame.origin.y -= 150
//    }
//    @objc func keyboardWillHide(sender: NSNotification) {
//        self.view.frame.origin.y += 150
//    }
//
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 200, width:self.view.frame.size.width, height:self.view.frame.size.height);

        })
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y + 200, width:self.view.frame.size.width, height:self.view.frame.size.height);

        })
    }

    
    
  func currentSender() -> SenderType {
    return currentUser
  }
  func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
    return messages[indexPath.section]
  }
  func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
      section = messages.count
      return messages.count
  }
        
  func getChatHistory(){
//    ActivityIndicator.shared.showSpinner(onView: self.view)
    manager.getChat(id: userID) { userChat, msg, hasError in
//    ActivityIndicator.shared.removeSpinner()
      if hasError{
      }else{
        guard let chat = userChat?.messagelist else {return}
        self.chatList = chat
        self.chatList.reverse()
        self.messagesCollectionView.reloadData()
        self.messages.removeAll()
        for msg in self.chatList{
          if msg.to_id == self.userID{
            let dateFormteer = DateFormatter()
            dateFormteer.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormteer.date(from: msg.created_at!)
              self.messages.append(Message(sender:self.currentUser, messageId: "\(msg.id ?? 0)", sentDate: date ?? Date().addingTimeInterval(-1), kind: .text(msg.body ?? "")))
          }else{
            let dateFormteer = DateFormatter()
            dateFormteer.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormteer.date(from: msg.created_at ?? "" )
              self.messages.append(Message(sender:self.otherUser, messageId: "\(msg.id ?? 0)", sentDate: date ?? Date().addingTimeInterval(-1), kind: .text(msg.body ?? "")))
          }
//          print("history",self.messages)
        }
        self.messagesCollectionView.reloadData()
        self.messagesCollectionView.scrollToLastItem()
          
      }
    }
  }
    
    //This function shows the avatar
      func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
      //If it's current user show current user photo.
//          let str = String(userID)
          if chatID == userID {
          avatarView.image = UIImage(named: "NA1")
          }
          else
          {
              avatarView.image = UIImage(named: "NA2")
          }
      }
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        if  indexPath.section == 0{
            return 0
        }
        
        if self.messages[indexPath.section].sentDate != self.messages[indexPath.section - 1].sentDate {
            return 0
        }
        return 2
       
    }
    
    func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 16
    }
    
    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        
        if  indexPath.section == 0{
            let dateString = formatter.string(from: message.sentDate)
            return NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption2)])
        }
        
//        if self.messages[indexPath.section].sentDate != self.messages[indexPath.section - 1].sentDate {
//            let dateString = formatter.string(from: message.sentDate)
//            return NSAttributedString(string: dateString, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption2)])
//        }
//
        return nil
    }
    
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
       
        
//        if indexPath.section % 3 == 0 {
            return NSAttributedString(string: MessageKitDateFormatter.shared.string(from: message.sentDate), attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
//        }
        
        return nil
    }
    
    
    
    
    
    
}
extension MessgeViewController: InputBarAccessoryViewDelegate {
//  @objc
//  func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
//
//    if text.contains("Hello") || text.contains("hello")
//    {
//
//      messages.append(Message(sender: currentUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86500), kind: .text(text)))
//      messages.append(Message(sender: otherUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86600), kind: .text("How are you?")))
//      self.messagesCollectionView.scrollToLastItem(animated: true)
//      messagesCollectionView.reloadData()
//      inputBar.inputTextView.text = ""
//    }
//    else if text.contains("fine") || text.contains("ok") || text.contains("good")
//    {
//    messages.append(Message(sender: currentUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86500), kind: .text(text)))
//    messages.append(Message(sender: otherUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86500), kind: .text("How may i help you?")))
//    self.messagesCollectionView.scrollToLastItem(animated: true)
//    messagesCollectionView.reloadData()
//    inputBar.inputTextView.text = ""
//    }
//    else if text.contains("Doctor") || text.contains("doctor")
//    {
//    messages.append(Message(sender: currentUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86500), kind: .text(text)))
//    messages.append(Message(sender: otherUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86500), kind: .text("Consult The DoctorUk App and Consult The Doctor Through Appointment")))
//    self.messagesCollectionView.scrollToLastItem(animated: true)
//    messagesCollectionView.reloadData()
//    inputBar.inputTextView.text = ""
//    }
//    else
//    {
//    messages.append(Message(sender: currentUser, messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-86400), kind: .text(text)))
//    self.messagesCollectionView.scrollToLastItem(animated: true)
//    messagesCollectionView.reloadData()
//    inputBar.inputTextView.text = ""
//    }
//  }
    
    
  func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
      
      
    if text != ""{
        
      sendMsg_Api(text,inputBar)
        self.messagesCollectionView.scrollToLastItem()
        inputBar.inputTextView.text = ""
    }else{
    }
  }
  func sendMsg_Api(_ message: String,_ inputBar: InputBarAccessoryView ){
    inputBar.sendButton.isUserInteractionEnabled = false
//    ActivityIndicator.shared.showSpinner(onView: self.view)
    manager.sendMsg(id: self.userID, msg: message, complition: { msgList, msg, hasError in
//      ActivityIndicator.shared.removeSpinner()
      if hasError{
        inputBar.sendButton.isUserInteractionEnabled = true
        print(msg)
      }else{
          self.update_contacts()
        inputBar.sendButton.isUserInteractionEnabled = true
        inputBar.inputTextView.text = nil
        self.view.endEditing(true)
        self.messagesCollectionView.scrollToLastItem()
        self.messagesCollectionView.contentInset.bottom = self.additionalBottomInset
//        scrollToBottom(animated:true)
//        messagesCollectionView.contentInset.bottom = bottomInset
//        self.messages.append(Message(sender:self.otherUser, messageId: "\(msg.id ?? 0)", sentDate: date ?? Date().addingTimeInterval(-1), kind: .text(msg.body ?? "")))
        self.getChatHistory()
      }
    })
//      (senderId: User.current?.id ?? "", receiverId: ChatController.adminId ?? "0", type: "Customer", message: message) { hasError, msg, chat in
//      self.view.endEditing(true)
//      Progress.shared.removeActivity(myView: self.view)
//      if hasError{
//
//      }else{
//
//
//      }
//    }
  }
    
    func update_contacts(){
//      ActivityIndicator.shared.showSpinner(onView: self.view)
      manager.updatecontacts(id: self.userID, complition: {msg, hasError in
//        ActivityIndicator.shared.removeSpinner()
        if hasError{
          print(msg)
        }else{
          self.view.endEditing(true)
          self.messagesCollectionView.scrollToLastItem()
  //        self.messages.append(Message(sender:self.otherUser, messageId: "\(msg.id ?? 0)", sentDate: date ?? Date().addingTimeInterval(-1), kind: .text(msg.body ?? "")))
          self.getChatHistory()
        }
      })
    }
    
    func make_seen(){
//      ActivityIndicator.shared.showSpinner(onView: self.view)
        manager.makeseen(id: self.userID , complition: {msg, hasError in
//        ActivityIndicator.shared.removeSpinner()
        if hasError{
          print(msg)
        }else{
          self.view.endEditing(true)
          self.messagesCollectionView.scrollToLastItem()
  //        self.messages.append(Message(sender:self.otherUser, messageId: "\(msg.id ?? 0)", sentDate: date ?? Date().addingTimeInterval(-1), kind: .text(msg.body ?? "")))
          self.getChatHistory()
        }
      })
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        let lastItemIndex = self.messagesCollectionView.numberOfItems(inSection: section) - 1
        let indexPath:NSIndexPath = NSIndexPath.init(item: lastItemIndex, section: section)
        self.messagesCollectionView.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.top, animated: true)
    }
    
    
//    @objc  func handleTextViewDidBeginEditing(_ notification: Notification) {
//        let item = self.collectionView(self.messagesCollectionView, numberOfItemsInSection: 0) - 1
//        let lastItemIndex = IndexPath(item: item, section: 0)
//        print(lastItemIndex)
//
//
//        messagesCollectionView.scrollToItem(at: lastItemIndex, at: UICollectionView.ScrollPosition.top, animated: true)
////        if scrollsToLastItemOnKeyboardBeginsEditing || scrollsToLastItemOnKeyboardBeginsEditing {
////            guard
////                let inputTextView = notification.object as? InputTextView,
////                inputTextView === messageInputBar.inputTextView
////            else {
////                return
////            }
////            if scrollsToLastItemOnKeyboardBeginsEditing {
////                messagesCollectionView.scrollToLastItem()
////            } else {
////                messagesCollectionView.scrollToLastItem(animated: true)
////            }
////        }
//    }
    
    
}
extension MessgeViewController: PusherDelegate{
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
      self.getChatHistory()
    })
    let _ = channel.bind(eventName: "client-typing", eventCallback: { (data: Any?) -> Void in
      print("Client typing")
    })
    let _ = channel.bind(eventName: "client-seen", eventCallback: { (data: Any?) -> Void in
      print("Client seen")
        self.make_seen()
    })
    let _ = channel.bind(eventName: "client-contactItem", eventCallback: { (data: Any?) -> Void in
      print("client-contactItem")
        self.update_contacts()
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
class AuthRequestBuilder: AuthRequestBuilderProtocol {
  func requestFor(socketID: String, channelName: String) -> URLRequest? {
    var request = URLRequest(url: URL(string: "https://certiflyapi.massolabs.com/doctoruk/chatify/api/chat/auth")!)
    request.httpMethod = "POST"
    request.httpBody = "socket_id=\(socketID)&channel_name=private-chatify".data(using: String.Encoding.utf8)
    request.addValue("Bearer \(AppUserDefault.shared.accessToken ?? "")", forHTTPHeaderField: "Authorization")
    return request
  }
    
    
    
   
    
}





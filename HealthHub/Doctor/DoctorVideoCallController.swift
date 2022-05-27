//
//  DoctorVideoCallController.swift
//  HealthHub
//
//  Created by OBS on 14/02/2022.
//

import UIKit
import TwilioVideo
import SwiftySound
import AVFoundation

class DoctorVideoCallController: UIViewController {

    lazy var reciverImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "doctorDummycall")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = true
        return iv
    }()
    
    lazy var backView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)!.cgColor
        //        view.layer.shadowRadius = 40 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.clipsToBounds = false
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowRadius = 0
        btn.setImage(UIImage(named: "backbarIcon"), for: .normal)
        btn.tintColor = UIColor.black
        btn.addTarget(self, action: #selector(backbtn_press), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    lazy var flipCamraView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 4 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.shadowRadius = 2 * appConstant.heightRatio
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var flipCamraBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.borderColor =  UIColor.clear.cgColor
        btn.layer.shadowRadius = 0
        btn.setImage(UIImage(named: "flipIcon"), for: .normal)
        btn.tintColor = UIColor.black
        btn.addTarget(self, action: #selector(flipCamera), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var voliumeView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 4 * appConstant.heightRatio
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.shadowRadius = 2 * appConstant.heightRatio
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var voliumeBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.layer.shadowRadius = 0
        btn.setImage(UIImage(named: "voliumicon"), for: .normal)
        btn.tintColor = UIColor.black
        btn.addTarget(self, action: #selector(volumebtn_press), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var ownVideoView : VideoView = {
        let view = VideoView()
        view.backgroundColor = .white
        view.layer.cornerRadius  = 18 * appConstant.heightRatio
        view.layer.shadowColor = UIColor(named: Colors.ShadowColor)!.cgColor
        view.layer.shadowRadius = 40 * appConstant.heightRatio
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 16)
        view.clipsToBounds = false
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ownImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "doctorDummycall")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isHidden = true
        return iv
    }()
    
    lazy var nameLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 24)
        lbl.text = "Dr. Hamza"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var endCallBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.setImage(UIImage(systemName: "phone.circle.fill"), for: .normal)
        btn.imageView?.tintColor = .white
        btn.addTarget(self, action: #selector(disconnect(sender:)), for: .touchUpInside)
        btn.layer.cornerRadius = 32 * appConstant.heightRatio
        return btn
    }()
    
    lazy var muteBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.shadowRadius = 0.25
        btn.tintColor = UIColor.black
        btn.setImage(UIImage(systemName: "mic"), for: .normal)
        btn.addTarget(self, action: #selector(toggleMic), for: .touchUpInside)
        return btn
    }()
    
    lazy var videoOffBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 4 * appConstant.heightRatio
        btn.layer.shadowRadius = 0.25
        btn.setImage(UIImage(systemName: "video"), for: .normal)
        btn.imageView?.tintColor = .black
        btn.sizeToFit()
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(toggleVideo), for: .touchUpInside)
        return btn
    }()
    
    deinit {
        // We are done with camera
        if let camera = self.camera {
            camera.stopCapture()
            self.camera = nil
        }
    }
    
    var accessToken : String?
    var room: Room?
    var camera: CameraSource?
    var localVideoTrack: LocalVideoTrack?
    var localAudioTrack: LocalAudioTrack?
    var remoteParticipant: RemoteParticipant?
    var remoteView: VideoView?
    var room_name : String?
    
    
    //
    var appointment  = appointdata()
    var startSound : Sound?
    var waitingSound : Sound?
    var disconnectSound : Sound?
    var pickupSound : Sound?
    
    let audioQueue = DispatchQueue(label: "audio")
   
    var isSpeacker = true
    
    //
    let BackendController = BackendClass.sharedInstance
    let manager = NotificationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        self.nameLbl.adjustsFontSizeToFitWidth = true;
        self.nameLbl.minimumScaleFactor = 0.75;
        self.nameLbl.text = appointment.roomName ?? ""
        
        if PlatformUtils.isSimulator {
            self.ownVideoView.removeFromSuperview()
        } else {
            // Preview our local camera track in the local video preview view.
            self.startPreview()
        }
        sendNotification()
        connect()
        setup()
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        view.addSubview(reciverImage)
        view.addSubview(backView)
        backView.addSubview(backBtn)
        view.addSubview(voliumeView)
        voliumeView.addSubview(voliumeBtn)
        view.addSubview(ownVideoView)
        ownVideoView.addSubview(ownImage)
        view.addSubview(endCallBtn)
        view.addSubview(muteBtn)
        view.addSubview(videoOffBtn)
        view.addSubview(nameLbl)
        view.addSubview(flipCamraView)
        flipCamraView.addSubview(flipCamraBtn)
        
        
        NSLayoutConstraint.activate([
            reciverImage.topAnchor.constraint(equalTo: view.topAnchor),
            reciverImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            reciverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            reciverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backView.leadingAnchor.constraint(equalTo: reciverImage.leadingAnchor,constant: 20 * appConstant.widthRatio),
            backView.topAnchor.constraint(equalTo: margin.topAnchor,constant: 24 * appConstant.heightRatio),
            backView.widthAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            backView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            backBtn.topAnchor.constraint(equalTo: backView.topAnchor),
            backBtn.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            backBtn.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            backBtn.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            
            voliumeView.trailingAnchor.constraint(equalTo: reciverImage.trailingAnchor,constant: -20 * appConstant.widthRatio),
            voliumeView.centerYAnchor.constraint(equalTo: backView.centerYAnchor,constant: 0 * appConstant.heightRatio),
            voliumeView.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            voliumeView.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            voliumeBtn.topAnchor.constraint(equalTo: voliumeView.topAnchor),
            voliumeBtn.bottomAnchor.constraint(equalTo: voliumeView.bottomAnchor),
            voliumeBtn.leadingAnchor.constraint(equalTo: voliumeView.leadingAnchor),
            voliumeBtn.trailingAnchor.constraint(equalTo: voliumeView.trailingAnchor),
            
            flipCamraView.centerXAnchor.constraint(equalTo: voliumeView.centerXAnchor,constant: 0 * appConstant.widthRatio),
            flipCamraView.topAnchor.constraint(equalTo: voliumeView.bottomAnchor,constant: 8 * appConstant.heightRatio),
            flipCamraView.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            flipCamraView.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            flipCamraBtn.topAnchor.constraint(equalTo: flipCamraView.topAnchor),
            flipCamraBtn.bottomAnchor.constraint(equalTo: flipCamraView.bottomAnchor),
            flipCamraBtn.leadingAnchor.constraint(equalTo: flipCamraView.leadingAnchor),
            flipCamraBtn.trailingAnchor.constraint(equalTo: flipCamraView.trailingAnchor),
            
            ownVideoView.leadingAnchor.constraint(equalTo: reciverImage.leadingAnchor,constant: 20 * appConstant.widthRatio),
            ownVideoView.topAnchor.constraint(equalTo: reciverImage.topAnchor,constant: 200 * appConstant.heightRatio),
            ownVideoView.widthAnchor.constraint(equalToConstant: 121 * appConstant.heightRatio),
            ownVideoView.heightAnchor.constraint(equalToConstant: 191 * appConstant.heightRatio),
            
            ownImage.topAnchor.constraint(equalTo: ownVideoView.topAnchor),
            ownImage.bottomAnchor.constraint(equalTo: ownVideoView.bottomAnchor),
            ownImage.leadingAnchor.constraint(equalTo: ownVideoView.leadingAnchor),
            ownImage.trailingAnchor.constraint(equalTo: ownVideoView.trailingAnchor),
            
            nameLbl.bottomAnchor.constraint(equalTo: endCallBtn.topAnchor,constant: -20 * appConstant.heightRatio),
            nameLbl.leadingAnchor.constraint(equalTo: reciverImage.leadingAnchor,constant: 50 * appConstant.widthRatio),
            nameLbl.trailingAnchor.constraint(equalTo: reciverImage.trailingAnchor,constant: -50 * appConstant.widthRatio),
            
//            endCallBtn.centerYAnchor.constraint(equalTo: muteBtn.centerYAnchor,constant: 0 * appConstant.widthRatio),
//            endCallBtn.leadingAnchor.constraint(equalTo: muteBtn.trailingAnchor,constant: 20 * appConstant.widthRatio),
            
            endCallBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 0 * appConstant.heightRatio),
            endCallBtn.bottomAnchor.constraint(equalTo: reciverImage.bottomAnchor,constant: -80 * appConstant.heightRatio),
            endCallBtn.widthAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            endCallBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
            
            muteBtn.centerXAnchor.constraint(equalTo: flipCamraView.centerXAnchor,constant: 0 * appConstant.widthRatio),
            muteBtn.topAnchor.constraint(equalTo: flipCamraView.bottomAnchor,constant: 8 * appConstant.widthRatio),
            muteBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            muteBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            
            videoOffBtn.centerXAnchor.constraint(equalTo: muteBtn.centerXAnchor,constant: 0 * appConstant.widthRatio),
            videoOffBtn.topAnchor.constraint(equalTo: muteBtn.bottomAnchor,constant: 8 * appConstant.widthRatio),

//            videoOffBtn.leadingAnchor.constraint(equalTo: endCallBtn.trailingAnchor,constant: 20 * appConstant.widthRatio),
//            videoOffBtn.trailingAnchor.constraint(equalTo: ownVideoView.leadingAnchor, constant: -0),
            videoOffBtn.widthAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
            videoOffBtn.heightAnchor.constraint(equalToConstant: 36 * appConstant.heightRatio),
        ])
    }
    
    func sendNotification(){
        let params : [String:Any] = ["user_id":appointment.patient?.id ?? 0,"user_type":"patient","appointment_id":appointment.id ?? 0]
        manager.sendNotification(params: params) { msg, hasError in
            
        }
    }
    
    @objc func backbtn_press(){
        self.dismiss(animated: true)
    }
    
    @objc func disconnect(sender: AnyObject) {
        if room != nil{
            
            DispatchQueue.main.async
            {
                self.logMessage(messageText: "disconnecting....")
                self.room!.disconnect()
                self.stopWaitSound()
                self.endCallApi()
                let vc = DoctorEndCallController()
                vc.appointment = self.appointment
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }else{
            logMessage(messageText: "End Call...")
            self.endCallApi()
            let vc = DoctorEndCallController()
            vc.appointment = self.appointment
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        
//        UserDefaults.standard.set(false, forKey: "callOn")
//        WarningVC.OrderID = VideoCallVC.OrderId
//        WarningVC.requestingVC = "video"
//        self.performSegue(withIdentifier: "warning", sender: nil)
        
    }
    
    @objc func toggleMic() {
        if (self.localAudioTrack != nil) {
            self.localAudioTrack?.isEnabled = !(self.localAudioTrack?.isEnabled)!
            
            // Update the button title
            if (self.localAudioTrack?.isEnabled == true) {
//                self.micButton.setTitle("Mute", for: .normal)
                self.muteBtn.setImage(UIImage(systemName: "mic"), for: .normal)
            
            } else {
             //   self.micButton.setTitle("Unmute", for: .normal)
                self.muteBtn.setImage(UIImage(systemName: "mic.slash"), for: .normal)
            }
        }
    }
    
    @objc func toggleVideo(){
       if (self.localVideoTrack != nil){
            self.localVideoTrack?.isEnabled = !(self.localVideoTrack?.isEnabled)!
           
           if (self.localVideoTrack?.isEnabled == true) {
              // self.micButton.setTitle("Mute", for: .normal)
               self.videoOffBtn.setImage(UIImage(systemName: "video"), for: .normal)
           
           } else {
            //   self.micButton.setTitle("Unmute", for: .normal)
               self.videoOffBtn.setImage(UIImage(systemName: "video.slash"), for: .normal)
           }
        }
    }
    
    @objc func volumebtn_press(){
        // Get the audioDevice in use by the SDK
        if isSpeacker {
                DefaultAudioDevice.DefaultAVAudioSessionConfigurationBlock()
                let error1: Error? = nil
                do {
                    voliumeBtn.setImage(UIImage(named: "voliumlow"), for: .normal)
                    try AVAudioSession.sharedInstance().setMode(.voiceChat)
                } catch {
                    if let error = error1 {
                        print("AVAudioSession setMode:error: \(error)")
                    }
                }
            isSpeacker = false
        } else {
            voliumeBtn.setImage(UIImage(named: "voliumicon"), for: .normal)
                DefaultAudioDevice.DefaultAVAudioSessionConfigurationBlock()
            isSpeacker = true
        }
    }
    
    func setSpeaker(enabled:Bool) throws {
        if self.localAudioTrack != nil {
            if (enabled) {
                try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.speaker);
            } else {
                try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSession.PortOverride.none);
            }
        }
    }
    
    
    @objc func connect() {
       
        // Configure access token either from server or manually.fd
        // If the default wasn't changed, try fetching from server.
        if (accessToken == "" || accessToken == nil) {
            do {
               
            } catch {
                let message = "Failed to fetch access token"
                
                return
            }
        }
        
        // Prepare local media which we will share with Room Participants.
        self.prepareLocalMedia()
        
        // Preparing the connect options with the access token that we fetched (or hardcoded).
        let connectOptions = ConnectOptions(token: accessToken ?? "") { (builder) in
            
            // Use the local media that we prepared earlier.
            builder.audioTracks = self.localAudioTrack != nil ? [self.localAudioTrack!] : [LocalAudioTrack]()
            builder.videoTracks = self.localVideoTrack != nil ? [self.localVideoTrack!] : [LocalVideoTrack]()

            // Use the preferred audio codec
            if let preferredAudioCodec = Settings.shared.audioCodec {
                builder.preferredAudioCodecs = [preferredAudioCodec]
            }

            // Use the preferred video codec
            if let preferredVideoCodec = Settings.shared.videoCodec {
                builder.preferredVideoCodecs = [preferredVideoCodec]
            }

            // Use the preferred encoding parameters
            if let encodingParameters = Settings.shared.getEncodingParameters() {
                builder.encodingParameters = encodingParameters
            }

            // Use the preferred signaling region
            if let signalingRegion = Settings.shared.signalingRegion {
                builder.region = signalingRegion
            }
            
            // The name of the Room where the Client will attempt to connect to. Please note that if you pass an empty
            // Room `name`, the Client will create one for you. You can get the name or sid from any connected Room.
            builder.roomName = self.room_name
            
        }
        
        // Connect to the Room using the options we provided.
        room = TwilioVideoSDK.connect(options: connectOptions, delegate: self)
       
    }
    
    func startPreview() {
        if PlatformUtils.isSimulator {
            return
        }

        let frontCamera = CameraSource.captureDevice(position: .front)
        let backCamera = CameraSource.captureDevice(position: .back)

        if (frontCamera != nil || backCamera != nil) {

            let options = CameraSourceOptions { (builder) in
                // To support building with Xcode 10.x.
                #if XCODE_1100
                if #available(iOS 13.0, *) {
                    // Track UIWindowScene events for the key window's scene.
                    // The example app disables multi-window support in the .plist (see UIApplicationSceneManifestKey).
                    builder.orientationTracker = UserInterfaceTracker(scene: UIApplication.shared.keyWindow!.windowScene!)
                }
                #endif
            }
            // Preview our local camera track in the local video preview view.
            camera = CameraSource(options: options, delegate: self)
            localVideoTrack = LocalVideoTrack(source: camera!, enabled: true, name: "Camera")

            // Add renderer to video track for local preview
            localVideoTrack!.addRenderer(self.ownVideoView as! VideoRenderer)
           

            if (frontCamera != nil && backCamera != nil) {
                // We will flip camera on tap.
                let tap = UITapGestureRecognizer(target: self, action: #selector(VideoCallController.flipCamera))
                self.ownVideoView.addGestureRecognizer(tap)
            }

            camera!.startCapture(device: frontCamera != nil ? frontCamera! : backCamera!) { (captureDevice, videoFormat, error) in
                if let error = error {
          
                } else {
                    self.ownVideoView.shouldMirror = (captureDevice.position == .front)
                }
            }
        }
        else {
            self.logMessage(messageText:"No front or back capture device found!")
        }
    }
    
    func setupRemoteVideoView() {
        // Creating `VideoView` programmatically
        self.remoteView = VideoView(frame: CGRect.zero, delegate: self)

        self.view.insertSubview(self.remoteView!, at: 0)
        
        // `VideoView` supports scaleToFill, scaleAspectFill and scaleAspectFit
        // scaleAspectFit is the default mode when you create `VideoView` programmatically.
        self.remoteView!.contentMode = .scaleAspectFill;

        let centerX = NSLayoutConstraint(item: self.remoteView!,
                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self.view,
                                         attribute: NSLayoutConstraint.Attribute.centerX,
                                         multiplier: 1,
                                         constant: 0);
        self.view.addConstraint(centerX)
        let centerY = NSLayoutConstraint(item: self.remoteView!,
                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self.view,
                                         attribute: NSLayoutConstraint.Attribute.centerY,
                                         multiplier: 1,
                                         constant: 0);
        self.view.addConstraint(centerY)
        let width = NSLayoutConstraint(item: self.remoteView!,
                                       attribute: NSLayoutConstraint.Attribute.width,
                                       relatedBy: NSLayoutConstraint.Relation.equal,
                                       toItem: self.view,
                                       attribute: NSLayoutConstraint.Attribute.width,
                                       multiplier: 1,
                                       constant: 0);
        self.view.addConstraint(width)
        let height = NSLayoutConstraint(item: self.remoteView!,
                                        attribute: NSLayoutConstraint.Attribute.height,
                                        relatedBy: NSLayoutConstraint.Relation.equal,
                                        toItem: self.view,
                                        attribute: NSLayoutConstraint.Attribute.height,
                                        multiplier: 1,
                                        constant: 0);
        self.view.addConstraint(height)
    }
    
    func logMessage(messageText: String) {
        NSLog(messageText)
        nameLbl.text = messageText
    }
    
    func prepareLocalMedia() {

        // We will share local audio and video when we connect to the Room.

        // Create an audio track.
        if (localAudioTrack == nil) {
            localAudioTrack = LocalAudioTrack(options: nil, enabled: true, name: "Microphone")

            if (localAudioTrack == nil) {
                logMessage(messageText: "Failed to create audio track")
            }
        }

        // Create a video track which captures from the camera.
        if (localVideoTrack == nil) {
            self.startPreview()
        }
   }
    
    // Update our UI based upon if we are in a Room or not
      func showRoomUI(inRoom: Bool) {
//        self.connectButton.isHidden = inRoom
//        self.roomTextField.isHidden = inRoom
//        self.roomLine.isHidden = inRoom
//        self.roomLabel.isHidden = inRoom
//        self.micButton.isHidden = !inRoom
//        self.disconnectButton.isHidden = !inRoom
        self.navigationController?.setNavigationBarHidden(inRoom, animated: true)
        UIApplication.shared.isIdleTimerDisabled = inRoom
        // Show / hide the automatic home indicator on modern iPhones.
        self.setNeedsUpdateOfHomeIndicatorAutoHidden()
      }
    
    
    @objc func flipCamera() {
        var newDevice: AVCaptureDevice?

        if let camera = self.camera, let captureDevice = camera.device {
            if captureDevice.position == .front {
                newDevice = CameraSource.captureDevice(position: .back)
            } else {
                newDevice = CameraSource.captureDevice(position: .front)
            }

            if let newDevice = newDevice {
                camera.selectCaptureDevice(newDevice) { (captureDevice, videoFormat, error) in
                    if let error = error {
                        self.logMessage(messageText: "Error selecting capture device.\ncode = \((error as NSError).code) error = \(error.localizedDescription)")
                    } else {
                        self.ownVideoView.shouldMirror = (captureDevice.position == .front)
                    }
                }
            }
        }
    }
    
    func cleanupRemoteParticipant() {
        if self.remoteParticipant != nil {
            self.remoteView?.removeFromSuperview()
            self.remoteView = nil
            self.remoteParticipant = nil
//            self.navigationController?.pushViewController(DoctorEndCallController(), animated: true)
        }
    }
    
    func renderRemoteParticipant(participant : RemoteParticipant) -> Bool {
        // This example renders the first subscribed RemoteVideoTrack from the RemoteParticipant.
        let videoPublications = participant.remoteVideoTracks
        for publication in videoPublications {
            if let subscribedVideoTrack = publication.remoteTrack,
                publication.isTrackSubscribed {
                setupRemoteVideoView()
                subscribedVideoTrack.addRenderer(self.remoteView!)
                self.remoteParticipant = participant
                return true
            }
        }
        return false
    }
    
    func renderRemoteParticipants(participants : Array<RemoteParticipant>) {
        for participant in participants {
            // Find the first renderable track.
            if participant.remoteVideoTracks.count > 0,
                renderRemoteParticipant(participant: participant) {
                break
            }
        }
    }
    func endcall(){
        //Goto End Call Controller
        self.navigationController?.pushViewController(DoctorEndCallController(), animated: true)

    }
    
    func endCallApi(){
    //    self.remoteView.isHidden = true
        DispatchQueue.main.async {
            self.cleanupRemoteParticipant()
            self.playDisconnectSound()
            self.stopPickSound()
            self.stopWaitSound()
       //   activityIndicatorWithMessage.shared.showActivity(myView: self.view, myTitle: "disconnecting")
        }
//        BackendController.callStatus(room_name: room_name ?? "") { status, msg, hasError in
//          self.room?.disconnect()
//          DispatchQueue.main.async {
//            activityIndicatorWithMessage.shared.removeActivity(myView: self.view)
//          }
//          if hasError{
//            DispatchQueue.main.async {
//              self.stopDisconnectSound()
//              self.room?.disconnect()
//              let vc = CustomTabBarController()
//              vc.selectedIndex = 0
//              let rootNC = UINavigationController(rootViewController: vc)
//              rootNC.navigationBar.isHidden = true
//              UIApplication.shared.windows.first?.rootViewController = rootNC
//              UIApplication.shared.windows.first?.makeKeyAndVisible()
//    //          self.dismiss(animated: false) {
//    //            self.delegate?.reload()
//    //          }
//            }
//          }else{
//            if !status{
//              DispatchQueue.main.async {
//                self.stopDisconnectSound()
//                self.room?.disconnect()
//                let vc = CustomTabBarController()
//                vc.selectedIndex = 0
//                let rootNC = UINavigationController(rootViewController: vc)
//                rootNC.navigationBar.isHidden = true
//                UIApplication.shared.windows.first?.rootViewController = rootNC
//                UIApplication.shared.windows.first?.makeKeyAndVisible()
//    //            self.dismiss(animated: false) {
//    //              self.delegate?.reload()
//    //            }
//              }
//            }else{
//              DispatchQueue.main.async {
//                self.stopDisconnectSound()
//                self.room?.disconnect()
//                self.delegate?.stop()
//                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "manualliveScan") as! manualLiveScan
//                nextViewController.modalTransitionStyle = .crossDissolve
//                nextViewController.modalPresentationStyle = .fullScreen
//                self.present(nextViewController, animated:true, completion:nil)
//              }
//            }
//          }
//        }
      }
    
    
}


// MARK:- CameraSourceDelegate
@available(iOS 13.0, *)
extension DoctorVideoCallController : CameraSourceDelegate {
    func cameraSourceDidFail(source: CameraSource, error: Error) {
        logMessage(messageText: "Camera source failed with error: \(error.localizedDescription)")
//        endcall()
    }
}

@available(iOS 13.0, *)
// MARK:- VideoViewDelegate
extension DoctorVideoCallController : VideoViewDelegate {
    func videoViewDimensionsDidChange(view: VideoView, dimensions: CMVideoDimensions) {
        self.view.setNeedsLayout()
    }
}

@available(iOS 13.0, *)
// MARK:- RoomDelegate
extension DoctorVideoCallController : RoomDelegate {
  func roomDidConnect(room: Room) {
      logMessage(messageText: "Waiting...(\(room.name))")
    stopStartSound()
    // This example only renders 1 RemoteVideoTrack at a time. Listen for all events to decide which track to render.
    playWaitingSound()
    self.showRoomUI(inRoom: true)
    for remoteParticipant in room.remoteParticipants {
      remoteParticipant.delegate = self
    }
//    self.dismiss(animated: true, completion: nil)
  }
  func roomDidDisconnect(room: Room, error: Error?) {
    logMessage(messageText: "Disconnecting...")
    self.cleanupRemoteParticipant()
    self.room = nil
    if error != nil{
      DispatchQueue.main.async {
        self.endCallApi()
        self.logMessage(messageText: "Disconnecting...")
      }
//      room.disconnect()
//      self.dismiss(animated: false, completion: nil)
//      self.delegate?.reload()
//      return
    }
//    self.dismiss(animated: true, completion: nil)
    self.showRoomUI(inRoom: true)
  }
  func roomDidFailToConnect(room: Room, error: Error) {
//    logMessage(messageText: "Failed to connect to room with error = \(String(describing: error))")
    self.room = nil
    if self.room == nil{
      DispatchQueue.main.async {
        self.endCallApi()
        self.logMessage(messageText: "Disconnecting...")
      }
//      self.dismiss(animated: false, completion: nil)
//      self.delegate?.reload()
      return
    }
//    self.dismiss(animated: true, completion: nil)
    self.showRoomUI(inRoom: true)
  }
  func roomIsReconnecting(room: Room, error: Error) {
    logMessage(messageText: "Reconnecting...")
  }
  func roomDidReconnect(room: Room) {
//    logMessage(messageText: "Reconnected to room \(room.name)")
  }
  func participantDidConnect(room: Room, participant: RemoteParticipant) {
    // Listen for events from all Participants to decide which RemoteVideoTrack to render.
    DispatchQueue.main.async {
      self.logMessage(messageText: "Connected with \(participant.identity)")
      participant.delegate = self
      self.stopWaitSound()
      self.playPickSound()
    }
//    logMessage(messageText: "Participant \(participant.identity) connected with \(participant.remoteAudioTracks.count) audio and \(participant.remoteVideoTracks.count) video tracks")
  }
  func participantDidDisconnect(room: Room, participant: RemoteParticipant) {
//    logMessage(messageText: "Room \(room.name), Participant \(participant.identity) disconnected")
    DispatchQueue.main.async {
      self.endCallApi()
    }
    // Nothing to do in this example. Subscription events are used to add/remove renderers.
  }
}
@available(iOS 13.0, *)
// MARK:- RemoteParticipantDelegate
extension DoctorVideoCallController : RemoteParticipantDelegate {
  func remoteParticipantDidPublishVideoTrack(participant: RemoteParticipant, publication: RemoteVideoTrackPublication) {
    // Remote Participant has offered to share the video Track.
    DispatchQueue.main.async {
      self.logMessage(messageText: "Connected with \(participant.identity)")
      self.stopWaitSound()
      participant.delegate = self
      self.playPickSound()
    }
//    logMessage(messageText: "Participant \(participant.identity) published \(publication.trackName) video track")
  }
  func remoteParticipantDidUnpublishVideoTrack(participant: RemoteParticipant, publication: RemoteVideoTrackPublication) {
    // Remote Participant has stopped sharing the video Track.
    logMessage(messageText: "Connected with \(participant.identity)")
    stopWaitSound()
//    logMessage(messageText: "Participant \(participant.identity) unpublished \(publication.trackName) video track")
  }
  func remoteParticipantDidPublishAudioTrack(participant: RemoteParticipant, publication: RemoteAudioTrackPublication) {
    // Remote Participant has offered to share the audio Track.
    logMessage(messageText: "Connected with \(participant.identity)")
    stopWaitSound()
//    logMessage(messageText: "Participant \(participant.identity) published \(publication.trackName) audio track")
  }
  func remoteParticipantDidUnpublishAudioTrack(participant: RemoteParticipant, publication: RemoteAudioTrackPublication) {
    // Remote Participant has stopped sharing the audio Track.
//    logMessage(messageText: "Participant \(participant.identity) unpublished \(publication.trackName) audio track")
  }
  func didSubscribeToVideoTrack(videoTrack: RemoteVideoTrack, publication: RemoteVideoTrackPublication, participant: RemoteParticipant) {
    // The LocalParticipant is subscribed to the RemoteParticipant's video Track. Frames will begin to arrive now.
    DispatchQueue.main.async {
      self.logMessage(messageText: "Connected with \(participant.identity)")
      self.stopWaitSound()
      participant.delegate = self
      self.playPickSound()
    }
//    logMessage(messageText: "Subscribed to \(publication.trackName) video track for Participant \(participant.identity)")
    if (self.remoteParticipant == nil) {
      _ = renderRemoteParticipant(participant: participant)
    }
  }
  func didUnsubscribeFromVideoTrack(videoTrack: RemoteVideoTrack, publication: RemoteVideoTrackPublication, participant: RemoteParticipant) {
    // We are unsubscribed from the remote Participant's video Track. We will no longer receive the
    // remote Participant's video.
//    logMessage(messageText: "Unsubscribed from \(publication.trackName) video track for Participant \(participant.identity)")
    if self.remoteParticipant == participant {
      cleanupRemoteParticipant()
      // Find another Participant video to render, if possible.
      if var remainingParticipants = room?.remoteParticipants,
        let index = remainingParticipants.index(of: participant) {
        remainingParticipants.remove(at: index)
        renderRemoteParticipants(participants: remainingParticipants)
      }
    }
    DispatchQueue.main.async {
      self.endCallApi()
    }
  }
  func didSubscribeToAudioTrack(audioTrack: RemoteAudioTrack, publication: RemoteAudioTrackPublication, participant: RemoteParticipant) {
    // We are subscribed to the remote Participant's audio Track. We will start receiving the
    // remote Participant's audio now.
//    logMessage(messageText: "Subscribed to \(publication.trackName) audio track for Participant \(participant.identity)")
  }
  func didUnsubscribeFromAudioTrack(audioTrack: RemoteAudioTrack, publication: RemoteAudioTrackPublication, participant: RemoteParticipant) {
    // We are unsubscribed from the remote Participant's audio Track. We will no longer receive the
    // remote Participant's audio.
    logMessage(messageText: "Patient Muted")
  }
  func remoteParticipantDidEnableVideoTrack(participant: RemoteParticipant, publication: RemoteVideoTrackPublication) {
    logMessage(messageText: "Connected with \(participant.identity)")
    stopWaitSound()
//    logMessage(messageText: "Participant \(participant.identity) enabled \(publication.trackName) video track")
  }
  func remoteParticipantDidDisableVideoTrack(participant: RemoteParticipant, publication: RemoteVideoTrackPublication) {
//    logMessage(messageText: "Participant \(participant.identity) disabled \(publication.trackName) video track")
    logMessage(messageText: "Patient Stop Video")
  }
  func remoteParticipantDidEnableAudioTrack(participant: RemoteParticipant, publication: RemoteAudioTrackPublication) {
    logMessage(messageText: "Connected with \(participant.identity)")
//    logMessage(messageText: "Participant \(participant.identity) enabled \(publication.trackName) audio track")
  }
  func remoteParticipantDidDisableAudioTrack(participant: RemoteParticipant, publication: RemoteAudioTrackPublication) {
    logMessage(messageText: "Patients Muted")
//    logMessage(messageText: "Participant \(participant.identity) disabled \(publication.trackName) audio track")
  }
  func didFailToSubscribeToAudioTrack(publication: RemoteAudioTrackPublication, error: Error, participant: RemoteParticipant) {
//    logMessage(messageText: "FailedToSubscribe \(publication.trackName) audio track, error = \(String(describing: error))")
  }
  func didFailToSubscribeToVideoTrack(publication: RemoteVideoTrackPublication, error: Error, participant: RemoteParticipant) {
//    logMessage(messageText: "FailedToSubscribe \(publication.trackName) video track, error = \(String(describing: error))")
  }
}


extension DoctorVideoCallController{
    func playStartSound(){
        let urlpath = Bundle.main.path(forResource: "calling", ofType: "mp3")!
        let url:URL  = URL.init(fileURLWithPath: urlpath)
        startSound = Sound(url: url)
        startSound?.play(numberOfLoops: -1){ complete in
            print(complete)
        }
    }
    func stopStartSound(){
        startSound?.stop()
    }
    func playWaitingSound(){
        stopStartSound()
        let urlpath = Bundle.main.path(forResource: "waiting", ofType: "mp3")!
        let url:URL  = URL.init(fileURLWithPath: urlpath)
        waitingSound = Sound(url: url)
        waitingSound?.play(numberOfLoops: -1){ complete in
            print(complete)
        }
    }
    func stopWaitSound(){
        DispatchQueue.main.async {
            self.waitingSound?.stop()
        }
    }
    func playDisconnectSound(){
        //        let urlpath = Bundle.main.path(forResource: "disconnected", ofType: "mp3")!
        //        let url:URL  = URL.init(fileURLWithPath: urlpath)
        //        disconnectSound = Sound(url: url)
        disconnectSound?.play{ complete in
            self.disconnectSound?.stop()
            print(complete)
        }
    }
    func stopDisconnectSound(){
        DispatchQueue.main.async {
            self.disconnectSound?.stop()
        }
    }
    func playPickSound(){
        self.stopWaitSound()
        DispatchQueue.main.async {
            self.stopWaitSound()
        }
        let urlpath = Bundle.main.path(forResource: "connecting", ofType: "mp3")!
        let url:URL  = URL.init(fileURLWithPath: urlpath)
        
        pickupSound = Sound(url: url)
        pickupSound?.play(){ complete in
            self.stopPickSound()
        }
    }
    func stopPickSound(){
        pickupSound?.stop()
    }
}

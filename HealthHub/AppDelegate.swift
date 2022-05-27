//
//  AppDelegate.swift
//  HealthHub
//
//  Created by mac on 10/12/2021.
//

import UIKit
import FacebookCore
import GoogleSignIn
import IQKeyboardManager
import Firebase
import FirebaseCore
import LGSideMenuController
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate { 
    
    var window: UIWindow?
    var mainController = UIViewController()
    var appointmnet = appointdata()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions)
        
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
            } else {
                // Show the app's signed-in state.
            }
        }
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        
//        IQKeyboardManager.shared().disabledDistanceHandlingClasses.append(MessgeViewController.self)
        
        Messaging.messaging().delegate = self
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
                AppUserDefault.shared.fcmToken = token
                
            }
        }
        
        
        application.registerForRemoteNotifications()
        
        
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().enableDebugging = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //        mainController =  GetStartedController()
        //       let navController = UINavigationController(rootViewController: mainController)
        //        navController.navigationBar.isHidden = true
        //        navController.navigationItem.backBarButtonItem?.isEnabled = false
        //       window?.rootViewController =  navController
        let ispatlogin = AppUserDefault.shared.isPatientLogin
        let isdoclogin = AppUserDefault.shared.isDoctorLogin
        if  ispatlogin == true{
            
            mainController = CustomTabBarController()
            let navController = UINavigationController(rootViewController: mainController)
            navController.navigationBar.isHidden = true
            navController.navigationItem.backBarButtonItem?.isEnabled = false
            window?.rootViewController =  navController
            
        }
        else if isdoclogin == true{
            let rootNavigationController = UINavigationController(rootViewController: DoctorDashBoardController())
            rootNavigationController.navigationBar.isHidden = true
            let leftViewController = SideMenuViewController()
            // 3. Create instance of LGSideMenuController with above controllers as root and left.
            let sideMenuController = LGSideMenuController(rootViewController: rootNavigationController,
                                                          leftViewController: leftViewController)
            // 4. Set presentation style by your taste if you don't like the default one.
            sideMenuController.leftViewPresentationStyle = .slideAbove
            sideMenuController.isLeftViewSwipeGestureEnabled = false
            
            // 5. Set width for the left view if you don't like the default one.
            sideMenuController.leftViewWidth = 300 * appConstant.widthRatio
            // 6. Make it `rootViewController` for your window.
            //      self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = sideMenuController
            self.window?.makeKeyAndVisible()
        }
        else
        {
            mainController = WellcomeStartController()
            let navController = UINavigationController(rootViewController: mainController)
            navController.navigationBar.isHidden = true
            navController.navigationItem.backBarButtonItem?.isEnabled = false
            window?.rootViewController =  navController
        }
        return true
    }
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
        var handled: Bool
        
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        
        // Handle other custom URL types.
        
        // If not handled by this app, return false.
        return false
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.applicationIconBadgeNumber = 0
    }
    
    
}

extension AppDelegate : MessagingDelegate{
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        print("Firebase registration token: \(fcmToken ?? "")")
        let dataDict:[String: String] = ["token": "\(fcmToken ?? "")"]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        //Saving FCM Token In USERDEFALT
        AppUserDefault.shared.fcmToken = fcmToken
        
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler:
                                @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
//        if userInfo["gcm.notification.type"] as? String ?? "" == "call"{
//            do{
//                let str = userInfo["gcm.notification.appointment"] as? String
//                let data = str?.data(using: .utf8) as? Data
//                let json = try JSONDecoder().decode(appointdata.self, from: data ?? Data())
//                if userInfo["gcm.notification.user_type"] as? String ?? "" == "doctor"{
//                    let vc = DoctorCustomTabbarController()
//                    vc.selectedIndex = 2
//                    let navController = UINavigationController(rootViewController: vc)
//                    navController.navigationBar.isHidden = true
//                    navController.navigationItem.backBarButtonItem?.isEnabled = false
//                    UIApplication.shared.windows.first?.rootViewController = navController
//                    UIApplication.shared.windows.first?.makeKeyAndVisible()
//                    let newVC = ChooseDetailAvailPatientController()
//                    newVC.modalPresentationStyle = .fullScreen
//                    newVC.getAppointmnetList = json
//                    newVC.isFromNotification = true
//                    navController.present(newVC, animated: false, completion: nil)
//                }else if userInfo["gcm.notification.user_type"] as? String ?? "" == "patient"{
//                    let vc = CustomTabBarController()
//                    vc.selectedIndex = 0
//                    let navController = UINavigationController(rootViewController: vc)
//                    navController.navigationBar.isHidden = true
//                    navController.navigationItem.backBarButtonItem?.isEnabled = false
//                    UIApplication.shared.windows.first?.rootViewController = navController
//                    UIApplication.shared.windows.first?.makeKeyAndVisible()
//                    let newVC = UPCommingController()
//                    newVC.modalPresentationStyle = .fullScreen
//                    newVC.appointment = json
//                    newVC.isFromNotification = true
//                    navController.present(newVC, animated: false, completion: nil)
//                }
//                print(json)
//            }catch(let error){
//                print(error)
//            }
//        }
        completionHandler([.alert, .badge, .sound])
    }
        
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {

        print(userInfo)
        if(userInfo.count > 0) {

        }
//        if  userInfo["gcm.notification.type"] as? String ?? "" == "call"{
//            do{
//                let str = userInfo["gcm.notification.appointment"]  as? String
//                let data = str?.data(using: .utf8) as? Data
//                let json = try JSONDecoder().decode(appointdata.self, from: data ?? Data())
//                if userInfo["gcm.notification.user_type"] as? String ?? "" == "doctor"{
////                    let vc = DoctorCustomTabbarController()
////                    vc.selectedIndex = 2
////                    let navController = UINavigationController(rootViewController: vc)
////                    navController.navigationBar.isHidden = true
////                    navController.navigationItem.backBarButtonItem?.isEnabled = false
////                    UIApplication.shared.windows.first?.rootViewController = navController
////                    UIApplication.shared.windows.first?.makeKeyAndVisible()
////                    let newVC = ChooseDetailAvailPatientController()
////                    newVC.modalPresentationStyle = .fullScreen
////                    newVC.getAppointmnetList = json
////                    newVC.isFromNotification = true
////                    navController.present(newVC, animated: false, completion: nil)
//                }else if userInfo["gcm.notification.user_type"] as? String ?? "" == "patient"{
////                    let vc = CustomTabBarController()
////                    vc.selectedIndex = 0
////                    let navController = UINavigationController(rootViewController: vc)
////                    navController.navigationBar.isHidden = true
////                    navController.navigationItem.backBarButtonItem?.isEnabled = false
////                    UIApplication.shared.windows.first?.rootViewController = navController
////                    UIApplication.shared.windows.first?.makeKeyAndVisible()
////                    let newVC = UPCommingController()
////                    newVC.modalPresentationStyle = .fullScreen
////                    newVC.appointment = json
////                    newVC.isFromNotification = true
////                    navController.present(newVC, animated: false, completion: nil)
//                }
//                print(json)
//            }catch(let error){
//                print(error)
//            }
//
//
//        }
        print("Notification Detail when app is in Background",userInfo)
//        completionHandler([.alert, .badge, .sound])
    }
    
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        print(userInfo)
//
//        if  userInfo["gcm.notification.type"] as? String ?? "" == "call"{
//            do{
//                let str = userInfo["gcm.notification.appointment"]  as? String
//                let data = str?.data(using: .utf8) as? Data
//                let json = try JSONDecoder().decode(appointdata.self, from: data ?? Data())
//                if userInfo["gcm.notification.user_type"] as? String ?? "" == "doctor"{
//                    let vc = DoctorCustomTabbarController()
//                    vc.selectedIndex = 2
//                    let navController = UINavigationController(rootViewController: vc)
//                    navController.navigationBar.isHidden = true
//                    navController.navigationItem.backBarButtonItem?.isEnabled = false
//                    UIApplication.shared.windows.first?.rootViewController = navController
//                    UIApplication.shared.windows.first?.makeKeyAndVisible()
//                    let newVC = ChooseDetailAvailPatientController()
//                    newVC.modalPresentationStyle = .fullScreen
//                    newVC.getAppointmnetList = json
//                    newVC.isFromNotification = true
//                    navController.present(newVC, animated: false, completion: nil)
//                }else if userInfo["gcm.notification.user_type"] as? String ?? "" == "patient"{
//                    let vc = CustomTabBarController()
//                    vc.selectedIndex = 0
//                    let navController = UINavigationController(rootViewController: vc)
//                    navController.navigationBar.isHidden = true
//                    navController.navigationItem.backBarButtonItem?.isEnabled = false
//                    UIApplication.shared.windows.first?.rootViewController = navController
//                    UIApplication.shared.windows.first?.makeKeyAndVisible()
//                    let newVC = UPCommingController()
//                    newVC.modalPresentationStyle = .fullScreen
//                    newVC.appointment = json
//                    newVC.isFromNotification = true
//                    navController.present(newVC, animated: false, completion: nil)
//                }
//                print(json)
//            }catch(let error){
//                print(error)
//            }
//
//
//        }
//
//        UIApplication.shared.applicationIconBadgeNumber = 0
//
//    }
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//
//        print("Unable to register for remote notifications: \(error.localizedDescription)")
//
//    }
//
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("notification did tap")
        if userInfo["gcm.notification.type"] as? String ?? "" == "call"{
              do{
                let str = userInfo["gcm.notification.appointment"] as? String
                let data = str?.data(using: .utf8) as? Data
                let json = try JSONDecoder().decode(appointdata.self, from: data ?? Data())
                if userInfo["gcm.notification.user_type"] as? String ?? "" == "doctor"{
                  let vc = DoctorCustomTabbarController()
                  vc.selectedIndex = 2
                  let navController = UINavigationController(rootViewController: vc)
                  navController.navigationBar.isHidden = true
                  navController.navigationItem.backBarButtonItem?.isEnabled = false
                  UIApplication.shared.windows.first?.rootViewController = navController
                  UIApplication.shared.windows.first?.makeKeyAndVisible()
                  let newVC = ChooseDetailAvailPatientController()
                  newVC.modalPresentationStyle = .fullScreen
                  newVC.getAppointmnetList = json
                  newVC.isFromNotification = true
                  navController.present(newVC, animated: false, completion: nil)
                }else if userInfo["gcm.notification.user_type"] as? String ?? "" == "patient"{
                  let vc = CustomTabBarController()
                  vc.selectedIndex = 0
                  let navController = UINavigationController(rootViewController: vc)
                  navController.navigationBar.isHidden = true
                  navController.navigationItem.backBarButtonItem?.isEnabled = false
                  UIApplication.shared.windows.first?.rootViewController = navController
                  UIApplication.shared.windows.first?.makeKeyAndVisible()
                  let newVC = UPCommingController()
                  newVC.modalPresentationStyle = .fullScreen
                  newVC.appointment = json
                  newVC.isFromNotification = true
                  navController.present(newVC, animated: false, completion: nil)
                }
                print(json)
              }catch(let error){
                print(error)
              }
        }
        else if userInfo["gcm.notification.type"] as? String ?? "" == "chat"
        {
            do{
              let str = userInfo["gcm.notification.appointment"] as? String
              let data = str?.data(using: .utf8) as? Data
              let json = try JSONDecoder().decode(appointdata.self, from: data ?? Data())
              if userInfo["gcm.notification.user_type"] as? String ?? "" == "doctor"{
                let vc = DoctorCustomTabbarController()
                vc.selectedIndex = 3
                let navController = UINavigationController(rootViewController: vc)
                navController.navigationBar.isHidden = true
                navController.navigationItem.backBarButtonItem?.isEnabled = false
                UIApplication.shared.windows.first?.rootViewController = navController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                let newVC = MessageListController()
                newVC.modalPresentationStyle = .fullScreen
                newVC.getAppointmnetList = json
                newVC.isFromNotification = true
                navController.present(newVC, animated: false, completion: nil)
              }else if userInfo["gcm.notification.user_type"] as? String ?? "" == "patient"{
                let vc = CustomTabBarController()
                vc.selectedIndex = 3
                let navController = UINavigationController(rootViewController: vc)
                navController.navigationBar.isHidden = true
                navController.navigationItem.backBarButtonItem?.isEnabled = false
                UIApplication.shared.windows.first?.rootViewController = navController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                let newVC = MessageListController()
                newVC.modalPresentationStyle = .fullScreen
                newVC.appointment = json
                newVC.isFromNotification = true
                navController.present(newVC, animated: false, completion: nil)
              }
              print(json)
            }catch(let error){
              print(error)
            }
        }
        completionHandler()
      }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print("APNs token retrieved: \(deviceToken)")
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print(token)
        
    }
    
    
}





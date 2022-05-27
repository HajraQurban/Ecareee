//
//  SceneDelegate.swift
//  HealthHub
//
//  Created by mac on 10/12/2021.
//

import UIKit
import FacebookCore
import LGSideMenuController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var mainController = UIViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        //        guard let windowScene = (scene as? UIWindowScene) else { return }
        //        window = UIWindow(frame: UIScreen.main.bounds)
        //        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
//                mainController = GetStartedController()
//                let navController = UINavigationController(rootViewController: mainController)
//                navController.navigationBar.isHidden = true
//                window?.rootViewController =  navController
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

//            let vc = DoctorCustomTabbarController()
//            vc.selectedIndex = 2
//            let navController = UINavigationController(rootViewController: vc)
//            navController.navigationBar.isHidden = true
//            navController.navigationItem.backBarButtonItem?.isEnabled = false
//            window?.rootViewController =  navController
            
            let rootNavigationController = UINavigationController(rootViewController: DoctorCustomTabbarController())
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
            window?.rootViewController = sideMenuController
            window?.makeKeyAndVisible()
            

        }
        else
        {
            mainController = WellcomeStartController()
            let navController = UINavigationController(rootViewController: mainController)
            navController.navigationBar.isHidden = true
            navController.navigationItem.backBarButtonItem?.isEnabled = false
            window?.rootViewController =  navController
        }
        
        
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        
        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
}


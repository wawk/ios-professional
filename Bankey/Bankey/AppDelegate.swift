//
//  AppDelegate.swift
//  Bankey
//
//  Created by Steve Moody on 5/23/23ºººººº
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
    

    
    let loginViewController = LoginViewController()
    
    let onboardingCintainerViewController = OnboardingContainerViewController()
    
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingCintainerViewController.delegate = self
        dummyViewController.logoutDelegate = self
        // window?.rootViewController = mainViewController()
         window?.rootViewController = AccountSummaryViewController()
        //window?.rootViewController = OnboardingContainerViewController()
        
        mainViewController.selectedIndex = 1
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean",
//                                                              titleText: "Bankey is faster, easier to use and has a brand new look and feel that will make you feel like you are back in the 80s")
//
        
        
        
        return true
    }

}

extension AppDelegate {
    func setRootViewController( _ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.7,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnBoarded{
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingCintainerViewController)
        }
    }
    
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnBoarded = true
        setRootViewController(dummyViewController)
    }
}
    
extension AppDelegate: LogoutDelegate {
        func didLogout() {
            setRootViewController(loginViewController)
            
        }
    }


    



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

    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingCintainerViewController.delegate = self
        
        displayLogin()
        return true
    }
    
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnBoarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingCintainerViewController)
        }
    }
    
    private func prepMainView() {
        mainViewController.setNavBar()
        UINavigationBar.appearance().isTranslucent=false
        UINavigationBar.appearance().backgroundColor = appColor
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
        displayNextScreen()
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnBoarded = true
        prepMainView()
        setRootViewController(mainViewController)
   
    }
}
    
extension AppDelegate: LogoutDelegate {
        func didLogout() {
            setRootViewController(loginViewController)
            
        }
    }


    



//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Steve Moody on 6/9/23.
//

import UIKit

extension UIViewController {
    
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)
        statusbarView.backgroundColor = appColor
        view.addSubview(statusbarView)
//
    }
    
    func setNavBar(){
        let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithTransparentBackground()
                navBarAppearance.backgroundColor = appColor
                UINavigationBar.appearance().standardAppearance = navBarAppearance
                
    }
    
    
    
    func setTabBarImage(imageName: String, title: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

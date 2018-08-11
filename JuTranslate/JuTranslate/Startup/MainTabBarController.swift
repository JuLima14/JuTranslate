//
//  MainTabBarControllerViewController.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Core.shared.logger.log(with: .info, value: "Application started")
        
        tabBar.barTintColor = UIColor.white
        tabBar.unselectedItemTintColor = Core.shared.stylesheet.darkGray
        
        guard let homeIcon = UIImage(named: "home"), let starIcon = UIImage(named: "star"), let settingsIcon = UIImage(named: "settings") else {
            Core.shared.logger.log(with: .error, value: "One or multiple tab bar images couldn't be loaded.")
            return
        }
        
        let homeViewController = HomeViewController()
        homeViewController.view.backgroundColor = Core.shared.stylesheet.lightGray
        homeViewController.tabBarItem = MainTabBarItem(title: "Home", image: homeIcon, tag: 0)
        
        let savedViewController = SavedViewController()
        savedViewController.view.backgroundColor = UIColor.white
        savedViewController.tabBarItem = MainTabBarItem(title: "Saved", image: starIcon, tag: 1)
        
        let settingsViewController = SettingsViewController()
        settingsViewController.view.backgroundColor = UIColor.white
        settingsViewController.tabBarItem = MainTabBarItem(title: "Settings", image: settingsIcon, tag: 2)
        
        viewControllers = [homeViewController, savedViewController, settingsViewController]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        var tabBarView = [UIView]()
        
        for i in tabBar.subviews {
            if i.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabBarView.append(i)
            }
        }
        
        if !tabBarView.isEmpty && tabBarView.count >= item.tag {
            let thisTabBarItem = tabBarView[item.tag]
            animateTabBarItem(item: thisTabBarItem)
        }
    }
    
    private func animateTabBarItem(item: UIView) {
        let circleView = CircleView(color: Core.shared.stylesheet.softBlue)
        tabBar.addSubview(circleView)
        
        circleView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(item)
            make.height.width.equalTo(50)
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            circleView.snp.updateConstraints({ (make) in
                make.centerX.centerY.equalTo(item)
                make.height.width.equalTo(160)
            })
            circleView.alpha = 0.4
            circleView.layoutIfNeeded()
        }) { _ in
            circleView.removeFromSuperview()
        }
    }

}

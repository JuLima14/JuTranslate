//
//  MainTabBarItem.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class MainTabBarItem: UITabBarItem {
    override init() {
        super.init()
        
        let attributes = [
            NSAttributedStringKey.font: Core.shared.stylesheet.getFont(name: .RobotoLight, size: 12.0),
            NSAttributedStringKey.foregroundColor: Core.shared.stylesheet.darkGray
        ]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

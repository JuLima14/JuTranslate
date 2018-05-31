//
//  Stylesheet.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

    
    enum NavigationBar : String {
        case HomeNavigationBar = "HomeNavigationBar"
        case SavedNavigationBar = "SavedNavigationBar"
        case SettingsNavigationBar = "SettingsNavigationBar"
    }
    
    enum Font: String {
        case RobotoThin = "Roboto-Thin"
        case RobotoThinItalic = "Roboto-ThinItalic"
        case RobotoLight = "Roboto-Light"
        case RobotoLightItalic = "Roboto-LightItalic"
        case RobotoRegular = "Roboto-Regular"
        case RobotoItalic = "Roboto-Italic"
        case RobotoMedium = "Roboto-Medium"
        case RobotoMediumItalic = "Roboto-MediumItalic"
        case RobotoBold = "Roboto-Bold"
        case RobotoBoldItalic = "Roboto-BoldItalic"
        case RobotoBlack = "Roboto-Black"
        case RobotoBlackItalic = "Roboto-BlackItalic"
    }
    
    class Stylesheet {
        //Colors
        let black = UIColor.black
        let white = UIColor.white
        let clear = UIColor.clear
        let red = UIColor.red
        let opaqueRed = UIColor(hexString: "BF360C")
        let softBlue = UIColor(hexString: "4788EA")
        let darkGray = UIColor(hexString: "484649")
        let middleGray = UIColor(hexString: "C5C5C5")
        let lightGray = UIColor(hexString: "E0E0E0")
        let midLightGray = UIColor(hexString: "EEEEEE")
        let ultraLightGray = UIColor(hexString: "FAFAFA")
        
        //Fonts
        func getFont(name: Font, size: CGFloat) -> UIFont {
            if let font = UIFont(name: name.rawValue, size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: 15)
        }
    }

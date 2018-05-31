//
//  UIExtensions.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIButton {
    
    func activateAnimation() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(doPressEffect(sender:))))
    }
    
    @objc private func doPressEffect(sender: UITapGestureRecognizer) {
        let point = sender.location(in: self)
        
        let circleView = CircleView(color: Core.shared.stylesheet.softBlue)
        self.addSubview(circleView)
        
        circleView.snp.makeConstraints { (make) in
            make.centerX.equalTo(point.x)
            make.centerY.equalTo(point.y)
            make.height.width.equalTo(15)
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            circleView.snp.updateConstraints({ (make) in
                make.centerX.equalTo(point.x)
                make.centerY.equalTo(point.y)
                make.height.width.equalTo(200)
            })
            circleView.alpha = 0.4
            circleView.layoutIfNeeded()
        }) { _ in
            circleView.removeFromSuperview()
        }
    }
}

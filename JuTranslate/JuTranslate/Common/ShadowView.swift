//
//  ShadowView.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

import UIKit

class ShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        let gradientColors = [Core.shared.stylesheet.middleGray.cgColor, Core.shared.stylesheet.midLightGray.cgColor, Core.shared.stylesheet.clear.cgColor]
        let gradientLocations = [0.2, 0.4, 1.0]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2)
        gradientLayer.opacity = 0.5
        self.layer.addSublayer(gradientLayer)
        self.layer.zPosition = 100
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//
//  ViewOptionButtons.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit
import SnapKit

class ViewOptionButtons: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        
        let buttonPhoto: UIButton = {
            let button = UIButton(frame: CGRect.zero)
            button.activateAnimation()
            button.setBackgroundImage(#imageLiteral(resourceName: "camera_enhance"), for: UIControlState.normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        let buttonAudio: UIButton = {
            let button = UIButton(frame: CGRect.zero)
            button.activateAnimation()
            button.setBackgroundImage(#imageLiteral(resourceName: "mic"), for: UIControlState.normal)
            button.imageView?.contentMode = .scaleAspectFill
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        let buttonPenPad: UIButton = {
            let button = UIButton(frame: CGRect.zero)
            button.activateAnimation()
            button.setBackgroundImage(#imageLiteral(resourceName: "create"), for: UIControlState.normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        let viewShadow: UIView = {
            let backgroundView = UIView(frame: .zero)
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            self.layer.masksToBounds = false
            self.clipsToBounds = false
            let gradientColors = [Core.shared.stylesheet.black.cgColor, Core.shared.stylesheet.middleGray.cgColor, Core.shared.stylesheet.clear.cgColor]
            let gradientLocations = [0.0, 0.5, 1.0]
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = gradientColors
            gradientLayer.locations = gradientLocations as [NSNumber]?
            gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2)
            gradientLayer.opacity = 0.5
            backgroundView.layer.addSublayer(gradientLayer)
            backgroundView.layer.zPosition = 100
            return backgroundView
        }()
        
        self.addSubview(buttonPhoto)
        self.addSubview(buttonAudio)
        self.addSubview(buttonPenPad)
        self.addSubview(viewShadow)
        
        buttonPhoto.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(50)
        }
        buttonAudio.snp.makeConstraints { (make) in
            make.center.equalTo(self.snp.center)
        }
        buttonPenPad.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(50)
        }
        viewShadow.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(6.0)
        }
        
        
    }


}

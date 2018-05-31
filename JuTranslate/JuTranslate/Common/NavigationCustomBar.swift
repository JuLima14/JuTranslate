//
//  NavigationCustomBar.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class NavigationCustomBar: UIView {
    
    init(type: NavigationBar){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupView(type: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(type: NavigationBar){
        switch type {
        case .HomeNavigationBar:
            self.setupHomeNavigationBar()
        case .SavedNavigationBar:
            self.setupSavedNavigationBar()
        case .SettingsNavigationBar:
            self.setupSettingsNavigationBar()
        }
    }
    func setupHomeNavigationBar(){
        
        self.backgroundColor = Core.shared.stylesheet.softBlue
        
        let labelTitle: UILabel = {
            let label = UILabel(frame: CGRect.zero)
            let str = NSMutableAttributedString()
            str.append(NSAttributedString(string: "Ju", attributes: [
                NSAttributedStringKey.font : Core.shared.stylesheet.getFont(name: .RobotoMedium, size: 18)
                ]))
            str.append(NSAttributedString(string: " Translate", attributes: [kCTFontAttributeName as NSAttributedStringKey : Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 17)]))
            str.addAttributes([kCTForegroundColorAttributeName as NSAttributedStringKey : UIColor.white], range: NSMakeRange(0, str.string.count))
            label.attributedText = str
            label.textColor = Core.shared.stylesheet.white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        self.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { (make) in
            make.centerWithinMargins.equalToSuperview()
        }
    }
    func setupSavedNavigationBar(){
        
        self.backgroundColor = Core.shared.stylesheet.midLightGray
        
        let labelTitle: UILabel = {
            let label = UILabel(frame: .zero)
            label.text = "Saved"
            label.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 20)
            label.textColor = Core.shared.stylesheet.black
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let viewShadow = ShadowView(frame: .zero)
        
        self.addSubview(labelTitle)
        self.addSubview(viewShadow)
        
        labelTitle.snp.makeConstraints { (make) in
            make.centerYWithinMargins.equalToSuperview()
            make.left.equalToSuperview().inset(12)
        }
        viewShadow.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(2.0)
        }
    }
    func setupSettingsNavigationBar(){
        
        self.backgroundColor = Core.shared.stylesheet.midLightGray
        let labelTitle: UILabel = {
            let label = UILabel(frame: .zero)
            label.text = "Settings"
            label.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 20)
            label.textColor = Core.shared.stylesheet.black
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let viewShadow = ShadowView(frame: .zero)
        
        self.addSubview(labelTitle)
        self.addSubview(viewShadow)
        
        labelTitle.snp.makeConstraints { (make) in
            make.centerYWithinMargins.equalToSuperview()
            make.left.equalToSuperview().inset(12)
        }
        viewShadow.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(2.0)
        }
    }
}

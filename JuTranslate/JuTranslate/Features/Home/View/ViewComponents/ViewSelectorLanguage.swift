//
//  ViewSelectorLanguage.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit
import SnapKit

class ViewSelectorLanguage: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView(){
        let labelLanguageLeft : UILabel = {
            let label = UILabel(frame: CGRect.zero)
            label.text = "English"
            label.textAlignment = .center
            label.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 18)
            label.textColor = Core.shared.stylesheet.softBlue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        let labelLanguageRight: UILabel = {
            let label = UILabel(frame: CGRect.zero)
            label.text = "Spanish"
            label.textAlignment = .center
            label.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 18)
            label.textColor = Core.shared.stylesheet.softBlue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let buttonSelector: UIButton = {
            let button = UIButton(frame: CGRect.zero)
            button.setBackgroundImage(#imageLiteral(resourceName: "swap"), for: UIControlState.normal)
            button.tintColor = UIColor.lightGray
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        addSubview(labelLanguageLeft)
        addSubview(buttonSelector)
        addSubview(labelLanguageRight)
        
        labelLanguageLeft.snp.makeConstraints { (make) in
            make.topMargin.bottomMargin.equalToSuperview()
            make.rightMargin.equalTo(buttonSelector.snp.leftMargin)
            make.leftMargin.equalTo(snp.left)
        }
        buttonSelector.snp.makeConstraints { (make) in
            make.centerWithinMargins.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        labelLanguageRight.snp.makeConstraints { (make) in
            make.topMargin.bottomMargin.equalToSuperview()
            make.leftMargin.equalTo(buttonSelector.snp.rightMargin)
            make.rightMargin.equalTo(snp.right)
        }
    }


}

//
//  CustomTextField.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit
import SnapKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        attributedPlaceholder = NSAttributedString(string: "Enter text",attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.darkGray])
        textColor = UIColor.gray
        textAlignment = .natural
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: (bounds.midX - bounds.maxX/3)/2.5, y: -bounds.midY + bounds.midY/3, width: bounds.width, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: (bounds.midX - bounds.maxX/3)/2.5, y: -bounds.midY + bounds.midY/3, width: bounds.width, height: bounds.height)
    }
    


}

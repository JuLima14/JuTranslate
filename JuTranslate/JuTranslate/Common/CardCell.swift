//
//  CardCell.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(){
        
        let textToTranslate : UILabel = {
            let label = UILabel(frame: CGRect.zero)
            label.text = "How are you ?"
            label.textAlignment = .left
            label.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 17)
            label.textColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let textTranslated : UILabel = {
            let label = UILabel(frame: CGRect.zero)
            label.text = "Como estas ?"
            label.textAlignment = .left
            label.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 15)
            label.textColor = Core.shared.stylesheet.darkGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let buttonStar: UIButton = {
            let button = UIButton(frame: CGRect.zero)
            button.setBackgroundImage(#imageLiteral(resourceName: "star_border"), for: UIControlState.normal)
            button.imageView?.contentMode = .scaleAspectFill
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        addSubview(textToTranslate)
        addSubview(textTranslated)
        addSubview(buttonStar)
        
        textToTranslate.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.centerY)
            make.right.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }
        textTranslated.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).inset(5)
            make.right.equalToSuperview()
            make.left.equalToSuperview().inset(15)
        }
        buttonStar.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).inset(10)
            make.top.equalToSuperview().offset(10)
        }
    }
    
}

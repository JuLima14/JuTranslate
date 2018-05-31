//
//  ClearHistoryTableViewCell.swift
//  JuTranslate
//
//  Created by Julian Lima on 31/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class ClearHistoryTableViewCell: UITableViewCell {
    
    var descriptionLabel: UILabel = UILabel(frame: .zero)
    var separatorView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "clearid")
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(){
        layer.cornerRadius = 2
        backgroundColor = Core.shared.stylesheet.opaqueRed
        descriptionLabel.font = Core.shared.stylesheet.getFont(name: .RobotoRegular, size: 17)
        descriptionLabel.textColor = Core.shared.stylesheet.white
        descriptionLabel.textAlignment = .center
        
        separatorView.backgroundColor = Core.shared.stylesheet.middleGray
        separatorView.layer.masksToBounds = false
        separatorView.clipsToBounds = false
        addSubview(descriptionLabel)
        addSubview(separatorView)
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    func isEndSection(){
        separatorView.backgroundColor = Core.shared.stylesheet.clear
        separatorView = ShadowView(frame: .zero)
        addSubview(separatorView)
        separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(snp.bottom).inset(1)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(snp.bottom)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    
}

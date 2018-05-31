//
//  SettingsView.swift
//  JuTranslate
//
//  Created by Julian Lima on 31/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    var optionsTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Core.shared.stylesheet.midLightGray
        setupSavedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSavedView(){
        
        let viewUpperBar = NavigationCustomBar(type: .SettingsNavigationBar)
        
        optionsTableView = UITableView(frame: bounds, style: .grouped)
        optionsTableView.backgroundColor = Core.shared.stylesheet.midLightGray
        optionsTableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "cellid")
        optionsTableView.register(ClearHistoryTableViewCell.self, forCellReuseIdentifier: "clearid")
        optionsTableView.isScrollEnabled = false
        optionsTableView.separatorStyle = .none
        optionsTableView.sectionHeaderHeight = 10
        optionsTableView.sectionFooterHeight = 0.1
        addSubview(viewUpperBar)
        addSubview(optionsTableView)
        
        viewUpperBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(90)
        }
        
        optionsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(viewUpperBar.snp.bottom)
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
    
}

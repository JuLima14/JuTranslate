//
//  HomeView.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    public var cardsCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setupHomeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupHomeView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.layer.frame.width - 20, height: 70)
        self.cardsCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.cardsCollectionView.backgroundColor = Core.shared.stylesheet.midLightGray
        self.cardsCollectionView.register(CardCell.self, forCellWithReuseIdentifier: "cellid")
        
        let viewUpperBar = NavigationCustomBar(type: .HomeNavigationBar)
        let viewSelectorLanguage = ViewSelectorLanguage(frame: CGRect.zero)
        let textToTranslate = CustomTextField(frame: CGRect.zero)
        let viewOptionButtons = ViewOptionButtons(frame: CGRect.zero)
        
        self.addSubview(viewUpperBar)
        self.addSubview(viewSelectorLanguage)
        self.addSubview(textToTranslate)
        self.addSubview(viewOptionButtons)
        self.addSubview(self.cardsCollectionView)
        
        
        viewUpperBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        
        viewSelectorLanguage.snp.makeConstraints { (make) in
            make.top.equalTo(viewUpperBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        textToTranslate.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(viewSelectorLanguage.snp.bottom).offset(1)
            make.height.equalTo(120)
        }
        viewOptionButtons.snp.makeConstraints { (make) in
            make.top.equalTo(textToTranslate.snp.bottom)
            make.right.left.equalToSuperview()
            make.height.equalTo(50)
        }
        self.cardsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(viewOptionButtons.snp.bottom).offset(1)
            make.left.right.bottom.equalToSuperview()
        }
    }
}


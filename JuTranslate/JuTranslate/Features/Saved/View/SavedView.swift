//
//  SavedView.swift
//  JuTranslate
//
//  Created by Julian Lima on 31/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class SavedView: UIView {
    
    public var cardsCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        setupSavedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSavedView(){
        
        let viewUpperBar = NavigationCustomBar(type: .SavedNavigationBar)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: layer.frame.width - 20, height: 70)
        
        cardsCollectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout)
        cardsCollectionView.backgroundColor = Core.shared.stylesheet.lightGray
        cardsCollectionView.register(CardCell.self, forCellWithReuseIdentifier: "cellid")
        
        
        addSubview(viewUpperBar)
        addSubview(cardsCollectionView)
        
        
        viewUpperBar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(90)
        }
        
        cardsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(viewUpperBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
}


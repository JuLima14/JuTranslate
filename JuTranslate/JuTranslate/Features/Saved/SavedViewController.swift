//
//  SavedViewController.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate  {
    
    var savedView: SavedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedView = SavedView(frame: view.frame)
        view.addSubview(savedView)
        
        savedView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        savedView.cardsCollectionView.delegate = self
        savedView.cardsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = savedView.cardsCollectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! CardCell
        return cell
    }
    func collectionview(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtPathIndex indexPath: NSIndexPath) -> CGSize{
        return CGSize(width: view.frame.width, height: 120)
    }
    
}


//
//  HomeViewController.swift
//  JuTranslate
//
//  Created by Julian Lima on 30/5/18.
//  Copyright © 2018 Julian Lima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    
    var homeView: HomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView = HomeView(frame: view.frame)
        view.addSubview(homeView)
        homeView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        homeView.cardsCollectionView.delegate = self
        homeView.cardsCollectionView.dataSource = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.cardsCollectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! CardCell
        return cell
    }
    func collectionview(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtPathIndex indexPath: NSIndexPath) -> CGSize{
        return CGSize(width: view.frame.width, height: 120)
    }
}

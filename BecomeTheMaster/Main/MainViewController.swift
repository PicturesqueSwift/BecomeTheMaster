//
//  MainViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/19.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseAuth
import FirebaseFirestore

class MainViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridButton: UIBarButtonItem!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        buttonBind()
        
    }
    
}

extension MainViewController {
    
    func buttonBind () {
        gridButton.rx.tap
            .throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.flag = !self.flag
                self.collectionView.reloadData()
            }).disposed(by: disposeBag)
        
        filterButton.rx.tap
            .throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                let viewController = MainFilterViewController.viewController()
                viewController.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(viewController, animated: true)
            }).disposed(by: disposeBag)
        
        
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if flag {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainHorizontalCell", for: indexPath) as! MainHorizontalCell
            cell.updateCell()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainFullCell", for: indexPath) as! MainFullCell
            cell.updateCell()
            return cell
        }
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    //Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if flag {
            let appWidth = APP_WIDTH() - 16
            return CGSize(width: appWidth, height: 100)
        } else {
            let appWidth = APP_WIDTH() - 16
            return CGSize(width: appWidth, height: appWidth)
        }
    }
    
    //CollectionView Inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let sideSpace = (36 * APP_WIDTH()) / 414
//        return UIEdgeInsets(top: 26, left: sideSpace, bottom: 32, right: sideSpace)
        let space: CGFloat = 8
        return UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    }
    
    //Top & Bottom Margin Between Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    //Side Margin Between Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
}

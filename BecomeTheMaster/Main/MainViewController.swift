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

class MainViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridButton: UIBarButtonItem!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
//    let auth = Auth.auth()
    
    var width: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        width = self.view.frame.width
        collectionView.reloadData()
        buttonBind()
        
//        auth.rx.createUser(withEmail: "test", password: "test")
//            .flatMap { (result) -> Observable<String> in
//                guard let url = result.user.photoURL else { return Observable.empty() }
//                let data = try Data(contentsOf: url)
//                guard let image = UIImage(data: data) else { return Observable.empty() }
//                return Storage.storage().rx.uploadProfileImage(profileImage: image)
//            }.subscribe(onNext: { (profileURL) in
//                print(profileURL)
//            }, onError: { (err) in
//                print(err)
//            }).disposed(by: disposeBag)
        
    }

}

extension MainViewController {
    func buttonBind () {
        gridButton.rx.tap
            .throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.width = self.view.frame.width == self.width ? (self.width / 2) - 1 : self.view.frame.width
                self.collectionView.reloadData()
            }).disposed(by: disposeBag)
        
        filterButton.rx.tap
            .throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.width = self.view.frame.width == self.width ? (self.width / 2) - 1 : self.view.frame.width
                self.collectionView.reloadData()
                
            }).disposed(by: disposeBag)
        
        
        
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    //Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let collectionViewCellWidth = collectionView.frame.width
        
        return CGSize(width: width, height: width)
    }
    
    //Top & Bottom Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    //Side Margin
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
}

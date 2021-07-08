//
//  BaseViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/26.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController, ViewControllerFromStoryboard {

    lazy var scrollContentOffset: PublishSubject<CGPoint> = PublishSubject()
    lazy var scrollIsEndDrag: PublishSubject<Bool> = PublishSubject()
    
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializedNavigation()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit{ DEBUG_LOG(String(describing: self)) }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    private func initializedNavigation() {
        self.navigationController?.navigationItem.title = "청출어람"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 17),
                                                                        .foregroundColor: UIColor.signatureNWhite]
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteNBlack
        self.navigationController?.navigationBar.tintColor = UIColor.signatureNWhite
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
}

extension BaseViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollContentOffset.onNext(scrollView.contentOffset)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollIsEndDrag.onNext(true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollIsEndDrag.onNext(true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollIsEndDrag.onNext(false)
    }
    
}

extension Reactive where Base: BaseViewController {
    func showBasicAlert(title: String = "", message: String = "") -> Observable<Bool> {
        return Observable.create { obs in
            let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: "확인", style: .default) { action in
                obs.onNext(true)
                obs.onCompleted()
            }
            
            let cancelAction = UIAlertAction.init(title: "취소", style: .cancel) { (action) in
                obs.onNext(false)
                obs.onCompleted()
            }
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self.base.present(alert, animated: true, completion: nil)
            
            return Disposables.create()
        }
    }
}

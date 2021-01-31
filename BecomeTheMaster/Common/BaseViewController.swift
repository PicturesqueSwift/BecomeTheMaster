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
}

extension BaseViewController: UIGestureRecognizerDelegate {
    private func initializedNavigation() {
        self.navigationController?.navigationItem.title = "청출어람"
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 17),
                                                                        .foregroundColor: UIColor.init(named: "SignatureNWhite")!]
        self.navigationController?.navigationBar.barTintColor = UIColor.init(named: "WhiteNBlack")
        self.navigationController?.navigationBar.tintColor = UIColor.init(named: "SignatureNWhite")
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
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

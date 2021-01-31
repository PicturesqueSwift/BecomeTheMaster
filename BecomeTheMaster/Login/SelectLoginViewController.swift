//
//  SelectLoginViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/27.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import UIKit
import RxSwift
import ReactorKit

class SelectLoginViewController: BaseViewController {

    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var kakaoTalkButton: UIButton!
    @IBOutlet weak var naverButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var emailSignUpButton: UIButton!
    @IBOutlet weak var lookAroundButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializedConfigure()
        buttonBind()
    }

    static func viewController(_ closeIsHidden: Bool) -> SelectLoginViewController {
        let viewController = SelectLoginViewController.viewController("Login")
        viewController.closeButton.isEnabled = !closeIsHidden
        viewController.closeButton.image = closeIsHidden ? nil : UIImage(named: "Navi_Close")
        return viewController
    }
}

extension SelectLoginViewController {
    private func buttonBind() {
        lookAroundButton.rx.tap
            .flatMap { _ in return self.rx.showBasicAlert(title: "둘러보시겠습니까?") }
            .filter { $0 }
            .subscribe(onNext: { _ in
                self.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
        
        closeButton.rx.tap
            .subscribe(onNext: { _ in
                self.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
            
    }
}

extension SelectLoginViewController {
    func initializedConfigure() {
        googleButton.layer.addBasicBorder(color: UIColor(named: "BlackNWhite")!, width: 1, cornerRadius: 5)
        kakaoTalkButton.layer.cornerRadius = 5
        naverButton.layer.cornerRadius = 5
        facebookButton.layer.cornerRadius = 5
        appleButton.layer.addBasicBorder(color: UIColor(named: "BlackNWhite")!, width: 1, cornerRadius: 5)
    }
}

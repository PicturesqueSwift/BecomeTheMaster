//
//  LoginViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/26.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import UIKit
import RxSwift
import Toaster

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializedConfigure()
        bind()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let color = UIColor(named: "SignatureNWhite") {
            emailTextField.layer.borderColor = color.cgColor
            pwdTextField.layer.borderColor = color.cgColor
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LoginViewController {
    private func bind() {
        
        loginButton.rx.tap
            .withLatestFrom(emailTextField.rx.text.orEmpty)
            .withLatestFrom(pwdTextField.rx.text.orEmpty) {($0,$1)}
            .flatMap { (email, password) -> Observable<Bool> in
                return FirebaseManager.shared.auth.rx.signIn(email: email, password: password)
            }.filter { $0 }
            .subscribe(onNext: { [weak self] _ in
                self?.presentingViewController?.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
        
    }
    
    private func initializedConfigure() {
        emailTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        pwdTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        loginButton.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
    }
}

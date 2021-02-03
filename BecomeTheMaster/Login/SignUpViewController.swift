//
//  SignUpViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/29.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import UIKit
import RxSwift
import ReactorKit

class SignUpViewController: BaseViewController, StoryboardView {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailAlertLabel: PaddingLabel!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var pwdAlertLabel: PaddingLabel!
    @IBOutlet weak var pwdCheckTextField: UITextField!
    @IBOutlet weak var pwdCheckAlertLabel: PaddingLabel!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var nickNameAlertLabel: PaddingLabel!
    
    
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializedConfigure()
        reactorBind()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension SignUpViewController {
    
    func bind(reactor: SignUpReactor) {
        
        reactor.state // 이메일
            .do(onNext: { [weak self] _ in self?.emailAlertLabel.isHidden = !reactor.isEmailAlert })
            .filter { _ in reactor.isEmailAlert }
            .map { $0.emailAlertText }
            .bind(to: emailAlertLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state // 닉네임
            .do(onNext: { [weak self] _ in self?.nickNameAlertLabel.isHidden = !reactor.isNickNameAlert })
            .filter { _ in reactor.isNickNameAlert }
            .map { $0.nicknameAlertText }
            .bind(to: nickNameAlertLabel.rx.text)
            .disposed(by: disposeBag)
            
            
    }
    
    private func reactorBind() {
        guard let reactor = reactor else { return }
        
        emailTextField.rx.text.orEmpty
            .map { Reactor.Action.emailEdited($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        pwdTextField.rx.text.orEmpty
            .map { Reactor.Action.pwdEdited($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        pwdCheckTextField.rx.text.orEmpty
            .map { Reactor.Action.pwdCheckEdited($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        nickNameTextField.rx.controlEvent(.editingDidEnd)
            .withLatestFrom(nickNameTextField.rx.text.orEmpty)
            .map { Reactor.Action.nicknameEdited($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
}

extension SignUpViewController {
    private func initializedConfigure() {
        self.reactor = SignUpReactor()
        completeButton.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        emailTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        pwdTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        pwdCheckTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        nickNameTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        profileImage.layer.addBasicBorder(color: UIColor.colorFromRGB(0x4b6293, alpha: 0.2), width: 2, cornerRadius: 27)
        
    }
}

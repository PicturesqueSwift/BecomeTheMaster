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
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var pwdCheckTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    
    @IBOutlet weak var emailCancelButton: UIButton!
    @IBOutlet weak var pwdCancelButton: UIButton!
    @IBOutlet weak var pwdCheckCancelButton: UIButton!
    @IBOutlet weak var nickNameCancelButton: UIButton!
    
    @IBOutlet weak var completeButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializedConfigure()
        textFieldBind()
        buttonBind()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension SignUpViewController {
    
    func bind(reactor: SignUpReactor) {
        
    }
    
    private func textFieldBind() {
        emailTextField.rx.text.orEmpty
            .do(onNext: { [weak self] text in
                self?.emailCancelButton.isHidden = text.isEmpty
            }).subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        pwdTextField.rx.text.orEmpty
            .do(onNext: { [weak self] text in
                self?.pwdCancelButton.isHidden = text.isEmpty
            }).subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        pwdCheckTextField.rx.text.orEmpty
            .do(onNext: { [weak self] text in
                self?.pwdCheckCancelButton.isHidden = text.isEmpty
            }).subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        nickNameTextField.rx.text.orEmpty
            .do(onNext: { [weak self] text in
                self?.nickNameCancelButton.isHidden = text.isEmpty
            }).subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
    }
    
    private func buttonBind() {
        emailCancelButton.rx.tap
            .do(onNext: { [weak self] _ in
                self?.emailCancelButton.isHidden = true
            })
            .map{ _ in return "" }
            .asDriver(onErrorJustReturn: "")
            .drive(emailTextField.rx.text)
            .disposed(by: disposeBag)
        
        pwdCancelButton.rx.tap
            .map{ _ in return "" }
            .asDriver(onErrorJustReturn: "")
            .drive(pwdTextField.rx.text)
            .disposed(by: disposeBag)
        
        pwdCheckCancelButton.rx.tap
            .map{ _ in return "" }
            .asDriver(onErrorJustReturn: "")
            .drive(pwdCheckTextField.rx.text)
            .disposed(by: disposeBag)
        
        nickNameCancelButton.rx.tap
            .map{ _ in return "" }
            .asDriver(onErrorJustReturn: "")
            .drive(nickNameTextField.rx.text)
            .disposed(by: disposeBag)
    }
}

extension SignUpViewController {
    private func initializedConfigure() {
        self.reactor = SignUpReactor()
        completeButton.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
    }
}

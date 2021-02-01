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
            .subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        pwdTextField.rx.text.orEmpty
            .subscribe(onNext: { text in

            }).disposed(by: disposeBag)
        
        pwdCheckTextField.rx.text.orEmpty
            .subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        nickNameTextField.rx.text.orEmpty
            .subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
    }
    
    private func buttonBind() {
        
    }
}

extension SignUpViewController {
    private func initializedConfigure() {
        self.reactor = SignUpReactor()
        completeButton.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
    }
}

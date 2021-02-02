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
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var pwdCheckTextField: UITextField!
    @IBOutlet weak var pwdCheckLabel: UILabel!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    @IBOutlet weak var completeButton: UIButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializedConfigure()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension SignUpViewController {
    
    func bind(reactor: SignUpReactor) {
        emailTextField.rx.text.orEmpty
            .subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        pwdTextField.rx.text.orEmpty
            .subscribe(onNext: { text in

            }).disposed(by: disposeBag)
        
        pwdCheckTextField.rx.text.orEmpty
            .subscribe(onNext: { text in
                
            }).disposed(by: disposeBag)
        
        nickNameTextField.rx.controlEvent(.editingDidEnd)
            .withLatestFrom(nickNameTextField.rx.text)
            .subscribe(onNext: { text in
                DEBUG_LOG("Nickname editing is end: \(text)")
            }).disposed(by: disposeBag)


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

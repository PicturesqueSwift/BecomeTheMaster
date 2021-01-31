//
//  LoginViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/26.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializedConfigure()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension LoginViewController {
    func initializedConfigure() {
        emailTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        pwdTextField.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
        loginButton.layer.addBasicBorder(color: UIColor(named: "SignatureNWhite")!, width: 0.5, cornerRadius: 5)
    }
}

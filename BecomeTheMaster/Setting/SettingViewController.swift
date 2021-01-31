//
//  SettingViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/19.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTest(_ sender: Any) {
        let viewContoller = SelectLoginViewController.viewController(false).wrapViewController
        viewContoller.modalPresentationStyle = .fullScreen
        self.present(viewContoller, animated: true, completion: nil)
    }
    
}

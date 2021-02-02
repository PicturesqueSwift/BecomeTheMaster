//
//  TabBarController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/25.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTabBar.unselectedItemTintColor = UIColor(named: "SignatureNWhite")
        
        DispatchQueue.main.async { // wait until MainTabBarController is inside UI
            let viewContoller = SelectLoginViewController.viewController(true).wrapViewController
            viewContoller.modalPresentationStyle = .fullScreen
            self.present(viewContoller, animated: true, completion: nil)
        }
        
    }
    
}

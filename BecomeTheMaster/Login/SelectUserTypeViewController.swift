//
//  SelectUserTypeViewController.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/28.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import UIKit

class SelectUserTypeViewController: BaseViewController {

    @IBOutlet weak var mentorButton: UIButton!
    @IBOutlet weak var menteeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

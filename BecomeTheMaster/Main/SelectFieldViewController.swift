//
//  SelectFieldViewController.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/06/10.
//

import UIKit

class SelectFieldViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let fieldCategory = CategoryField.allCases
    let fieldSubcategory = CategoryField.allCases.map { $0.subcategory }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DEBUG_LOG(fieldCategory.count)
        
        for field in fieldCategory {
            DEBUG_LOG("\(field.rawValue) : \(field.subcategory[0])")
        }
        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

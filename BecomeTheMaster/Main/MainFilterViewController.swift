//
//  MainFilterViewController.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/02/19.
//

import UIKit
import Cosmos

class MainFilterViewController: BaseViewController {

    @IBOutlet weak var starRatingView: CosmosView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func viewController() -> MainFilterViewController {
        let viewController = MainFilterViewController.viewController("Main")
        return viewController
    }
    
}

extension MainFilterViewController {
    private func configureInit() {
        
    }
}

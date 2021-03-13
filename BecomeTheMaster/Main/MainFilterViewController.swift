//
//  MainFilterViewController.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/02/19.
//

import UIKit
import RxSwift
import RxCocoa

class MainFilterViewController: BaseViewController {

    @IBOutlet weak var starRateView: StarRatingView!
    @IBOutlet weak var progressBar: UISlider!
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changedSliderValue(_ sender: UISlider) {
        starRateView.rating = Double(progressBar.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInit()
    }
    
    static func viewController() -> MainFilterViewController {
        let viewController = MainFilterViewController.viewController("Main")
        return viewController
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
}

extension MainFilterViewController {
    private func configureInit() {
        starRateView.rx.tap
    }
    
}


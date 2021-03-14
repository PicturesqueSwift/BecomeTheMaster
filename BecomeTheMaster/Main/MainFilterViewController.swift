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
    @IBOutlet weak var locationUpdateButton: UIButton!
    @IBOutlet weak var locationUpdateLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changedSliderValue(_ sender: UISlider) {
        starRateView.rating = Double(progressBar.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInit()
        bind()
    }
    
    static func viewController() -> MainFilterViewController {
        let viewController = MainFilterViewController.viewController("Main")
        return viewController
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func bind() {
        locationUpdateButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.locationUpdateLabel.isHidden = !self.locationUpdateLabel.isHidden
            }).disposed(by: disposeBag)
    }
    
}

extension MainFilterViewController {
    private func configureInit() {
        
    }
    
}


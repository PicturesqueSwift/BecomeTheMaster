//
//  MainCell.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/26.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureInit()
    }
    
}

extension MainCell {
    func configureInit() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}

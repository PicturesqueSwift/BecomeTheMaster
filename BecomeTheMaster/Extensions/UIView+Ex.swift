//
//  UIView+Ex.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/04/01.
//

import Foundation
import UIKit

extension UIView {
    func anchor4Direct(child: UIView, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) {
        
        child.translatesAutoresizingMaskIntoConstraints = false
        
        if let topConst = top {
            child.topAnchor.constraint(equalTo: self.topAnchor, constant: topConst).isActive = true
        }
        
        if let leftConst = left {
            child.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leftConst).isActive = true
        }
        
        if let bottomConst = bottom {
            child.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottomConst).isActive = true
        }
        
        if let rightConst = right {
            child.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: rightConst).isActive = true
        }
        
    }
}

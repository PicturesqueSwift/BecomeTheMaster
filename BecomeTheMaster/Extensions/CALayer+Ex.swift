//
//  CALayer+Ex.swift
//  BecomeTheMaster
//
//  Created by Picturesque on 2021/01/31.
//

import Foundation
import UIKit

extension CALayer {
    public func addBasicBorder(color: UIColor, width: CGFloat = 1, cornerRadius: CGFloat = 0) {
        self.borderWidth = width
        self.borderColor = color.cgColor
        self.cornerRadius = cornerRadius
    }
    
    public func addEachBoader(_ edge: [UIRectEdge], color: UIColor, width: CGFloat = 1) {
        edge.forEach {
            let border = CALayer()
            
            switch $0 {
            case .all:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
                border.backgroundColor = color.cgColor
                self.addSublayer(border)
                return
            
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
                
            case .bottom:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
                
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
                
            case .right:
                border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width)
                
            default:
                border.frame = CGRect.zero
            }
            
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}

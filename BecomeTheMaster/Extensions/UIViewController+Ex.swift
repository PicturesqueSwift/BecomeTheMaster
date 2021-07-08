//
//  UIViewController+Ex.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/26.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var wrapViewController: UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    func viewWithLabel(message: String, height: CGFloat = 30, textAlignment: NSTextAlignment = .center,
                       textColor: UIColor = .blackNWhite, textFont: UIFont = .systemFont(ofSize: 16, weight: UIFont.Weight.regular)) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: APP_WIDTH(), height: height))
        
        let label = UILabel()
        label.textAlignment = textAlignment
        label.text = message
        label.textColor = textColor
        label.font = textFont
        
        view.addSubview(label)
        
        view.anchor4Direct(child: label, top: 0, left: 0, bottom: 0, right: 0)
        
        return view
    }
    
}

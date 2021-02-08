//
//  UIColor+Ex.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/07/26.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    static func colorFromRGB(_ rgbValue: UInt, alpha : CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0xFF) / 255.0, alpha: alpha)
    }
}

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
    static func colorFromHex(_ hex: UInt, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((hex & 0xFF00) >> 8) / 255.0,
                       blue: CGFloat(hex & 0xFF) / 255.0, alpha: alpha)
    }
}

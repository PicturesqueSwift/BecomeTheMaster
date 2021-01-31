//
//  UIApplication+Ex.swift
//  BecomeTheMaster
//
//  Created by Loho on 2020/08/02.
//  Copyright © 2020 Loho. All rights reserved.
//

import UIKit
import Foundation

extension UIApplication {

    static func isNetworkActivityIndicator(_ onOff: Bool) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = onOff
        }
    }
    
}

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
}

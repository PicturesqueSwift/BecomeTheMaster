//
//  ViewControllerFromStoryboard.swift
//  BecomeTheMaster
//
//  Created by Loho on 2021/01/26.
//  Copyright © 2021 Picturesque. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerFromStoryboard { }

extension ViewControllerFromStoryboard where Self: UIViewController {
    static func viewController(_ storyboardName: String) -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: nil)
                .instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self else { return Self() }
        return viewController
    }
}

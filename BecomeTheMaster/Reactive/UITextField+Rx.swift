//
//  UITextField+Rx.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/02/01.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITextField {

    var textEditing: Binder<Void> {
        return Binder(base) { textField, _ in
            textField.text = ""
            textField.sendActions(for: .valueChanged)
        }
    }
}

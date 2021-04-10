//
//  Double+Ex.swift
//  BecomeTheMaster
//
//  Created by 이정호 on 2021/03/30.
//

import Foundation

extension Double {
    var degreeToRadians: Double {
        return self * .pi / 180
    }
    
    var radiansToDegree: Double {
        return self * 180 / .pi
    }
}

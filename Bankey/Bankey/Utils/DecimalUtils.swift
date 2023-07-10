//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Steve Moody on 7/6/23.
//

import Foundation
extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}

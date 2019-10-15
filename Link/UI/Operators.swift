//
//  Operators.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

infix operator <-;

infix operator ≠;

public func ≠(first: AnyObject, second: AnyObject) -> Bool {
    return !first.isEqual(second)
}

public func bind(_ lower: CGFloat, _ upper: CGFloat, _ val: CGFloat) -> CGFloat {
    return min(max(lower, val), upper)
}


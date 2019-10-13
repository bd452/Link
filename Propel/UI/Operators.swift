//
//  Operators.swift
//  Propel
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




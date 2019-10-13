//
//  CGPoint+Modifiers.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public typealias Point = CGPoint

public extension Point {
    func modify(x: CGFloat = 0, y: CGFloat = 0) -> Point {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}

public func + (first: Point, second: Point) -> Point {
    return first.modify(x: second.x, y: second.y)
}
public func += (first: inout Point, second: Point) {
    first.x += second.x
    first.y += second.y
}

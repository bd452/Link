//
//  CGSize+Modifiers.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public typealias Size = CGSize

public extension Size {
    func modify(width: CGFloat = 0, height: CGFloat = 0) -> Size {
        return Size(width: self.width + width, height: self.height + height)
    }
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
}

extension Size: Propel {}

public func + (first: Size, second: Size) -> Size {
    return first.modify(width: second.width, height: second.height)
}
public func += (first: inout Size, second: Size) {
    first.width += second.width
    first.height += second.height
}

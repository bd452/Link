//
//  CGRect+Modifiers.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public typealias Rect = CGRect

public extension Rect {
    func modify(x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> Rect {
        return Rect(x: self.minX + x, y: self.minY + y, width: self.width + width, height: self.height + height)
    }
    mutating func mutate(x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
        self = self.modify(x: 0, y: y, width: width, height: height)
    }
    func dOrigin(_ origin: Point) -> Rect {
        var r = self
        r.origin += origin
        return r
    }
    func dSize(_ size: Size) -> Rect {
        var r = self
        r.size += size
        return r
    }
    func dX(_ x: CGFloat) -> Rect {
        var r = self
        r.origin.x += x
        return r
    }
    func dY(_ y: CGFloat) -> Rect {
        var r = self
        r.origin.y += y
        return r
    }
    func dW(_ width: CGFloat) -> Rect {
        var r = self
        r.size.width += width
        return r
    }
    func dH(_ height: CGFloat) -> Rect {
        var r = self
        r.size.height += height
        return r
    }
    func change(x: CGFloat? = nil, y: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) -> Rect {
        return Rect(x: x ?? self.maxX, y: y ?? self.maxY, width: width ?? self.width, height: height ?? self.height)
    }
    func origin(_ origin: Point) -> Rect {
        var r = self
        r.origin = origin
        return r
    }
    func size(_ size: Size) -> Rect {
        var r = self
        r.size = size
        return r
    }
    func x(_ x: CGFloat) -> Rect {
        var r = self
        r.origin.x = x
        return r
    }
    func y(_ y: CGFloat) -> Rect {
        var r = self
        r.origin.y = y
        return r
    }
    func width(_ width: CGFloat) -> Rect {
        var r = self
        r.size.width = width
        return r
    }
    func height(_ height: CGFloat) -> Rect {
        var r = self
        r.size.height = height
        return r
    }

}

extension Rect: Link {}

public func + (first: Rect, second: Rect) -> Rect {
    return first.modify(x: second.maxX, y: second.maxY, width: second.width, height: second.height)
}
public func += (first: inout Rect, second: Rect) {
    first = first.modify(x: second.maxX, y: second.maxY, width: second.width, height: second.height)
}

public func <- (rect: inout Rect, modifiers: (x: CGFloat?, y: CGFloat?, width: CGFloat?, height: CGFloat?)) {
    rect = rect.change(x: modifiers.x, y: modifiers.y, width: modifiers.width, height: modifiers.height)
}
public func <- (rect: inout Rect, size: Size) {
    rect = rect.size(size)
}
public func <- (rect: inout Rect, origin: Point) {
    rect = rect.origin(origin)
}
public func <- (rect: inout Rect, modifiers: (origin: CGPoint?, size: CGSize?)) {
    rect.size = modifiers.size ?? rect.size
    rect.origin = modifiers.origin ?? rect.origin
}

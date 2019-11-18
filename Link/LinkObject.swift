//
//  PropelObject.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/13/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public protocol Link {
    init()
}

private var k: Void?

public extension NSObject {
    func set<T>(_ value: T, for key: String) {
        if let pointer = UnsafeRawPointer(bitPattern: key.hashValue) {
            objc_setAssociatedObject(self, pointer, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func get<T>(_ key: String) -> T? {
        if let pointer = UnsafeRawPointer(bitPattern: key.hashValue) {
            return objc_getAssociatedObject(self, pointer) as? T
        } else {
            return nil
        }
    }
}

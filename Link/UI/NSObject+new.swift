//
//  NSObject+new.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

//public func create<type>(_ type: AnyObject.Type, _ constructor: (type)->Void) -> type {
//    let this = type.init() as! type
//    constructor(this)
//    return this
//}

protocol Mutable {
    func mutate(_ mutation: (NSObject) -> Void) -> Self
    func mutate<T>(_ type: T.Type, _ property: String, _ mutation: (T) -> T) -> Self
}

public extension NSObject {

    func mutate(_ mutation: (NSObject) -> Void) -> Self {
        mutation(self)
        return self
    }
    func mutate<T>(_ type: T.Type, _ property: String, _ mutation: (T) -> T) -> Self {
        let prop = self.value(forKeyPath: property) as! T
        self.setValue(mutation(prop), forKeyPath: property)
        return self
    }
    func mutate<T>(_ type: T.Type, _ property: String, _ mutation: (T) -> Void) -> Self {
        let prop = self.value(forKeyPath: property) as! T
        mutation(prop)
        return self
    }
    convenience init(with: (NSObject) -> Void) {
        self.init()
        with(self)
    }
}

extension NSObject: Link, Mutable {}

//
//  PropelObject.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/13/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation
import ObjectiveC

public typealias CustomClass = NSObject

public extension CustomClass {
    
    static func new<T: CustomClass>(_ className: String) -> T.Type? {
        if let new = objc_allocateClassPair(self, className, 0) as? T.Type {
            return new
        }
        else {
            return nil
        }
    }
    @discardableResult static func `func`(_ methodName: Selector, _ block: @escaping @convention(block) (Any?)->Any?) -> CustomClass.Type {
        let imp = imp_implementationWithBlock(block)
        let types = "@:@:@:@"
        class_replaceMethod(Self.self, methodName, imp, types)
        return self
    }
    @discardableResult static func prop(_ name: String, attributes: [objc_property_attribute_t]) -> CustomClass.Type {
        class_replaceProperty(Self.self, name, attributes, UInt32(attributes.count))
        return self
    }
}

public protocol Link {
    init()
}

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
    static func hook(selector: Selector, implementation: @escaping @convention(block) (Any)->Any?) {
        guard let meth = class_getInstanceMethod(self, selector) else {return}
        let typeEncoding = method_getTypeEncoding(meth)
        let imp = imp_implementationWithBlock(implementation)
        class_replaceMethod(self, selector, imp, typeEncoding)
    }
    static func hook(selector: Selector, implementation: @escaping @convention(block) (Any, Any)->Any?) {
        guard let meth = class_getInstanceMethod(self, selector) else {return}
        let typeEncoding = method_getTypeEncoding(meth)
        let imp = imp_implementationWithBlock(implementation)
        class_replaceMethod(self, selector, imp, typeEncoding)
    }
    static func hook(selector: Selector, implementation: @escaping @convention(block) (Any, Any, Any)->Any?) {
        guard let meth = class_getInstanceMethod(self, selector) else {return}
        let typeEncoding = method_getTypeEncoding(meth)
        let imp = imp_implementationWithBlock(implementation)
        class_replaceMethod(self, selector, imp, typeEncoding)
    }
    static func hook(selector: Selector, implementation: @escaping @convention(block) (Any, Any, Any, Any)->Any?) {
        guard let meth = class_getInstanceMethod(self, selector) else {return}
        let typeEncoding = method_getTypeEncoding(meth)
        let imp = imp_implementationWithBlock(implementation)
        class_replaceMethod(self, selector, imp, typeEncoding)
    }
    static func hook(selector: Selector, implementation: @escaping @convention(block) (Any, Any, Any, Any, Any)->Any?) {
        guard let meth = class_getInstanceMethod(self, selector) else {return}
        let typeEncoding = method_getTypeEncoding(meth)
        let imp = imp_implementationWithBlock(implementation)
        class_replaceMethod(self, selector, imp, typeEncoding)
    }
}

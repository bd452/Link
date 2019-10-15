//
//  Constructor.swift
//  Link
//
//  Created by Bryce Dougherty on 10/13/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit



public class Constructor<type: Link> {
    
    public typealias construction = (type) -> Void
    public typealias constructor = () -> type
    
    private var myConstruction: construction?
    private var myInstanceGenerator: constructor?
    
    public init() {
        
    }
    public convenience init(_ generator: @escaping @autoclosure () -> type, _ construction: construction? = nil) {
        self.init()
        self.myInstanceGenerator = generator
        self.myConstruction = construction
    }
    
    public convenience init(_ construction: @escaping construction) {
        self.init()
        self.myConstruction = construction
    }
    
    public var construct: constructor {
        return {
            let newInstance = self.myInstanceGenerator == nil ? type.init() : self.myInstanceGenerator!()
            self.myConstruction?(newInstance)
            return newInstance
        }
    }
    
    public class func construct(_ construction: @escaping construction) -> constructor {
        return {
            let newInstance = type.init()
            construction(newInstance)
            return newInstance
        }
    }
    public class func generate(_ generator: @escaping @autoclosure () -> type, _ construction: construction? = nil) -> constructor {
        return {
            let newInstance = generator()
            construction?(newInstance)
            return newInstance
        }
    }
}

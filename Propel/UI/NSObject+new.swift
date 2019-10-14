//
//  NSObject+new.swift
//  Propel
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

public extension NSObject {
    
    func mutate(_ mutation: (NSObject)->Void) -> Self {
        mutation(self)
        return self
    }
    
    convenience init(with: (NSObject) -> Void) {
        self.init()
        with(self)
    }
}

extension NSObject: Propel {}

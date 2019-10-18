//
//  UIGestureRecognizer+Closures.swift
//  MCommerceApp
//
//  Created by BRYCE P DOUGHERTY on 10/11/19.
//  Copyright © 2019 Catalina Marketing. All rights reserved.
//

import Foundation


public typealias SelClosure = (Any?) -> Void

public class AutoSelector {
    var target: () -> Void
    public var `do`: Selector {
        #selector(self.action)
    }
    public init(_ target: @escaping () -> Void) {
        self.target = target
    }
    public init(_ action: @autoclosure @escaping () -> Void) {
        self.target = action
    }
    @objc private func action() {
        self.target()
    }
}

public extension UIGestureRecognizer {
    convenience init(action: @autoclosure @escaping () -> Void) {
        let delegate = AutoSelector(action)
        self.init(target: delegate, action: delegate.do)
    }
    func addAction(action:@autoclosure @escaping ()->Void) {
        self.addAction(action: action)
    }
    func addAction(action:@escaping () -> Void) {
        let delegate = AutoSelector(action)
        self.addTarget(delegate, action: delegate.do)
    }
}

//
//  UIGestureRecognizer+Closures.swift
//  MCommerceApp
//
//  Created by BRYCE P DOUGHERTY on 10/11/19.
//  Copyright © 2019 Catalina Marketing. All rights reserved.
//

import Foundation

@objc public class ActionSelector: NSObject {
    var targetClosure: (UIView?) -> Void
    init(_ targetClosure: @escaping (UIView?) -> Void) {
        self.targetClosure = targetClosure
    }
    @objc func action(sender: UIView? = nil) {
        if sender != nil {
            self.targetClosure(sender)
        } else {
            self.targetClosure(nil)
        }
    }
    @objc public let selector = #selector(action(sender:))
//    @objc public let selector:Selector = {
//        #selector(action(sender:))
//    }()
}

public extension UIGestureRecognizer {
    convenience init(action: @escaping (UIView?) -> Void) {
        let delegate = ActionSelector(action)
        self.init(target: delegate, action: delegate.selector)
        set(delegate, for: "action")
    }
    func addAction(action: @escaping (UIView?) -> Void) {
        let delegate = ActionSelector(action)
        self.addTarget(delegate, action: delegate.selector)
        set(delegate, for: "action")
    }
}

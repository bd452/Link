//
//  UIGestureRecognizer+Closures.swift
//  MCommerceApp
//
//  Created by BRYCE P DOUGHERTY on 10/11/19.
//  Copyright © 2019 Catalina Marketing. All rights reserved.
//

import Foundation

public class ActionSelector {
    var targetClosure: (UIView?) -> Void
    init(_ targetClosure: @escaping (UIView?) -> Void) {
        self.targetClosure = targetClosure
    }
    @objc func action(sender: UIView? = nil) {
        if sender != nil {
            self.targetClosure(sender)
        }
        else {
            self.targetClosure(nil)
        }
    }
}

public extension UIGestureRecognizer {
    convenience init(action: @escaping (UIView?) -> Void) {
        let delegate = ActionSelector(action)
        self.init(target: delegate, action: #selector(ActionSelector.action(sender:)))
    }
    func addAction(action: @escaping (UIView?) -> Void) {
        let delegate = ActionSelector(action)
        self.addTarget(delegate, action: #selector(ActionSelector.action(sender:)))
    }
}

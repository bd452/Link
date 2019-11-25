//
//  Animation.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

public typealias Layer = CALayer

public extension Layer {
    func cornerRadius(_ radius: CGFloat) -> Self {
        self.cornerRadius = radius
        return self
    }
    
    func animate(property: String, from: Any, to: Any, duration: TimeInterval, timingFunction: CAMediaTimingFunction, completion: (()->Void)? = nil) {
        CATransaction.begin()
        let animation = CABasicAnimation(keyPath: property)
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        animation.timingFunction = timingFunction
        animation.isRemovedOnCompletion = true
        CATransaction.setCompletionBlock(completion)
        self.add(animation, forKey: self.description+property)
        CATransaction.commit()
    }
}


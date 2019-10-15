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
}

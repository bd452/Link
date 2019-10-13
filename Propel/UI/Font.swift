//
//  Font.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

public typealias Font = UIFont

public extension Font {
    convenience init?(_ named: String, _ ofSize: CGFloat = 14) {
        self.init(name: named, size: ofSize)
    }
}

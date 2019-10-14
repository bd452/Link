//
//  UILabel+Modifiers.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public typealias Label = UILabel

public extension Label {
    func color(_ color: Color) -> Self {
        self.textColor = color
        return self
    }
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    func font(_ font: Font?) -> Self {
        self.font = font
        return self
    }
}

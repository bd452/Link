//
//  UILabel+Modifiers.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation


class Label: UILabel {
    public func color(_ color: UIColor) -> Label {
        self.textColor = color
        return self
    }
    public func text(_ text: String) -> Label {
        self.text = text
        return self
    }
    public func font(_ font: UIFont) -> Label {
        self.font = font
        return self
    }
}

//
//  AttributedString.swift
//  Link
//
//  Created by BRYCE P DOUGHERTY on 10/14/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import Foundation

public typealias AttributedString = NSMutableAttributedString



public extension AttributedString {
    func font(_ font: UIFont) -> Self {
        self.addAttribute(.font, value: font, range: NSRange(location: 0, length: self.length))
        return self
    }
    func color(_ color: UIColor) -> Self {
        self.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: self.length))
        return self
    }
    func underlineStyle(_ style: NSUnderlineStyle) -> Self {
        self.addAttribute(.underlineStyle, value: style.rawValue, range: NSRange(location: 0, length: self.length))
        return self
    }
    func underlineColor(_ color: UIColor) -> Self {
        self.addAttribute(.underlineColor, value: color, range: NSRange(location: 0, length: self.length))
        return self
    }
}
public func +=(str1: AttributedString, str2: AttributedString) {
    str1.append(str2)
}
public func +(str1: AttributedString, str2: AttributedString) -> AttributedString {
    let atr = AttributedString(attributedString: str1)
    atr.append(str2)
    return atr
}

public extension String {
    var attributed: AttributedString {
        return AttributedString(string: self)
    }
}



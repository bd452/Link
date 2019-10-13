//
//  Button.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/9/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

public typealias Button = UIButton

public extension Button {
    func title(_ title: String, for state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    func color(_ color: Color) -> Self {
        self.titleLabel?.textColor = color
        return self
    }
    func withTitleLabel(_ label: (Label?)->Void) -> Self {
        label(self.titleLabel)
        return self
    }
    func font(_ font: Font) -> Self {
        self.titleLabel?.font = font
        return self
    }
}

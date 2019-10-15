//
//  Button.swift
//  Link
//
//  Created by Bryce Dougherty on 10/9/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

public typealias Button = UIButton

public extension Button {
    func title(_ title: String, forState state: UIControl.State = .normal) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    func color(_ color: Color, forState state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: state)
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
    func image(_ image: UIImage, forState state:UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    func backgroundImage(_ image: UIImage?, forState state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    func target(_ target: Any, action: Selector, forControlEvents events: UIControl.Event) -> Self {
        self.addTarget(target, action: action, for: events)
        return self
    }
    func action(_ action: @escaping (UIView?) -> Void, forControlEvents events: UIControl.Event) -> Self {
        let sel = ActionSelector(action)
        self.addTarget(sel, action: #selector(ActionSelector.action(sender:)), for: events)
        return self
    }
    func addAction(_ action: @escaping (UIView?) -> Void, forControlEvents events: UIControl.Event) {
        let sel = ActionSelector(action)
        self.addTarget(sel, action: #selector(ActionSelector.action(sender:)), for: events)
    }
}

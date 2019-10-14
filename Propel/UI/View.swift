//
//  UIView+Construction.swift
//  Propel
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

public enum propertyConstraint {
    case width
    case height
    case left
    case right
    case top
    case bottom
}

public typealias View = UIView
/// For property modifiers

public extension View {
    convenience init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(frame: Rect(x: x, y: y, width: width, height: height))
    }
    convenience init(x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
        self.init(x, y, width, height)
    }
    func frame(_ rect: Rect) -> Self {
        self.frame = rect
        return self
    }
    func frame(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> Self {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    func size(_ size: Size) -> Self {
        self.frame <- size
        return self
    }
    func size(_ width: CGFloat, height: CGFloat) -> Self {
        self.frame <- Size(width, height)
        return self
    }
    func origin(_ origin: Point) -> Self {
        self.frame <- origin
        return self
    }
    func origin(_ x: CGFloat, _ y: CGFloat) -> Self {
        self.frame <- Point(x,y)
        return self
    }
    func backgroundColor(_ color: Color) -> Self {
        self.backgroundColor = color
        return self
    }
}

/// For regular layout

public extension View {
    func add(_ view: UIView) -> Self {
        self.addSubview(view)
        return self
    }
    static func <- (view1: View, view2: View) -> View {
        return view1.add(view2)
    }
}

/// For animation

public extension View {

}

/// For autolayout

public extension View {
    func constrain(_ type: propertyConstraint, from constraint: NSLayoutAnchor<AnyObject>? = nil, by constant: CGFloat) -> Self {
        switch type {
        case .width:
            self.widthAnchor.constraint(equalToConstant: constant)
                break
        case .height:
            self.heightAnchor.constraint(equalToConstant: constant)
            break
        case .left:
            self.leftAnchor.constraint(equalTo: constraint as! NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: constant)
            break
        case .right:
            self.rightAnchor.constraint(equalTo: constraint as! NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: constant)
            break
        case .top:
            self.topAnchor.constraint(equalTo: constraint as! NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: constant)
            break
        case .bottom:
            self.bottomAnchor.constraint(equalTo: constraint as! NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: constant)
            break
        }
        return self
    }
    
}

public extension View {
    func then(_ a: () -> Void) {
        a()
    }
}


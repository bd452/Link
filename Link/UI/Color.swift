//
//  Color.swift
//  Link
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

public typealias Color = UIColor

public typealias colorComponentsRGB = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
public typealias colorComponentsHSB = (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)

public extension Color {
     convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) {
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    convenience init(_ rgb: Int) {
        let r = CGFloat((rgb >> 16) & 0xFF)
        let g = CGFloat((rgb >> 8) & 0xFF)
        let b = CGFloat((rgb & 0xFF))
        self.init( r / 255.0, g / 255.0, b / 255.0)
    }
    convenience init(_ components: colorComponentsRGB) {
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }
    convenience init(_ color: UIColor) {
        var rgba: colorComponentsRGB = (0,0,0,0)
        color.getRed(&rgba.red, green: &rgba.green, blue: &rgba.blue, alpha: &rgba.alpha)
        self.init(rgba)
    }
    
    var rgba: colorComponentsRGB {
            var rgba: colorComponentsRGB = (0,0,0,0)
            self.getRed(&rgba.red, green: &rgba.green, blue: &rgba.blue, alpha: &rgba.alpha)
            return rgba
    }
    var hsba: colorComponentsHSB {
            var hsba: colorComponentsHSB = (0,0,0,0)
            self.getHue(&hsba.hue, saturation: &hsba.saturation, brightness: &hsba.brightness, alpha: &hsba.alpha)
            return hsba
    }
    func hue(_ hue: CGFloat) -> Color {
        let hsba = self.hsba
        return Color(hue: hue, saturation: hsba.saturation, brightness: hsba.brightness, alpha: hsba.alpha)
    }
    func saturation(_ saturation: CGFloat) -> Color {
        let hsba = self.hsba
        return Color(hue: hsba.hue, saturation: saturation, brightness: hsba.brightness, alpha: hsba.alpha)
    }
    func saturate(_ delta: CGFloat) -> Color {
        let brightness = self.hsba.brightness
        return self.brightness(brightness + delta)
    }
    func brightness(_ brightness: CGFloat) -> Color {
        let hsba = self.hsba
        return Color(hue: hsba.hue, saturation: hsba.saturation, brightness: brightness, alpha: hsba.alpha)
    }
    func brighten(_ delta: CGFloat) -> Color {
        let brightness = self.hsba.brightness
        return self.brightness(bind(0, 1, brightness))
    }
    func red(_ red: CGFloat) -> Color {
        let rgba = self.rgba
        return Color(red, rgba.green, rgba.blue, rgba.alpha)
    }
    func green(_ green: CGFloat) -> Color {
        let rgba = self.rgba
        return Color(rgba.red, green, rgba.blue, rgba.alpha)
    }
    func blue(_ blue: CGFloat) -> Color {
        let rgba = self.rgba
        return Color(rgba.red, rgba.green, blue, rgba.alpha)
    }
    func alpha(_ alpha: CGFloat) -> Color {
        return self.withAlphaComponent(alpha)
    }
}

public extension UIColor {
    var color: Color {
        get {
            return Color(self)
        }
    }
    @objc func asImage() -> UIImage? {
        let rect = CGRect(x: 0,y: 0,width: 1,height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

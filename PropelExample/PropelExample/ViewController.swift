//
//  ViewController.swift
//  PropelExample
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit
import Propel

let myView_Template = Constructor<Label>(generator:{
    return Label()
        .text("Label Text")
        .backgroundColor(#colorLiteral(red: 0.862745098, green: 0.1960784314, blue: 0.1843137255, alpha: 1))
        .frame(20, 20, 100, 20)
        .font(Font("Avenir")!.withSize(14))
        .color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
}).construct

class Vc: ViewController {
    
    override func viewDidLoad() {
        
        let myLabel = Label()
            .origin(Point(0, 0))
            .size(Size(100,20))
            .color(Color(0x323232))
            .font(Font("Avenir", 14))
            .text("Hello World")
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.textColor = UIColor(red: 50.0/255, green: 50.0/255, blue: 50.0/255, alpha: 1)
        label.font = UIFont(name: "Avenir", size: 14)
        label.shadowColor = Color(0x111111)
        label.shadowOffset = Size(5,5)
        label.text = "Hello World"
        let view = UIView().frame(0,0,10,10).mutate { (view) in
            let view = view as! UIView
            view.layer.cornerRadius = 5
            
            }.mutate(CALayer.self, "layer") { (_)->CALayer in
                let layer = CALayer()
                return layer
            }
        view.addSubview(label)
        
        super.viewDidLoad()
        self.view.addSubview(myView_Template())
        self.view.addSubview(myView_Template().text("Label Text 2").frame(50, 50, 100, 20))
    }
    
    
}


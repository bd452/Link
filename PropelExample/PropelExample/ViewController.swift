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
        super.viewDidLoad()
        self.view.addSubview(myView_Template())
        self.view.addSubview(myView_Template().text("Label Text 2").frame(50, 50, 100, 20))
    }
    
    
}


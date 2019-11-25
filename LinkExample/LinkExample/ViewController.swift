//
//  ViewController.swift
//  PropelExample
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit
import Link

class Vc: ViewController {

    override func viewDidLoad() {

        let label = UILabel()
        label.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        label.font = UIFont(name: "Avenir", size: 14)
        label.text = "text"
        label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        view <- Label()
            .font(Font("Avenir")?.withSize(14))
            .backgroundColor(.blue)
            .color(.red)
            .frame(50, 50, 100, 100)
            .text("text")

        self.view.addSubview(label)

        super.viewDidLoad()
    }

}

infix operator -=-
func -=-(a: Float, b: Float) {

}

//
//  ViewController.swift
//  PropelExample
//
//  Created by Bryce Dougherty on 10/8/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit
import Propel

let vc = ViewController()
        .mutate({ (`self`) in
            (self as! ViewController).view.backgroundColor = .blue
        })
        .didLoad({ view in
            
        })
        .didAppear({ appeared in
            
        })
        .didLayoutSubviews({
            
        })
        .didDisappear({ disappeared in
            
        })
        .prepareforSegue({ (segue, sender) in
        
        })

class Vc: ViewController {
    
    override func viewDidLoad() {
        self.addChild(vc)
        self.view.addSubview(vc.view)
        super.viewDidLoad()
    }
    
    
}


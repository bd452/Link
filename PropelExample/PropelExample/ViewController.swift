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
        
        let tableView = TableViewController(style: .plain)
            .numberOfSections(3)
            .cell { (tableView, indexPath) in
                let cell = UITableViewCell()
                    .backgroundColor([Color.red, Color.blue, Color.green][indexPath.section])
                    .mutate({ (cell) in
                        let cell = cell as! UITableViewCell
                        cell.textLabel?.text = "\(indexPath.row)"
                        cell.detailTextLabel?.text = "\(indexPath.section)"
                    })
                return cell
            }
            .cellHeight { _,_ in 50 }
            .numberOfRows { _, _ in 20 }
        self.addChild(tableView)
        self.view <- tableView.view
//        self.addChild(vc)
//        self.view.addSubview(vc.view)
        super.viewDidLoad()
    }
    
    
}


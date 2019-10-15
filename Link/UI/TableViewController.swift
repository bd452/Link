//
//  TableViewController.swift
//  Link
//
//  Created by Bryce Dougherty on 10/14/19.
//  Copyright © 2019 The Farm. All rights reserved.
//

import UIKit

open class TableViewController: UITableViewController {
    
    var cellForRowAtIndexPath: ((UITableView, IndexPath) -> UITableViewCell)?
    var numberOfRowsInSection: ((UITableView, Int) -> Int)?
    var heightForRowAtIndexPath: ((UITableView, IndexPath) -> CGFloat)?
    
    public var numberOfSections = 1
    

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    open override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightForRowAtIndexPath?(tableView, indexPath) ?? 50
    }
    override open func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.numberOfSections
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfRowsInSection?(tableView, section) ?? 0
    }

    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cellForRowAtIndexPath?(tableView, indexPath) ?? UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

public extension TableViewController {
    func cell(_ cell :@escaping (UITableView, IndexPath) -> UITableViewCell) -> Self {
        self.cellForRowAtIndexPath = cell
        return self
    }
    func numberOfRows(_ number: @escaping (UITableView, Int) -> Int) -> Self {
        self.numberOfRowsInSection = number
        return self
    }
    func cellHeight(_ height: @escaping (UITableView, IndexPath) -> CGFloat) -> Self {
        self.heightForRowAtIndexPath = height
        return self
    }
    func numberOfSections(_ number: Int) -> Self {
        self.numberOfSections = number
        return self
    }
}

//
//  ViewController.swift
//  iOS7SwiftCore
//
//  Created by MacMini on 9/21/15.
//  Copyright © 2015 Duong Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataSource: TableViewDataSource?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Init our datasource and setup the closure to handle our cell
        //modify 'AnyObject' to match your model
        
        self.tableView.registerNib(ExampleTableViewCell)
        
        let model1 = AccountModel()
        model1.email = "email1@gmail.com"
        model1.gender = "mr"
        
        let model2 = AccountModel()
        model2.email = "email2@gmail.com"
        model2.gender = "mrs"
        
        let items = [model1, model2]
        
        self.dataSource = TableViewDataSource(items: items, cellIdentifier:ExampleTableViewCell().theClassName, configureBlock: { (cell, item) -> () in
            
            if let actualCell = cell as? ExampleTableViewCell {
                    actualCell.configureCell(item as! AccountModel)
            }
        })
        
        //finally, set the table view datasource
        self.tableView.dataSource = self.dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


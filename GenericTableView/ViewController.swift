//
//  ViewController.swift
//  GenericTableView
//
//  Created by Sasha Prokhorenko on 13/12/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        For some reason data source will be nil here
//        let data = TableViewDataSource(items: recentItems, cellDescriptor: { $0.cellDescriptor })
//        self.tableView.dataSource = data
//        self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        
        OperationQueue.main.addOperation {
            let data = TableViewDataSource(items: recentItems, cellDescriptor: { $0.cellDescriptor })
            self.tableView.dataSource = data
            print("self.tableView.dataSource:", self.tableView.dataSource)
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            // Tableview still empty!
        }
    }
}

